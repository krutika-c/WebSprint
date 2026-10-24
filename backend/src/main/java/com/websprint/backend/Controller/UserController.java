package com.websprint.backend.Controller;

import java.util.Map;
import java.util.Optional;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.DTO.UserProfileDTO;
import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.FullNameUpdateRequest;
import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.PasswordUpdateRequest;
import com.websprint.backend.Model.UsernameUpdateRequest;
import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Service.MyAppUserService;

// Everything here operates on the currently logged-in user, identified
// from the JWT via the Authentication object Spring Security injects
// (see JwtAuthFilter) — the frontend never sends a user id directly.
@RestController
@RequestMapping("/api/users")
public class UserController {

    // 3–20 chars, lowercase letters/digits/underscore only. Usernames are
    // always normalized to lowercase before checking or saving, so this
    // pattern only needs to cover the lowercase form.
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[a-z0-9_]{3,20}$");

    private final MyAppUserRepository userRepository;
    private final MyAppUserService userService;
    private final PasswordEncoder passwordEncoder;

    public UserController(MyAppUserRepository userRepository,
                           @Qualifier("myAppUserService") MyAppUserService userService,
                           PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    // GET /api/users/me -> the logged-in user's profile, including username.
    // If this account predates usernames (or is a Google account created
    // before this feature existed), one is generated on the fly here so
    // the person always has something to see/edit in Settings.
    @GetMapping("/me")
    public UserProfileDTO getCurrentUser(Authentication authentication) {
        MyAppUser user = requireCurrentUser(authentication);

        if (user.getUsername() == null || user.getUsername().isBlank()) {
            String seed = (user.getFull_name() != null && !user.getFull_name().isBlank())
                    ? user.getFull_name()
                    : user.getEmail();
            user.setUsername(userService.generateUniqueUsername(seed));
            userRepository.save(user);
        }

        return UserProfileDTO.from(user);
    }

    // GET /api/users/username-availability?username=xyz
    // Public (see SecurityConfig) so the settings page can check as the
    // person types, without needing to already be "authenticated" for it
    // to be useful. If the caller IS logged in and the name checked is
    // already their own, it's reported available (renaming to what you
    // already have should never be blocked).
    @GetMapping("/username-availability")
    public ResponseEntity<?> checkUsernameAvailability(
            @RequestParam String username,
            Authentication authentication) {

        String normalized = username == null ? "" : username.trim().toLowerCase();

        if (!USERNAME_PATTERN.matcher(normalized).matches()) {
            return ResponseEntity.ok(Map.of(
                    "username", normalized,
                    "available", false,
                    "reason", "Usernames must be 3-20 characters: lowercase letters, numbers, and underscores only."
            ));
        }

        Optional<MyAppUser> existing = userRepository.findByUsername(normalized);

        boolean isOwnCurrentUsername = existing.isPresent()
                && authentication != null
                && authentication.isAuthenticated()
                && existing.get().getEmail().equalsIgnoreCase(authentication.getName());

        boolean available = existing.isEmpty() || isOwnCurrentUsername;

        return ResponseEntity.ok(Map.of(
                "username", normalized,
                "available", available,
                "reason", available ? "" : "That username is already taken."
        ));
    }

    // PUT /api/users/username  { "username": "newname" }
    // Updates the logged-in user's username after re-validating both
    // format and availability server-side (never trust the client-side
    // check alone — someone else could have grabbed it in the meantime).
    @PutMapping("/username")
    public ResponseEntity<?> updateUsername(
            @RequestBody UsernameUpdateRequest request,
            Authentication authentication) {

        MyAppUser user = requireCurrentUser(authentication);

        String normalized = request.getUsername() == null
                ? ""
                : request.getUsername().trim().toLowerCase();

        if (!USERNAME_PATTERN.matcher(normalized).matches()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "Usernames must be 3-20 characters: lowercase letters, numbers, and underscores only."
            ));
        }

        Optional<MyAppUser> existing = userRepository.findByUsername(normalized);

        if (existing.isPresent() && !existing.get().getId().equals(user.getId())) {
            return ResponseEntity.status(409).body(Map.of("error", "That username is already taken."));
        }

        user.setUsername(normalized);
        userRepository.save(user);

        return ResponseEntity.ok(UserProfileDTO.from(user));
    }

    // PUT /api/users/name  { "fullName": "New Name" }
    // Updates the logged-in user's display name. Unlike username, this
    // has no uniqueness constraint — it's just a friendly label — so the
    // only validation needed is "not blank" and "not absurdly long".
    @PutMapping("/name")
    public ResponseEntity<?> updateFullName(
            @RequestBody FullNameUpdateRequest request,
            Authentication authentication) {

        MyAppUser user = requireCurrentUser(authentication);

        String name = request.getFullName() == null ? "" : request.getFullName().trim();

        if (name.isBlank()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "Display name can't be empty."
            ));
        }

        if (name.length() > 50) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "Display name must be 50 characters or fewer."
            ));
        }

        user.setFull_name(name);
        userRepository.save(user);

        return ResponseEntity.ok(UserProfileDTO.from(user));
    }

    // PUT /api/users/password  { "currentPassword": "...", "newPassword": "..." }
    // Changes the logged-in user's password. Requires the current password
    // to be re-entered and verified server-side — never trust that whoever
    // holds a valid JWT right now is still the account owner sitting at the
    // keyboard. Accounts with no password set (Google sign-in only) can't
    // use this until they have one.
    @PutMapping("/password")
    public ResponseEntity<?> updatePassword(
            @RequestBody PasswordUpdateRequest request,
            Authentication authentication) {

        MyAppUser user = requireCurrentUser(authentication);

        if (user.getPassword_hash() == null || user.getPassword_hash().isBlank()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "This account doesn't have a WebSprint password to change — it signed in with Google."
            ));
        }

        String currentPassword = request.getCurrentPassword();
        String newPassword = request.getNewPassword();

        if (currentPassword == null || currentPassword.isBlank()) {
            return ResponseEntity.badRequest().body(Map.of("error", "Enter your current password."));
        }

        if (!passwordEncoder.matches(currentPassword, user.getPassword_hash())) {
            return ResponseEntity.status(401).body(Map.of("error", "Current password is incorrect."));
        }

        if (newPassword == null || newPassword.length() < 8) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "New password must be at least 8 characters."
            ));
        }

        if (passwordEncoder.matches(newPassword, user.getPassword_hash())) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "New password must be different from your current password."
            ));
        }

        user.setPassword_hash(passwordEncoder.encode(newPassword));
        userRepository.save(user);

        return ResponseEntity.ok(Map.of("message", "Password updated."));
    }

    private MyAppUser requireCurrentUser(Authentication authentication) {
        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("No user found for the current session"));
    }
}