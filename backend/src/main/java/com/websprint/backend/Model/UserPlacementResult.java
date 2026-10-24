package com.websprint.backend.Model;

import java.time.Instant;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

/** The logged-in user's latest placement-test result for one subject.
 *  One row per (user, subject) — retaking the test overwrites it. */
@Entity
@Table(name = "user_placement_results")
public class UserPlacementResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "subject_id", nullable = false)
    private Long subjectId;

    @Column(nullable = false)
    private int score;

    @Column(name = "placed_level_id", nullable = false)
    private Long placedLevelId;

    @Column(name = "created_at")
    private Instant createdAt;

    protected UserPlacementResult() {
        // required by JPA
    }

    public UserPlacementResult(Long userId, Long subjectId, int score, Long placedLevelId) {
        this.userId = userId;
        this.subjectId = subjectId;
        this.score = score;
        this.placedLevelId = placedLevelId;
    }

    @PrePersist
    void onCreate() {
        this.createdAt = Instant.now();
    }

    public Long getId() { return id; }
    public Long getUserId() { return userId; }
    public Long getSubjectId() { return subjectId; }
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
    public Long getPlacedLevelId() { return placedLevelId; }
    public void setPlacedLevelId(Long placedLevelId) { this.placedLevelId = placedLevelId; }
    public Instant getCreatedAt() { return createdAt; }
}
