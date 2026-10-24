package com.websprint.backend.Controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Model.LoginRequest;
import com.websprint.backend.Security.JwtUtil;

// This is now the one place that actually checks a password and hands back a token.
@RestController
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public AuthController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/api/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        try {
            // Delegates to AuthenticationProvider/UserDetailsService 
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword())
            );
        } catch (BadCredentialsException e) {
            return ResponseEntity.status(401).body(Map.of("error", "Invalid email or password"));
        }

        // "Remember me" ticked -> long-lived token (30 days); otherwise the normal short one (1 day).
        // Boolean.TRUE.equals(...) is false when the field is missing (null), so older clients still work.
        long ttl = Boolean.TRUE.equals(request.getRememberMe())
                ? JwtUtil.LONG_TTL_MS
                : JwtUtil.SHORT_TTL_MS;

        String token = jwtUtil.generateToken(request.getEmail(), ttl);
        return ResponseEntity.ok(Map.of("token", token));
    }
}