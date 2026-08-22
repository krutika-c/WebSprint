package com.websprint.backend.Model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LevelRepository extends JpaRepository<Level, Long> {
    List<Level> findBySubjectCodeOrderByLevelNumber(String code);
}
