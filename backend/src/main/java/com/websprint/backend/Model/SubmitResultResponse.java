package com.websprint.backend.Model;

import java.util.List;

/** What we send back after a submission, so the UI can show everything without extra calls. */
public record SubmitResultResponse(
        Long levelId,
        LevelStatus status,
        int score,             // this attempt, 0-100 (calculated by the server)
        Integer bestScore,     // best across all attempts
        int correctCount,
        int totalQuestions,
        int attempts,
        boolean passed,
        int xpGained,
        List<XpAward> xpAwards,
        int totalXp,
        int currentStreak,
        int longestStreak,
        Long unlockedLevelId) { // null unless this submission unlocked a new level
}