package com.websprint.backend.Controller;

import java.time.Instant;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.SignupRequest;
import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Security.JwtUtil;
import com.websprint.backend.Service.MyAppUserService;

// CHANGED from @Controller to @RestController — this now returns JSON
@RestController
public class RegistrationController {

    // Username is now chosen at signup itself (see UserController for the
    // identical rule applied when someone changes it later from Settings):
    // 3-20 chars, lowercase letters/digits/underscore only.
    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[a-z0-9_]{3,20}$");

    private final MyAppUserRepository myAppUserRepository;
    private final MyAppUserService myAppUserService;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public RegistrationController(MyAppUserRepository myAppUserRepository,
                                   MyAppUserService myAppUserService,
                                   PasswordEncoder passwordEncoder,
                                   JwtUtil jwtUtil) {
        this.myAppUserRepository = myAppUserRepository;
        this.myAppUserService = myAppUserService;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/api/signup")
    public ResponseEntity<?> createUser(@RequestBody SignupRequest request) {

        if (myAppUserRepository.findByEmail(request.getEmail()).isPresent()) {
            return ResponseEntity.status(409).body(Map.of("error", "Email already registered"));
        }

        if (request.getPassword() == null || !request.getPassword().equals(request.getConfirmPassword())) {
            return ResponseEntity.badRequest().body(Map.of("error", "Passwords do not match"));
        }

        // Username is now collected right on the signup form (rather than
        // being auto-generated and left for the person to change later in
        // Settings), so it's validated the same way a change in Settings
        // would be: normalized to lowercase, format-checked, and confirmed
        // still available server-side before we trust it.
        String normalizedUsername = request.getUsername() == null
                ? ""
                : request.getUsername().trim().toLowerCase();

        if (!USERNAME_PATTERN.matcher(normalizedUsername).matches()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "error", "Usernames must be 3-20 characters: lowercase letters, numbers, and underscores only."
            ));
        }

        if (!myAppUserService.isUsernameAvailable(normalizedUsername)) {
            return ResponseEntity.status(409).body(Map.of("error", "That username is already taken."));
        }

        MyAppUser user = new MyAppUser();
        user.setFull_name(request.getFullName());
        user.setEmail(request.getEmail());
        user.setPassword_hash(passwordEncoder.encode(request.getPassword()));
        user.setAuth_provider("local");
        user.setCreated_at(Instant.now());
        user.setUsername(normalizedUsername);

        myAppUserRepository.save(user);

        // log the user in immediately by handing back a token,
        String token = jwtUtil.generateToken(user.getEmail());
        return ResponseEntity.ok(Map.of("token", token));
    }
}