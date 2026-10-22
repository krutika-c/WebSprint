package com.websprint.backend.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.websprint.backend.Model.UserPlacementResult;

public interface UserPlacementResultRepository extends JpaRepository<UserPlacementResult, Long> {

    Optional<UserPlacementResult> findByUserIdAndSubjectId(Long userId, Long subjectId);

    boolean existsByUserId(Long userId);

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query("delete from UserPlacementResult r where r.userId = :userId")
    void deleteForUser(@Param("userId") Long userId);
}