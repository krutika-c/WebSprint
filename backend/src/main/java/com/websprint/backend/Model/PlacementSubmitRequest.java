package com.websprint.backend.Model;

import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;

/** What the frontend sends when the whole placement test (all subjects) is
 *  finished: every answer across every subject, in one shot. */
public record PlacementSubmitRequest(
        @NotNull(message = "answers are required")
        @Valid
        List<PlacementAnswerItem> answers) {
}
