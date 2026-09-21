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
import jakarta.persistence.Table;

@Entity
@Table(name = "xp_events")
public class XpEvent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(nullable = false)
    private int amount;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private XpReason reason;

    @Column(name = "level_id") 
    private Long levelId;

    @Column(name = "created_at")
    private Instant createdAt;

    protected XpEvent() {
        // required by JPA
    }

    public XpEvent(Long userId, int amount, XpReason reason, Long levelId) {
        this.userId = userId;
        this.amount = amount;
        this.reason = reason;
        this.levelId = levelId;
    }

    @PrePersist
    void onCreate() {
        this.createdAt = Instant.now();
    }

    public Long getId() { return id; }
    public Long getUserId() { return userId; }
    public int getAmount() { return amount; }
    public XpReason getReason() { return reason; }
    public Long getLevelId() { return levelId; }
    public Instant getCreatedAt() { return createdAt; }
}