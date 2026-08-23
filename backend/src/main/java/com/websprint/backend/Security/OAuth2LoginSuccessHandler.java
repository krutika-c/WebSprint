package com.websprint.backend.Security;

import java.io.IOException;
import java.time.Instant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.MyAppUserRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final JwtUtil jwtUtil;
    private final MyAppUserRepository userRepository;

    @Value("${app.frontend-url}")
    private String frontendUrl;

    public OAuth2LoginSuccessHandler(JwtUtil jwtUtil, MyAppUserRepository userRepository) {
        this.jwtUtil = jwtUtil;
        this.userRepository = userRepository;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                         Authentication authentication) throws IOException {

        OAuth2User oauthUser = (OAuth2User) authentication.getPrincipal();
        String email = oauthUser.getAttribute("email");
        String name = oauthUser.getAttribute("name");
        String googleId = oauthUser.getAttribute("sub");

        MyAppUser user = userRepository.findByEmail(email).orElseGet(() -> {
            MyAppUser newUser = new MyAppUser();
            newUser.setEmail(email);
            newUser.setFull_name(name);
            newUser.setAuth_provider("google");
            newUser.setGoogle_id(googleId);
            newUser.setCreated_at(Instant.now());
            return newUser;
        });

        user.setLast_login(Instant.now());
        userRepository.save(user);

        String token = jwtUtil.generateToken(user.getEmail());

        response.sendRedirect(frontendUrl + "/frontend/oauth-success.html?token=" + token);
    }
}