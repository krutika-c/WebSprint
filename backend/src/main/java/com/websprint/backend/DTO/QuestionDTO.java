package com.websprint.backend.DTO;

import java.util.List;

import com.websprint.backend.Model.Question;

public record QuestionDTO(Long id, String questionText, String questionType, List<OptionDTO> options) {
    public static QuestionDTO from(Question q) {
        List<OptionDTO> opts = q.getOptions().stream().map(OptionDTO::from).toList();
        return new QuestionDTO(q.getId(), q.getQuestionText(), q.getQuestionType(), opts);
    }
}