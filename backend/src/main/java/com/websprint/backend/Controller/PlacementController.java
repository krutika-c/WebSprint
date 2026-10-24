package com.websprint.backend.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.DTO.PlacementQuestionDTO;
import com.websprint.backend.DTO.PlacementResultDTO;
import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.PlacementSubmitRequest;
import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Service.PlacementService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/placement-test")
public class PlacementController {

    private final PlacementService placementService;
    private final MyAppUserRepository userRepository;

    public PlacementController(PlacementService placementService, MyAppUserRepository userRepository) {
        this.placementService = placementService;
        this.userRepository = userRepository;
    }

    // GET /api/placement-test/questions -> every question, across all 3 subjects,
    // in one call. Public (see SecurityConfig), same as /api/levels/*/questions —
    // it's only asked for right after signup, before the normal login wall matters
    // for the quiz content itself; submitting still requires a real login.
    @GetMapping("/questions")
    public List<PlacementQuestionDTO> getQuestions() {
        return placementService.getAllQuestions()
                .stream()
                .map(PlacementQuestionDTO::from)
                .toList();
    }

    // GET /api/placement-test/status -> { "taken": true/false }. Authenticated
    // (needs to know WHICH user), unlike /questions. h1.html calls this to
    // decide whether "START GAME" should open the quiz or skip straight to
    // choose-topic.html for someone who's already taken it.
    @GetMapping("/status")
    public Map<String, Boolean> getStatus(Authentication authentication) {
        Long userId = currentUserId(authentication);
        return Map.of("taken", placementService.hasTaken(userId));
    }

    // POST /api/placement-test/submit -> grades every subject, backfills level
    // progress accordingly, and returns per-subject results for test-result.html.
    @PostMapping("/submit")
    public PlacementResultDTO submit(Authentication authentication,
                                      @Valid @RequestBody PlacementSubmitRequest request) {
        Long userId = currentUserId(authentication);
        return placementService.submitPlacement(userId, request.answers());
    }

    private Long currentUserId(Authentication authentication) {
        String email = authentication.getName();
        MyAppUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("No user found for the current session"));
        return user.getId();
    }
}