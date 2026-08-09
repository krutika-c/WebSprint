package com.websprint.backend.Controller;

import java.time.Instant;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.MyAppUserRepository;
import com.websprint.backend.Model.SignupRequest;
import com.websprint.backend.Security.JwtUtil;

// CHANGED from @Controller to @RestController — this now returns JSON
// (a token or an error message) instead of redirecting a browser page.
@RestController
public class RegistrationController {

    private final MyAppUserRepository myAppUserRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil; // NEW dependency

    public RegistrationController(MyAppUserRepository myAppUserRepository,
                                   PasswordEncoder passwordEncoder,
                                   JwtUtil jwtUtil) {
        this.myAppUserRepository = myAppUserRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = jwtUtil;
    }

    // CHANGED — path from "/req/signup" to "/api/signup", and reads a
    // JSON body (@RequestBody) instead of a URL-encoded HTML form
    // (@ModelAttribute + consumes = APPLICATION_FORM_URLENCODED_VALUE).
    @PostMapping("/api/signup")
    public ResponseEntity<?> createUser(@RequestBody SignupRequest request) {

        // Same validation logic as before — just returns a JSON error
        // response instead of a redirect + flash attribute.
        if (myAppUserRepository.findByEmail(request.getEmail()).isPresent()) {
            return ResponseEntity.status(409).body(Map.of("error", "Email already registered"));
        }

        if (request.getPassword() == null || !request.getPassword().equals(request.getConfirmPassword())) {
            return ResponseEntity.badRequest().body(Map.of("error", "Passwords do not match"));
        }

        MyAppUser user = new MyAppUser();
        user.setFull_name(request.getFullName());
        user.setEmail(request.getEmail());
        user.setPassword_hash(passwordEncoder.encode(request.getPassword()));
        user.setAuth_provider("local");
        user.setCreated_at(Instant.now());

        myAppUserRepository.save(user);

        // NEW — log the user in immediately by handing back a token,
        // the same as /api/login would. Saves them a separate login step.
        String token = jwtUtil.generateToken(user.getEmail());
        return ResponseEntity.ok(Map.of("token", token));
    }
}