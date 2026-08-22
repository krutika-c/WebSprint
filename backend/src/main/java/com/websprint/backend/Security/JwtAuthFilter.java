package com.websprint.backend.Security;

import java.io.IOException;

import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.websprint.backend.Model.MyAppUserService;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// on EVERY incoming request, by reading the Authorization header instead
// of relying on a cookie. This filter is that check. It runs once per
// request, before Spring even routes it to a @Controller method.
@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;
    private final MyAppUserService myAppUserService;

    public JwtAuthFilter(JwtUtil jwtUtil, MyAppUserService myAppUserService) {
        this.jwtUtil = jwtUtil;
        this.myAppUserService = myAppUserService;
    }

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                     @NonNull HttpServletResponse response,
                                     @NonNull FilterChain filterChain) throws ServletException, IOException {

        String authHeader = request.getHeader("Authorization");

        // No token on this request — just let it continue. If the endpoint
        // it's headed to requires auth, SecurityConfig will reject it anyway.
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return;
        }

        String token = authHeader.substring(7); // strip the "Bearer " prefix

        if (jwtUtil.isTokenValid(token)) {
            String email = jwtUtil.extractEmail(token);

            if (SecurityContextHolder.getContext().getAuthentication() == null) {
                UserDetails userDetails = myAppUserService.loadUserByUsername(email);

                UsernamePasswordAuthenticationToken authToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

                // This is the line that actually tells Spring Security
                // "this request is authenticated, as this user" for the
                // rest of this one request only — nothing is remembered
                // for the next request.
                SecurityContextHolder.getContext().setAuthentication(authToken);
            }
        }

        filterChain.doFilter(request, response);
    }
}