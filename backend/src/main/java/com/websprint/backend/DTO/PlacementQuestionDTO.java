package com.websprint.backend.DTO;

import java.util.List;

import com.websprint.backend.Model.PlacementQuestion;

public record PlacementQuestionDTO(
        Long id,
        String subjectCode,
        String questionText,
        String questionType,
        List<PlacementOptionDTO> options) {

    public static PlacementQuestionDTO from(PlacementQuestion q) {
        List<PlacementOptionDTO> opts = q.getOptions().stream().map(PlacementOptionDTO::from).toList();
        return new PlacementQuestionDTO(
                q.getId(), q.getSubject().getCode(), q.getQuestionText(), q.getQuestionType(), opts);
    }
}
