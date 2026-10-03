package com.websprint.backend.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.UserPlacementResult;

public interface UserPlacementResultRepository extends JpaRepository<UserPlacementResult, Long> {

    Optional<UserPlacementResult> findByUserIdAndSubjectId(Long userId, Long subjectId);

    boolean existsByUserId(Long userId);
}