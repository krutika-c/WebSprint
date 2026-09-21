package com.websprint.backend.Model;

import java.time.Instant;

/** One row of the progress list. */
public record LevelProgressResponse(
        Long levelId,
        LevelStatus status,
        Integer score,
        int attempts,
        Instant completedAt) {
}