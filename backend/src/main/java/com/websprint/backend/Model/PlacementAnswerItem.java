package com.websprint.backend.Model;

import jakarta.validation.constraints.NotNull;

/** One chosen answer in the placement test: "for question X, picked option Y".
 *  The question already knows its own subject, so the subject isn't repeated here. */
public record PlacementAnswerItem(
        @NotNull(message = "questionId is required") Long questionId,
        @NotNull(message = "optionId is required") Long optionId) {
}
