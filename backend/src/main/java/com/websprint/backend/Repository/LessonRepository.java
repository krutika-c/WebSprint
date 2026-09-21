package com.websprint.backend.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.Lesson;

public interface LessonRepository extends JpaRepository<Lesson, Long> {
    Optional<Lesson> findByLevelId(Long levelId);
}
