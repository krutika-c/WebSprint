package com.websprint.backend.Model;

import java.security.SecureRandom;
import java.util.Optional;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor // Lombok automatically creates the constructor for repository injection
public class MyAppUserService implements UserDetailsService {

    private static final SecureRandom RANDOM = new SecureRandom();

    private final MyAppUserRepository repository; 

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    Optional<MyAppUser> user = repository.findByEmail(username);

    if (user.isPresent()) {
        MyAppUser userObj = user.get();

        return User.builder()
            .username(userObj.getEmail())
            .password(userObj.getPassword_hash())
            .roles("USER")
            .build();
    } else {
        throw new UsernameNotFoundException("User not found with identifier: " + username);
    }
}

    // ==================================================
    // USERNAME AVAILABILITY / DEFAULTS
    // ==================================================

    /**
     * True if nobody else is currently using this username.
     * Case-insensitive so "CodeMaster" and "codemaster" can't both exist.
     */
    public boolean isUsernameAvailable(String candidate) {
        if (candidate == null || candidate.isBlank()) {
            return false;
        }
        return repository.findByUsername(candidate.toLowerCase()).isEmpty();
    }

    /**
     * Builds a clean, unique username to hand a user by default —
     * either right after signup, or the first time an older account
     * (created before usernames existed) touches an endpoint that
     * needs one. Never throws for bad input; falls back to "user".
     */
    public String generateUniqueUsername(String seed) {

        String base = sanitize(seed);

        if (base.isBlank()) {
            base = "user";
        }

        if (base.length() > 20) {
            base = base.substring(0, 20);
        }

        // Try the clean base first — most people get exactly their name.
        if (isUsernameAvailable(base)) {
            return base;
        }

        // Then a few small numeric suffixes (codemaster2, codemaster3...).
        for (int suffix = 2; suffix <= 20; suffix++) {
            String candidate = base + suffix;
            if (isUsernameAvailable(candidate)) {
                return candidate;
            }
        }

        // Extremely unlikely fallback: a random 4-digit tag.
        for (int attempt = 0; attempt < 20; attempt++) {
            String candidate = base + (1000 + RANDOM.nextInt(9000));
            if (isUsernameAvailable(candidate)) {
                return candidate;
            }
        }

        // Should never get here, but guarantee *something* unique.
        return base + System.currentTimeMillis();
    }

    /**
     * Lowercases, strips anything that isn't a letter/digit/underscore,
     * and takes just the part before an "@" if an email slipped in.
     */
    private String sanitize(String raw) {
        if (raw == null) {
            return "";
        }
        String beforeAt = raw.contains("@") ? raw.substring(0, raw.indexOf('@')) : raw;
        return beforeAt
                .toLowerCase()
                .replaceAll("[^a-z0-9_]", "");
    }
}