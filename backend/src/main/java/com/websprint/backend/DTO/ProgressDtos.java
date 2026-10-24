package com.websprint.backend.DTO;

import java.time.Instant;
import java.util.List;

import com.websprint.backend.Model.LevelStatus;
import com.websprint.backend.Model.XpReason;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

/**
 * All DTOs for the progress feature. Each "record" is an immutable data holder;
 * Spring converts them to/from JSON automatically.
 */
public final class ProgressDtos {

    private ProgressDtos() {
    }

    /** What the frontend sends: the score as a percentage (0-100). */
    public record SubmitResultRequest(
            @NotNull(message = "score is required")
            @Min(value = 0, message = "score must be between 0 and 100")
            @Max(value = 100, message = "score must be between 0 and 100")
            Integer score) {
    }

    /** One XP reward, e.g. LEVEL_COMPLETED +100. */
    public record XpAward(XpReason reason, int amount) {
    }

    /** What we send back after a submission, so the UI can show everything without extra calls. */
    public record SubmitResultResponse(
            Long levelId,
            LevelStatus status,
            Integer bestScore,
            int attempts,
            boolean passed,
            int xpGained,
            List<XpAward> xpAwards,
            int totalXp,
            int currentStreak,
            int longestStreak,
            Long unlockedLevelId) { // null unless this submission unlocked a new level
    }

    /** One row of the progress list. */
    public record LevelProgressResponse(
            Long levelId,
            LevelStatus status,
            Integer score,
            int attempts,
            Instant completedAt) {
    }

    public record StatsResponse(int totalXp, int currentStreak, int longestStreak) {
    }
}