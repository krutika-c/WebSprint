package com.websprint.backend.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByLevelIdOrderByOrderIndex(Long levelId);
}
