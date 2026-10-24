package com.websprint.backend.Exception;

public record ErrorResponse(String message, int status, String path) {}