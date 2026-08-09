package com.websprint.backend.Security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.websprint.backend.Model.MyAppUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final MyAppUserService appUserService;
    private final JwtAuthFilter jwtAuthFilter; // NEW dependency

    public SecurityConfig(MyAppUserService appUserService, JwtAuthFilter jwtAuthFilter) {
        this.appUserService = appUserService;
        this.jwtAuthFilter = jwtAuthFilter;
    }

    // UNCHANGED — password hashing has nothing to do with sessions vs JWT.
    @Bean
    public UserDetailsService userDetailsService() {
        return appUserService;
    }

    // UNCHANGED
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // UNCHANGED — still needed to check email/password against the DB.
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider(userDetailsService());
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    // NEW — AuthController needs this bean to manually check credentials
    // at /api/login (previously Spring's formLogin() did this invisibly).
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {

        return httpSecurity
                .csrf(AbstractHttpConfigurer::disable)

                // CHANGED — the single most important line for going stateless.
                // Tells Spring: never create an HttpSession, never set a
                // JSESSIONID cookie. Every request must prove who it is
                // via its own JWT, from scratch, every time.
                .sessionManagement(session ->
                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

                .authorizeHttpRequests(registry -> {
                    registry.requestMatchers(
                            "/api/login",   // CHANGED from "/login"
                            "/api/signup",  // CHANGED from "/req/signup"
                            "/css/**",
                            "/js/**",
                            "/Images/**",
                            "/favicon.ico",
                            "/login",       // NEW — clean URL for the login page
                            "/signup",
                            "/achivements",
                            "/challengs",
                            "/choose-topic",
                            "/css-roadmap",
                            "/dashboard",
                            "/genre-test",
                            "/h1",
                            "/html-roadmap",
                            "/js-roadmap",
                            "/level-complete",
                            "/profile",
                            "/settings",
                            "/signup",
                            "/test-result",
                            "/*.html",      // login.html/signup.html now served as static files
                            "/"
                    ).permitAll();

                    registry.anyRequest().authenticated();
                })

                // REMOVED — .formLogin(...). There is no login page for
                // Spring to redirect to anymore; login.html is a plain
                // static file, and the actual authentication check now
                // happens in AuthController's POST /api/login.

                // REMOVED — .oauth2Login(...) and .logout(...). Both were
                // built around sessions/cookies. If you still want Google
                // login, its success handler needs to be rewritten to
                // issue a JWT instead of creating a session — that's a
                // separate follow-up, not included here. Logout is no
                // longer a server-side call at all: the frontend just
                // deletes the stored token (see JS changes below).

                // NEW — plug our JWT check into the filter chain, running
                // before Spring's own username/password filter.
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)

                .build();
    }
}