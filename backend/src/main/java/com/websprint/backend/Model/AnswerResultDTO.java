package com.websprint.backend.Model;

public record AnswerResultDTO(boolean correct, String explanation, Long correctOptionId) {}