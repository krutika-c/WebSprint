package com.websprint.backend.Security;

import java.nio.charset.StandardCharsets;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Component
public class JwtUtil {

    // How long a token lives. The 'L' makes these long (64-bit) numbers: 30 days in
    // milliseconds is about 2.6 billion, which would overflow a plain int (max ~2.1 billion).
    public static final long SHORT_TTL_MS = 24L * 60 * 60 * 1000;       // 1 day  (normal login)
    public static final long LONG_TTL_MS  = 30L * 24 * 60 * 60 * 1000;  // 30 days (remember me)

    private final SecretKey secretKey;

    // The signing secret now comes from application.properties (jwt.secret=...)
    // instead of being written in code. Spring fills in the value when it creates this class.
    // If the property is missing, the app refuses to start, which is what you want.
    public JwtUtil(@Value("${jwt.secret}") String secret) {
        byte[] keyBytes = secret.getBytes(StandardCharsets.UTF_8);
        if (keyBytes.length < 32) {
            throw new IllegalStateException(
                    "jwt.secret must be at least 32 characters. Set a long random value in application.properties.");
        }
        this.secretKey = Keys.hmacShaKeyFor(keyBytes);
    }

    // Existing callers (e.g. signup) keep working and get the short lifetime.
    public String generateToken(String email) {
        return generateToken(email, SHORT_TTL_MS);
    }

    // Called once, at login/signup, to create the token. ttlMillis decides how long it stays valid.
    public String generateToken(String email, long ttlMillis) {
        Date now = new Date();
        return Jwts.builder()
                .subject(email)
                .issuedAt(now)
                .expiration(new Date(now.getTime() + ttlMillis))
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