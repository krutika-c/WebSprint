package com.websprint.backend.Service;

import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websprint.backend.DTO.PlacementResultDTO;
import com.websprint.backend.DTO.SubjectPlacementResultDTO;
import com.websprint.backend.Exception.PlacementAlreadyTakenException;
import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.Level;
import com.websprint.backend.Model.LevelStatus;
import com.websprint.backend.Model.PlacementAnswerItem;
import com.websprint.backend.Model.PlacementQuestion;
import com.websprint.backend.Model.Subject;
import com.websprint.backend.Model.UserLevelProgress;
import com.websprint.backend.Model.UserPlacementResult;
import com.websprint.backend.Model.XpEvent;
import com.websprint.backend.Model.XpReason;
import com.websprint.backend.Repository.LevelRepository;
import com.websprint.backend.Repository.PlacementQuestionRepository;
import com.websprint.backend.Repository.UserLevelProgressRepository;
import com.websprint.backend.Repository.UserPlacementResultRepository;
import com.websprint.backend.Repository.XpEventRepository;

@Service
public class PlacementService {

    /** XP given for each level the placement test lets the user skip.
     *  Keep this well below what actually playing a level earns (roughly a fifth). */
    private static final int PLACEMENT_BONUS_PER_SKIPPED_LEVEL = 20;

    private final PlacementQuestionRepository placementQuestionRepository;
    private final LevelRepository levelRepository;
    private final UserLevelProgressRepository progressRepository;
    private final UserPlacementResultRepository placementResultRepository;
    private final XpEventRepository xpEventRepository;

    public PlacementService(PlacementQuestionRepository placementQuestionRepository,
                             LevelRepository levelRepository,
                             UserLevelProgressRepository progressRepository,
                             UserPlacementResultRepository placementResultRepository,
                             XpEventRepository xpEventRepository) {
        this.placementQuestionRepository = placementQuestionRepository;
        this.levelRepository = levelRepository;
        this.progressRepository = progressRepository;
        this.placementResultRepository = placementResultRepository;
        this.xpEventRepository = xpEventRepository;
    }

    public List<PlacementQuestion> getAllQuestions() {
        return placementQuestionRepository.findAllByOrderBySubjectIdAscOrderIndexAsc();
    }

    /** True once this user has ever successfully submitted the placement test.
     *  Drives both "START GAME -> main page instead of the quiz" on the frontend
     *  and the server-side one-time guard in submitPlacement below. */
    @Transactional(readOnly = true)
    public boolean hasTaken(Long userId) {
        return placementResultRepository.existsByUserId(userId);
    }

    private record Grade(int correct, int total, int scorePercent) {
    }

    /**
     * Grades every subject's answers, works out a starting level per subject,
     * backfills that user's level progress to match, awards a small XP bonus for
     * the levels skipped, and records the result.
     * @Transactional so a failure partway through never leaves one subject
     * updated and another not (and never leaves progress saved without its XP).
     *
     * The test can only ever be taken once per user — enforced here (not just
     * hidden in the UI) so a direct/replayed API call can't retake it either.
     */
    @Transactional
    public PlacementResultDTO submitPlacement(Long userId, List<PlacementAnswerItem> answers) {

        if (hasTaken(userId)) {
            throw new PlacementAlreadyTakenException("You've already taken the placement test");
        }

        List<PlacementQuestion> allQuestions = getAllQuestions();
        if (allQuestions.isEmpty()) {
            throw new ResourceNotFoundException("No placement questions configured");
        }

        Map<Long, Long> chosen = new HashMap<>(); // questionId -> optionId
        for (PlacementAnswerItem a : answers) {
            chosen.put(a.questionId(), a.optionId());
        }

        // Group the question bank by subject so each subject is graded and
        // placed independently of the others.
        Map<Long, List<PlacementQuestion>> bySubject = new HashMap<>();
        for (PlacementQuestion q : allQuestions) {
            bySubject.computeIfAbsent(q.getSubject().getId(), k -> new ArrayList<>()).add(q);
        }

        List<SubjectPlacementResultDTO> results = new ArrayList<>();

        for (Map.Entry<Long, List<PlacementQuestion>> entry : bySubject.entrySet()) {
            Long subjectId = entry.getKey();
            List<PlacementQuestion> subjectQuestions = entry.getValue();
            Subject subject = subjectQuestions.get(0).getSubject();

            Grade grade = grade(subjectQuestions, chosen);

            List<Level> levels = levelRepository.findBySubjectCodeOrderByLevelNumber(subject.getCode());
            if (levels.isEmpty()) {
                continue; // a subject with questions but no levels yet — nothing to place into
            }

            int placedIndex = placementIndex(grade.scorePercent(), levels.size());
            Level placedLevel = levels.get(placedIndex);

            // Levels before the placed one: treated as already mastered.
            // Count only the ones THIS call newly completed, so a level the user
            // already played (and earned XP for) isn't paid a second time.
            int newlySkipped = 0;
            for (int i = 0; i < placedIndex; i++) {
                if (ensureAtLeastCompleted(userId, levels.get(i).getId())) {
                    newlySkipped++;
                }
            }

            // Small one-time reward: ledger row (the history) + running total on the user.
            int bonus = newlySkipped * PLACEMENT_BONUS_PER_SKIPPED_LEVEL;
            if (bonus > 0) {
                xpEventRepository.save(
                        new XpEvent(userId, bonus, XpReason.PLACEMENT_BONUS, placedLevel.getId()));
                xpEventRepository.incrementTotalXp(userId, bonus);
            }

            // The placed level itself: open, but still has to be actually played
            // (and passed) to count as completed and earn XP.
            ensureAtLeastUnlocked(userId, placedLevel.getId());

            upsertPlacementResult(userId, subjectId, grade.scorePercent(), placedLevel.getId());

            results.add(new SubjectPlacementResultDTO(
                    subject.getCode(),
                    subject.getName(),
                    grade.correct(),
                    grade.total(),
                    grade.scorePercent(),
                    placedLevel.getLevelNumber(),
                    placedLevel.getId()));
        }

        return new PlacementResultDTO(results);
    }

