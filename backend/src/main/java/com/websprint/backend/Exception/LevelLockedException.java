package com.websprint.backend.Exception;

public class LevelLockedException extends RuntimeException {
    public LevelLockedException(String message) {
        super(message);
    }
}