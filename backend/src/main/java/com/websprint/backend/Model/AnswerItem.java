package com.websprint.backend.Model;

import jakarta.validation.constraints.NotNull;

/** One chosen answer: "for question X, the user picked option Y". */
public record AnswerItem(
        @NotNull(message = "questionId is required") Long questionId,
        @NotNull(message = "optionId is required") Long optionId) {
}