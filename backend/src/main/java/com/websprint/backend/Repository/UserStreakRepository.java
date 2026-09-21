package com.websprint.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.websprint.backend.Model.UserStreak;

public interface UserStreakRepository extends JpaRepository<UserStreak, Long> {
}