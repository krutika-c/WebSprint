package com.websprint.backend.Security;

import java.io.IOException;
import java.time.Instant;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Service.MyAppUserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final JwtUtil jwtUtil;
    private final MyAppUserRepository userRepository;
    private final MyAppUserService userService;

    @Value("${app.frontend-url}")
    private String frontendUrl;

    public OAuth2LoginSuccessHandler(JwtUtil jwtUtil, MyAppUserRepository userRepository,
                                      MyAppUserService userService) {
        this.jwtUtil = jwtUtil;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                         Authentication authentication) throws IOException {

        OAuth2User oauthUser = (OAuth2User) authentication.getPrincipal();
        String email = oauthUser.getAttribute("email");
        String name = oauthUser.getAttribute("name");
        String googleId = oauthUser.getAttribute("sub");

        Optional<MyAppUser> existingUser = userRepository.findByEmail(email);
        boolean isNewSignup = existingUser.isEmpty();

        MyAppUser user = existingUser.orElseGet(() -> {
            MyAppUser newUser = new MyAppUser();
            newUser.setEmail(email);
            newUser.setFull_name(name);
            newUser.setAuth_provider("google");
            newUser.setGoogle_id(googleId);
            newUser.setCreated_at(Instant.now());
            return newUser;
        });

        // Username creation now happens as an onboarding step right after
        // signup (see the frontend's set-username.html), not silently here,
        // so a brand-new Google sign-up is deliberately left without one —
        // the redirect below tells the frontend to send them to that step.
        // An older account that predates usernames (i.e. NOT a fresh signup
        // right now) still gets a sensible default so it's never left
        // without one just from logging in normally.
        if (!isNewSignup && (user.getUsername() == null || user.getUsername().isBlank())) {
            String seed = (name != null && !name.isBlank()) ? name : email;
            user.setUsername(userService.generateUniqueUsername(seed));
        }

        user.setLast_login(Instant.now());
        userRepository.save(user);

        String token = jwtUtil.generateToken(user.getEmail());
        boolean needsUsername = user.getUsername() == null || user.getUsername().isBlank();

        response.sendRedirect(frontendUrl + "/frontend/oauth-success.html?token=" + token
                + "&needsUsername=" + needsUsername);
    }
}