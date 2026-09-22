package com.websprint.backend.Controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.LevelProgressResponse;
import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.StatsResponse;
import com.websprint.backend.Model.SubmitAnswersRequest;
import com.websprint.backend.Model.SubmitResultResponse;
import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Service.ProgressService;

import jakarta.validation.Valid;

// Identifies the user the same way UserController does: from the JWT via the
// Authentication object Spring Security injects (see JwtAuthFilter), never from
// a client-supplied id. The old X-User-Id header let any caller claim to be any
// user and award themselves XP/streaks/progress, so it's gone.
@RestController
@RequestMapping("/api")
public class ProgressController {

    private final ProgressService progressService;
    private final MyAppUserRepository userRepository;

    public ProgressController(ProgressService progressService, MyAppUserRepository userRepository) {
        this.progressService = progressService;
        this.userRepository = userRepository;
    }

    @PostMapping("/levels/{levelId}/attempts")
    public SubmitResultResponse submitAttempt(
            Authentication authentication,
            @PathVariable Long levelId,
            @Valid @RequestBody SubmitAnswersRequest request) {
        Long userId = currentUserId(authentication);
        return progressService.submitLevelResult(userId, levelId, request.answers());
    }

    @GetMapping("/progress")
    public List<LevelProgressResponse> getProgress(Authentication authentication) {
        return progressService.getProgress(currentUserId(authentication));
    }

    @GetMapping("/me/stats")
    public StatsResponse getStats(Authentication authentication) {
        return progressService.getStats(currentUserId(authentication));
    }

    private Long currentUserId(Authentication authentication) {
        String email = authentication.getName();
        MyAppUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("No user found for the current session"));
        return user.getId();
    }
}