    /**
     * Grades one subject. `correct` and `total` stay plain counts (for display,
     * e.g. "7 of 10"), but `scorePercent` is WEIGHTED by each question's
     * difficulty: a correct answer earns `difficulty` points, and the score is
     * points earned / points available. So hard questions move the score more
     * than easy ones.
     */
    private Grade grade(List<PlacementQuestion> questions, Map<Long, Long> chosen) {
        int correct = 0;
        int earnedWeight = 0;
        int totalWeight = 0;

        for (PlacementQuestion q : questions) {
            int weight = q.getDifficulty();
            totalWeight += weight;

            Long optionId = chosen.get(q.getId());
            if (optionId != null && q.getOptions().stream()
                    .anyMatch(o -> o.getId().equals(optionId) && o.isCorrect())) {
                correct++;
                earnedWeight += weight;
            }
        }

        int total = questions.size();
        int scorePercent = totalWeight == 0 ? 0 : Math.round(earnedWeight * 100f / totalWeight);
        return new Grade(correct, total, scorePercent);
    }

    /**
     * Maps a 0-100 score onto an index into an ordered level list. 0% -> level 1
     * (index 0); 100% -> the last level. Linear in between, rounded to the
     * nearest level. Tune the curve here if you want fewer/more levels skipped
     * for a given score (e.g. require a higher score before skipping anything).
     */
    private int placementIndex(int scorePercent, int levelCount) {
        int index = Math.round((scorePercent / 100f) * (levelCount - 1));
        return Math.max(0, Math.min(index, levelCount - 1));
    }

    /** Marks a level completed, but never downgrades a level that's already
     *  completed (e.g. from real play before the user took this test).
     *  @return true only if THIS call is what completed the level. */
    private boolean ensureAtLeastCompleted(Long userId, Long levelId) {
        UserLevelProgress progress = progressRepository.findByUserIdAndLevelId(userId, levelId)
                .orElseGet(() -> new UserLevelProgress(userId, levelId, LevelStatus.locked));

        boolean newlyCompleted = progress.getStatus() != LevelStatus.completed;
        if (newlyCompleted) {
            progress.setStatus(LevelStatus.completed);
            progress.setCompletedAt(Instant.now());
        }
        progressRepository.save(progress);
        return newlyCompleted;
    }

    /** Opens a level if it was locked; leaves it alone if it's already
     *  unlocked or completed. */
    private void ensureAtLeastUnlocked(Long userId, Long levelId) {
        UserLevelProgress progress = progressRepository.findByUserIdAndLevelId(userId, levelId)
                .orElseGet(() -> new UserLevelProgress(userId, levelId, LevelStatus.locked));
        if (progress.getStatus() == LevelStatus.locked) {
            progress.setStatus(LevelStatus.unlocked);
        }
        progressRepository.save(progress);
    }

    /** One result per (user, subject). submitPlacement() already guarantees this
     *  only ever runs once per user (see the hasTaken() guard above), so this
     *  is always an insert in practice — the find-or-create here is just a
     *  safety net against a duplicate call racing itself. */
    private void upsertPlacementResult(Long userId, Long subjectId, int score, Long placedLevelId) {
        Optional<UserPlacementResult> existing = placementResultRepository.findByUserIdAndSubjectId(userId, subjectId);
        UserPlacementResult result = existing.orElseGet(() ->
                new UserPlacementResult(userId, subjectId, score, placedLevelId));
        result.setScore(score);
        result.setPlacedLevelId(placedLevelId);
        placementResultRepository.save(result);
    }
}