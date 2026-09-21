package com.websprint.backend.Service;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websprint.backend.Exception.LevelLockedException;
import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.AnswerItem;
import com.websprint.backend.Model.Level;
import com.websprint.backend.Model.LevelProgressResponse;
import com.websprint.backend.Model.LevelStatus;
import com.websprint.backend.Model.Question;
import com.websprint.backend.Model.StatsResponse;
import com.websprint.backend.Model.SubmitResultResponse;
import com.websprint.backend.Model.UserLevelProgress;
import com.websprint.backend.Model.UserStreak;
import com.websprint.backend.Model.XpAward;
import com.websprint.backend.Model.XpEvent;
import com.websprint.backend.Model.XpReason;
import com.websprint.backend.Repository.LevelRepository;
import com.websprint.backend.Repository.QuestionRepository;
import com.websprint.backend.Repository.UserLevelProgressRepository;
import com.websprint.backend.Repository.XpEventRepository;
import com.websprint.backend.Service.StreakService.StreakResult;
import com.websprint.backend.Service.StreakService.StreakView;

@Service
public class ProgressService {

    // ---- Game rules: change these numbers freely ----
    static final int PASS_MARK = 60;              // score (%) needed to complete a level
    static final int PERFECT_SCORE = 100;
    static final int XP_LEVEL_COMPLETED = 100;    // once per level, ever
    static final int XP_PERFECT_SCORE = 50;       // once per level, ever
    static final int XP_STREAK_BONUS = 50;        // every Nth consecutive day
    static final int STREAK_BONUS_EVERY_N_DAYS = 7;

    private final UserLevelProgressRepository progressRepository;
    private final XpEventRepository xpRepository;
    private final LevelRepository levelRepository;
    private final QuestionRepository questionRepository;
    private final StreakService streakService;

    public ProgressService(UserLevelProgressRepository progressRepository,
                           XpEventRepository xpRepository,
                           LevelRepository levelRepository,
                           QuestionRepository questionRepository,
                           StreakService streakService) {
        this.progressRepository = progressRepository;
        this.xpRepository = xpRepository;
        this.levelRepository = levelRepository;
        this.questionRepository = questionRepository;
        this.streakService = streakService;
    }

    private record Grade(int correct, int total, int score) {
    }

    /**
     * Handles one finished quiz. The server marks the answers itself, so the client can no
     * longer claim a score. @Transactional makes every database change below succeed or fail together.
     */
    @Transactional
    public SubmitResultResponse submitLevelResult(Long userId, Long levelId, List<AnswerItem> answers) {
        if (xpRepository.findTotalXp(userId) == null) {
            throw new ResourceNotFoundException("User not found");
        }

        Level level = levelRepository.findById(levelId)
                .orElseThrow(() -> new ResourceNotFoundException("Level " + levelId + " not found"));

        // Levels belong to a subject (HTML / CSS / JS). Unlocking only moves within that subject.
        List<Level> subjectLevels = levelsInSubject(level.getSubject().getId());
        int levelIndex = indexOf(subjectLevels, levelId);

        // A missing row means "never touched". Only the first level of a subject is open by default.
        UserLevelProgress progress = progressRepository.findByUserIdAndLevelId(userId, levelId)
                .orElseGet(() -> {
                    if (levelIndex == 0) {
                        return new UserLevelProgress(userId, levelId, LevelStatus.unlocked);
                    }
                    throw new LevelLockedException("Level " + levelId + " is locked");
                });
        if (progress.getStatus() == LevelStatus.locked) {
            throw new LevelLockedException("Level " + levelId + " is locked");
        }

        // 1) The server works out the score from the submitted answers.
        Grade grade = grade(levelId, answers);
        int score = grade.score();
        boolean passed = score >= PASS_MARK;
        boolean firstCompletion = passed && progress.getStatus() != LevelStatus.completed;

        // 2) Update the progress row.
        progress.setAttempts(progress.getAttempts() + 1);
        if (progress.getScore() == null || score > progress.getScore()) {
            progress.setScore(score); // keep the best score
        }
        if (firstCompletion) {
            progress.setStatus(LevelStatus.completed);
            progress.setCompletedAt(Instant.now());
        }
        progressRepository.save(progress);

        // 3) XP rewards. One-time rewards are checked against the ledger (xp_events),
        //    which is the source of truth, so replaying a level can never pay them again.
        List<XpAward> awards = new ArrayList<>();
        if (firstCompletion && !xpRepository.existsByUserIdAndLevelIdAndReason(
                userId, levelId, XpReason.LEVEL_COMPLETED)) {
            awards.add(new XpAward(XpReason.LEVEL_COMPLETED, XP_LEVEL_COMPLETED));
        }
        if (score == PERFECT_SCORE && !xpRepository.existsByUserIdAndLevelIdAndReason(
                userId, levelId, XpReason.PERFECT_SCORE)) {
            awards.add(new XpAward(XpReason.PERFECT_SCORE, XP_PERFECT_SCORE));
        }

        // 4) Unlock the next level of the same subject.
        Long unlockedLevelId = null;
        if (firstCompletion && levelIndex + 1 < subjectLevels.size()) {
            unlockedLevelId = unlockLevel(userId, subjectLevels.get(levelIndex + 1).getId());
        }

        // 5) Any attempt counts as activity for the streak.
        StreakResult streakResult = streakService.recordActivity(userId);
        UserStreak streak = streakResult.streak();
        if (streakResult.extendedToday()
                && streak.getCurrentStreak() % STREAK_BONUS_EVERY_N_DAYS == 0) {
            awards.add(new XpAward(XpReason.STREAK_BONUS, XP_STREAK_BONUS));
        }

        // 6) Record every award in the ledger, then bump the running total once.
        int xpGained = 0;
        for (XpAward award : awards) {
            Long eventLevelId = award.reason() == XpReason.STREAK_BONUS ? null : levelId;
            xpRepository.save(new XpEvent(userId, award.amount(), award.reason(), eventLevelId));
            xpGained += award.amount();
        }
        if (xpGained > 0) {
            xpRepository.incrementTotalXp(userId, xpGained);
        }
        int totalXp = xpRepository.findTotalXp(userId);

        return new SubmitResultResponse(
                levelId,
                progress.getStatus(),
                score,
                progress.getScore(),
                grade.correct(),
                grade.total(),
                progress.getAttempts(),
                passed,
                xpGained,
                awards,
                totalXp,
                streak.getCurrentStreak(),
                streak.getLongestStreak(),
                unlockedLevelId);
    }

