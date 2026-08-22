package com.websprint.backend.Model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByLevelIdOrderByOrderIndex(Long levelId);
}
