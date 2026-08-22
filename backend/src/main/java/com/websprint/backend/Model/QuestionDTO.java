package com.websprint.backend.Model;

import java.util.List;

public record QuestionDTO(Long id, String questionText, String questionType, List<OptionDTO> options) {
    public static QuestionDTO from(Question q) {
        List<OptionDTO> opts = q.getOptions().stream().map(OptionDTO::from).toList();
        return new QuestionDTO(q.getId(), q.getQuestionText(), q.getQuestionType(), opts);
    }
}