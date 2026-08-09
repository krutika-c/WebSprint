package com.websprint.backend.Security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;

// NEW FILE — did not exist in the session-based version.
// This is the "ID card printer + ID card checker" for JWT auth.
@Component
public class JwtUtil {

    // TODO: move this out of code into application.properties
    // (e.g. jwt.secret=...) and inject with @Value once you set that up.
    // Must be at least 32 characters for the HS256 algorithm below.
    private final SecretKey secretKey = Keys.hmacShaKeyFor(
            "change-this-to-a-real-256-bit-secret-key-stored-safely".getBytes()
    );

    private final long EXPIRATION_MS = 24 * 60 * 60 * 1000; // 1 day

    // Called once, at login/signup, to create the token.
    public String generateToken(String email) {
        return Jwts.builder()
                .subject(email)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + EXPIRATION_MS))
                .signWith(secretKey)
                .compact();
    }

    // Called on every later request to read who the token belongs to.
    public String extractEmail(String token) {
        return parseClaims(token).getSubject();
    }

    // Called on every later request to check the token hasn't been
    // tampered with or expired.
    public boolean isTokenValid(String token) {
        try {
            Claims claims = parseClaims(token);
            return claims.getExpiration().after(new Date());
        } catch (Exception e) {
            // covers: bad signature, malformed token, expired token, etc.
            return false;
        }
    }

    private Claims parseClaims(String token) {
        return Jwts.parser()
                .verifyWith(secretKey)
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }
}