package com.websprint.backend.DTO;

import com.websprint.backend.Model.Lesson;

public record LessonDTO(Long id, String contentMarkdown) {
    public static LessonDTO from(Lesson l) {
        return new LessonDTO(l.getId(), l.getContentMarkdown());
    }
}
