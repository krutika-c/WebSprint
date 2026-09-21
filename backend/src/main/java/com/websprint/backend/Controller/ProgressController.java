package com.websprint.backend.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Model.LevelProgressResponse;
import com.websprint.backend.Model.StatsResponse;
import com.websprint.backend.Model.SubmitAnswersRequest;
import com.websprint.backend.Model.SubmitResultResponse;
import com.websprint.backend.Service.ProgressService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api")
public class ProgressController {

    // TODO: TEMPORARY. Reading the user id from a header lets anyone pretend to be anyone.
    // Replace with the authenticated user's id once we've looked at your security setup.
    private static final String USER_ID_HEADER = "X-User-Id";

    private final ProgressService progressService;

    public ProgressController(ProgressService progressService) {
        this.progressService = progressService;
    }

    @PostMapping("/levels/{levelId}/attempts")
    public SubmitResultResponse submitAttempt(
            @RequestHeader(USER_ID_HEADER) Long userId,
            @PathVariable Long levelId,
            @Valid @RequestBody SubmitAnswersRequest request) {
        return progressService.submitLevelResult(userId, levelId, request.answers());
    }

    @GetMapping("/progress")
    public List<LevelProgressResponse> getProgress(@RequestHeader(USER_ID_HEADER) Long userId) {
        return progressService.getProgress(userId);
    }

    @GetMapping("/me/stats")
    public StatsResponse getStats(@RequestHeader(USER_ID_HEADER) Long userId) {
        return progressService.getStats(userId);
    }
}