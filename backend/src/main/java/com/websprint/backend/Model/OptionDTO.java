package com.websprint.backend.Model;


public record OptionDTO(Long id, String optionLabel, String optionText) {
    // deliberately no isCorrect field, validation is done server side
    public static OptionDTO from(QuestionOption o) {
        return new OptionDTO(o.getId(), o.getOptionLabel(), o.getOptionText());
    }
}
