package com.websprint.backend.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.UserLevelProgress;

public interface UserLevelProgressRepository extends JpaRepository<UserLevelProgress, Long> {

    Optional<UserLevelProgress> findByUserIdAndLevelId(Long userId, Long levelId);

    List<UserLevelProgress> findByUserId(Long userId);
}