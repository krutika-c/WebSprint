package com.websprint.backend.DTO;

/** One subject's slice of the placement result — enough for test-result.html
 *  to show the score bar and "Start from Level N" line without another call. */
public record SubjectPlacementResultDTO(
        String subjectCode,
        String subjectName,
        int correctCount,
        int totalQuestions,
        int scorePercent,
        int placedLevelNumber,
        Long placedLevelId) {
}
