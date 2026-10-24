package com.websprint.backend.DTO;

import com.websprint.backend.Model.PlacementQuestionOption;

public record PlacementOptionDTO(Long id, String optionLabel, String optionText) {
    // deliberately no isCorrect field, grading is done server side
    public static PlacementOptionDTO from(PlacementQuestionOption o) {
        return new PlacementOptionDTO(o.getId(), o.getOptionLabel(), o.getOptionText());
    }
}
