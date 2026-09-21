package com.websprint.backend.Model;

import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;

/** What the frontend sends when a quiz is finished: every answer. The server works out the score. */
public record SubmitAnswersRequest(
        @NotNull(message = "answers are required")
        @Valid
        List<AnswerItem> answers) {
}