package com.websprint.backend.Model;

public record UserProfileDTO(Long id, String fullName, String email, String username) {
    public static UserProfileDTO from(MyAppUser user) {
        return new UserProfileDTO(
                user.getId(),
                user.getFull_name(),
                user.getEmail(),
                user.getUsername()
        );
    }
}