    /**
     * Marks the answers against the correct options stored in the database.
     * The total is the number of questions in the level (not the number submitted),
     * so skipping questions lowers the score. Answers for questions that aren't in
     * this level are ignored.
     */
    private Grade grade(Long levelId, List<AnswerItem> answers) {
        List<Question> questions = questionRepository.findByLevelIdOrderByOrderIndex(levelId);
        if (questions.isEmpty()) {
            throw new ResourceNotFoundException("Level " + levelId + " has no questions");
        }

        Map<Long, Long> chosen = new HashMap<>(); // questionId -> optionId (last one wins if repeated)
        for (AnswerItem a : answers) {
            chosen.put(a.questionId(), a.optionId());
        }

        int correct = 0;
        for (Question q : questions) {
            Long optionId = chosen.get(q.getId());
            if (optionId != null && q.getOptions().stream()
                    .anyMatch(o -> o.getId().equals(optionId) && o.isCorrect())) {
                correct++;
            }
        }

        int total = questions.size();
        return new Grade(correct, total, Math.round(correct * 100f / total));
    }

    /** Returns the level id if it was newly unlocked, or null if it was already open. */
    private Long unlockLevel(Long userId, Long nextLevelId) {
        Optional<UserLevelProgress> existing = progressRepository.findByUserIdAndLevelId(userId, nextLevelId);

        if (existing.isEmpty()) {
            progressRepository.save(new UserLevelProgress(userId, nextLevelId, LevelStatus.unlocked));
            return nextLevelId;
        }
        UserLevelProgress next = existing.get();
        if (next.getStatus() == LevelStatus.locked) {
            next.setStatus(LevelStatus.unlocked);
            progressRepository.save(next);
            return nextLevelId;
        }
        return null;
    }

    /** All levels, grouped by subject and in level order. */
    private List<Level> allLevelsOrdered() {
        return levelRepository.findAll(Sort.by("subject.id", "levelNumber"));
    }

    private List<Level> levelsInSubject(Long subjectId) {
        return allLevelsOrdered().stream()
                .filter(l -> l.getSubject().getId().equals(subjectId))
                .toList();
    }

    private int indexOf(List<Level> levels, Long levelId) {
        for (int i = 0; i < levels.size(); i++) {
            if (levels.get(i).getId().equals(levelId)) {
                return i;
            }
        }
        return -1;
    }

    /**
     * Every level with this user's status. A level with no row is locked, except the
     * first level of each subject, which is open from the start.
     */
    @Transactional(readOnly = true)
    public List<LevelProgressResponse> getProgress(Long userId) {
        Map<Long, UserLevelProgress> byLevel = progressRepository.findByUserId(userId).stream()
                .collect(Collectors.toMap(UserLevelProgress::getLevelId, p -> p));

        Set<Long> subjectsSeen = new HashSet<>();
        List<LevelProgressResponse> result = new ArrayList<>();
        for (Level level : allLevelsOrdered()) {
            boolean firstOfSubject = subjectsSeen.add(level.getSubject().getId());
            UserLevelProgress p = byLevel.get(level.getId());
            if (p != null) {
                result.add(new LevelProgressResponse(
                        level.getId(), p.getStatus(), p.getScore(), p.getAttempts(), p.getCompletedAt()));
            } else {
                LevelStatus status = firstOfSubject ? LevelStatus.unlocked : LevelStatus.locked;
                result.add(new LevelProgressResponse(level.getId(), status, null, 0, null));
            }
        }
        return result;
    }

    @Transactional(readOnly = true)
    public StatsResponse getStats(Long userId) {
        Integer totalXp = xpRepository.findTotalXp(userId);
        if (totalXp == null) {
            throw new ResourceNotFoundException("User not found");
        }
        StreakView streak = streakService.getStreak(userId);
        return new StatsResponse(totalXp, streak.current(), streak.longest());
    }
}