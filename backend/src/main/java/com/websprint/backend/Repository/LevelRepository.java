package com.websprint.backend.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.Level;

public interface LevelRepository extends JpaRepository<Level, Long> {
    List<Level> findBySubjectCodeOrderByLevelNumber(String code);
}
