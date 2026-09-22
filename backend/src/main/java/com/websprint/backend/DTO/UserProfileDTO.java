package com.websprint.backend.DTO;

import java.time.Instant;

import com.websprint.backend.Model.MyAppUser;

public record UserProfileDTO(Long id, String fullName, String email, String username, boolean hasPassword, Instant createdAt) {
    public static UserProfileDTO from(MyAppUser user) {
        return new UserProfileDTO(
                user.getId(),
                user.getFull_name(),
                user.getEmail(),
                user.getUsername(),
                user.getPassword_hash() != null && !user.getPassword_hash().isBlank(),
                user.getCreated_at()
        );
    }
}