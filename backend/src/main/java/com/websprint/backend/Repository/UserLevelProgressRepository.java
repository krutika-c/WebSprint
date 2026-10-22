package com.websprint.backend.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.websprint.backend.Model.UserLevelProgress;

public interface UserLevelProgressRepository extends JpaRepository<UserLevelProgress, Long> {

    Optional<UserLevelProgress> findByUserIdAndLevelId(Long userId, Long levelId);

    List<UserLevelProgress> findByUserId(Long userId);
    
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query("delete from UserLevelProgress p where p.userId = :userId")
    void deleteForUser(@Param("userId") Long userId);
}