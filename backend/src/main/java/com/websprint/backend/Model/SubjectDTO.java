package com.websprint.backend.Model;

public record SubjectDTO(Long id, String code, String name) {
    public static SubjectDTO from(Subject s) {
        return new SubjectDTO(s.getId(), s.getCode(), s.getName());
    }
}
