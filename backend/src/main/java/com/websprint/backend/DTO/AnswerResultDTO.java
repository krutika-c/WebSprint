package com.websprint.backend.DTO;

public record AnswerResultDTO(boolean correct, String explanation, Long correctOptionId) {}