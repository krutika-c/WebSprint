package com.websprint.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.websprint.backend.Model.UserStreak;

public interface UserStreakRepository extends JpaRepository<UserStreak, Long> {
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(value = "DELETE FROM user_streaks WHERE user_id = :userId", nativeQuery = true)
    void deleteForUser(@Param("userId") Long userId);
}