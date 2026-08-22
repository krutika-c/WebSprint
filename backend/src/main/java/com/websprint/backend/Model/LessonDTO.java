package com.websprint.backend.Model;

public record LessonDTO(Long id, String contentMarkdown) {
    public static LessonDTO from(Lesson l) {
        return new LessonDTO(l.getId(), l.getContentMarkdown());
    }
}
