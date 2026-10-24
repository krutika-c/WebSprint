package com.websprint.backend.Exception;

public class PlacementAlreadyTakenException extends RuntimeException {
    public PlacementAlreadyTakenException(String message) {
        super(message);
    }
}