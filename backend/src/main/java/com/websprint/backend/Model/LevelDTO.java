package com.websprint.backend.Model;

public record LevelDTO(Long id, Integer levelNumber, String difficulty, String title) {
    public static LevelDTO from(Level l) {
        return new LevelDTO(l.getId(), l.getLevelNumber(), l.getDifficulty(), l.getTitle());
    }
}
