package com.websprint.backend.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.websprint.backend.Exception.ResourceNotFoundException;
import com.websprint.backend.Model.Lesson;
import com.websprint.backend.Model.LessonDTO;
import com.websprint.backend.Model.LessonRepository;
import com.websprint.backend.Model.LevelDTO;
import com.websprint.backend.Model.LevelRepository;
import com.websprint.backend.Model.QuestionDTO;
import com.websprint.backend.Model.QuestionRepository;
import com.websprint.backend.Model.SubjectDTO;
import com.websprint.backend.Model.SubjectRepository;

@RestController
@RequestMapping("/api")
public class LevelController {

    private final SubjectRepository subjectRepository;
    private final LevelRepository levelRepository;
    private final LessonRepository lessonRepository;
    private final QuestionRepository questionRepository;


    public LevelController(SubjectRepository subjectRepository,
                            LevelRepository levelRepository,
                            LessonRepository lessonRepository,
                            QuestionRepository questionRepository) {
        this.subjectRepository = subjectRepository;
        this.levelRepository = levelRepository;
        this.lessonRepository = lessonRepository;
        this.questionRepository = questionRepository;
    }

    // GET /api/subjects  -> list HTML, CSS, JS for a home screen
    @GetMapping("/subjects")
    public List<SubjectDTO> getSubjects() {
        return subjectRepository.findAll()
            .stream()
            .map(SubjectDTO::from)
            .toList();
    }

    // GET /api/subjects/HTML/levels -> list levels for one subject
    @GetMapping("/subjects/{code}/levels")
    public List<LevelDTO> getLevels(@PathVariable String code) {
    subjectRepository.findByCode(code)
        .orElseThrow(() -> new ResourceNotFoundException("No subject found with code " + code));

    return levelRepository.findBySubjectCodeOrderByLevelNumber(code)
        .stream()
        .map(LevelDTO::from)
        .toList();
}
@GetMapping
public List<QuestionDTO> getQuestions(@PathVariable Long levelId) {
    if (!levelRepository.existsById(levelId)) {
        throw new ResourceNotFoundException("Level " + levelId + " not found");
    }

    return questionRepository.findByLevelIdOrderByOrderIndex(levelId)
        .stream()
        .map(QuestionDTO::from)
        .toList();
}

    // GET /api/levels/3/lesson -> theory content for one level
    @GetMapping("/levels/{levelId}/lesson")
    public LessonDTO getLesson(@PathVariable Long levelId) {
        Lesson lesson = lessonRepository.findByLevelId(levelId)
            .orElseThrow(() -> new ResourceNotFoundException("Lesson for level " + levelId + " not found"));
        return LessonDTO.from(lesson);
    }
}