package com.websprint.backend.Model;

import java.time.Instant;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_level_progress")
public class UserLevelProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // BIGSERIAL: the database generates the number
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "level_id", nullable = false)
    private Long levelId;

    @Enumerated(EnumType.STRING) // store the enum's name ("LOCKED"), not its position (0)
    @Column(nullable = false)
    private LevelStatus status = LevelStatus.locked;

    private Integer score; // Integer (not int) because the column can be NULL

    @Column(nullable = false)
    private int attempts = 0;

    @Column(name = "completed_at")
    private Instant completedAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    protected UserLevelProgress() {
        // required by JPA
    }

    public UserLevelProgress(Long userId, Long levelId, LevelStatus status) {
        this.userId = userId;
        this.levelId = levelId;
        this.status = status;
    }

    // Hibernate sends every column on insert, so the DB's DEFAULT now() is never used. Set it here.
    @PrePersist
    @PreUpdate
    void touch() {
        this.updatedAt = Instant.now();
    }

    public Long getId() { return id; }
    public Long getUserId() { return userId; }
    public Long getLevelId() { return levelId; }
    public LevelStatus getStatus() { return status; }
    public void setStatus(LevelStatus status) { this.status = status; }
    public Integer getScore() { return score; }
    public void setScore(Integer score) { this.score = score; }
    public int getAttempts() { return attempts; }
    public void setAttempts(int attempts) { this.attempts = attempts; }
    public Instant getCompletedAt() { return completedAt; }
    public void setCompletedAt(Instant completedAt) { this.completedAt = completedAt; }
    public Instant getUpdatedAt() { return updatedAt; }
}