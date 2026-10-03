package com.websprint.backend.Service;

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
import com.websprint.backend.Repository.LevelRepository;
import com.websprint.backend.Repository.PlacementQuestionRepository;
import com.websprint.backend.Repository.UserLevelProgressRepository;
import com.websprint.backend.Repository.UserPlacementResultRepository;

@Service
public class PlacementService {

    private final PlacementQuestionRepository placementQuestionRepository;
    private final LevelRepository levelRepository;
    private final UserLevelProgressRepository progressRepository;
    private final UserPlacementResultRepository placementResultRepository;

    public PlacementService(PlacementQuestionRepository placementQuestionRepository,
                             LevelRepository levelRepository,
                             UserLevelProgressRepository progressRepository,
                             UserPlacementResultRepository placementResultRepository) {
        this.placementQuestionRepository = placementQuestionRepository;
        this.levelRepository = levelRepository;
        this.progressRepository = progressRepository;
        this.placementResultRepository = placementResultRepository;
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
     * backfills that user's level progress to match, and records the result.
     * @Transactional so a failure partway through never leaves one subject
     * updated and another not.
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
            for (int i = 0; i < placedIndex; i++) {
                ensureAtLeastCompleted(userId, levels.get(i).getId());
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

    private Grade grade(List<PlacementQuestion> questions, Map<Long, Long> chosen) {
        int correct = 0;
        for (PlacementQuestion q : questions) {
            Long optionId = chosen.get(q.getId());
            if (optionId != null && q.getOptions().stream()
                    .anyMatch(o -> o.getId().equals(optionId) && o.isCorrect())) {
                correct++;
            }
        }
        int total = questions.size();
        int scorePercent = Math.round(correct * 100f / total);
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
     *  completed (e.g. from real play before the user took this test). */
    private void ensureAtLeastCompleted(Long userId, Long levelId) {
        UserLevelProgress progress = progressRepository.findByUserIdAndLevelId(userId, levelId)
                .orElseGet(() -> new UserLevelProgress(userId, levelId, LevelStatus.locked));
        if (progress.getStatus() != LevelStatus.completed) {
            progress.setStatus(LevelStatus.completed);
        }
        progressRepository.save(progress);
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