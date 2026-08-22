package com.websprint.backend.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.AnswerRequest;
import com.websprint.backend.Model.AnswerResultDTO;
import com.websprint.backend.Model.Question;
import com.websprint.backend.Model.QuestionDTO;
import com.websprint.backend.Model.QuestionOption;
import com.websprint.backend.Model.QuestionRepository;

@RestController
@RequestMapping("/api/levels/{levelId}/questions")
public class QuestionController {

    private final QuestionRepository questionRepository;

    public QuestionController(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @GetMapping
    public List<QuestionDTO> getQuestions(@PathVariable Long levelId) {
        return questionRepository.findByLevelIdOrderByOrderIndex(levelId)
            .stream()
            .map(QuestionDTO::from)
            .toList();
    }

    @PostMapping("/{questionId}/answer")
    public AnswerResultDTO checkAnswer(@PathVariable Long questionId,
                                    @RequestBody AnswerRequest request) {

    Question question = questionRepository.findById(questionId)
        .orElseThrow(() -> new ResourceNotFoundException("Question " + questionId + " not found"));

    boolean correct = question.getOptions().stream()
        .anyMatch(o -> o.getId().equals(request.optionId()) && o.isCorrect());

    Long correctOptionId = question.getOptions().stream()
        .filter(QuestionOption::isCorrect)
        .map(QuestionOption::getId)
        .findFirst()
        .orElse(null);

    return new AnswerResultDTO(correct, question.getExplanation(), correctOptionId);
}
}
