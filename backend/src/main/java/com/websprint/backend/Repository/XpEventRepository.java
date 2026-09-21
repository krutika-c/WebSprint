package com.websprint.backend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.websprint.backend.Model.XpEvent;
import com.websprint.backend.Model.XpReason;

public interface XpEventRepository extends JpaRepository<XpEvent, Long> {

    // Used to make sure a one-time reward (e.g. PERFECT_SCORE) is only given once per level.
    boolean existsByUserIdAndLevelIdAndReason(Long userId, Long levelId, XpReason reason);

    // Atomic increment done INSIDE the database ("total_xp = total_xp + x"), so two requests
    // at the same moment can't overwrite each other the way read-then-save could.
    @Modifying
    @Query(value = "UPDATE my_app_user SET total_xp = total_xp + :amount WHERE id = :userId", nativeQuery = true)
    int incrementTotalXp(@Param("userId") Long userId, @Param("amount") int amount);

    // Returns null if the user doesn't exist.
    @Query(value = "SELECT total_xp FROM my_app_user WHERE id = :userId", nativeQuery = true)
    Integer findTotalXp(@Param("userId") Long userId);
}