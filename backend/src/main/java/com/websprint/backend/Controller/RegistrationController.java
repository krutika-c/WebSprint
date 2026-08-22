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
@RestController
public class RegistrationController {

    private final MyAppUserRepository myAppUserRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public RegistrationController(MyAppUserRepository myAppUserRepository,
                                   PasswordEncoder passwordEncoder,
                                   JwtUtil jwtUtil) {
        this.myAppUserRepository = myAppUserRepository;
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

        MyAppUser user = new MyAppUser();
        user.setFull_name(request.getFullName());
        user.setEmail(request.getEmail());
        user.setPassword_hash(passwordEncoder.encode(request.getPassword()));
        user.setAuth_provider("local");
        user.setCreated_at(Instant.now());

        myAppUserRepository.save(user);

        // log the user in immediately by handing back a token,
        String token = jwtUtil.generateToken(user.getEmail());
        return ResponseEntity.ok(Map.of("token", token));
    }
}