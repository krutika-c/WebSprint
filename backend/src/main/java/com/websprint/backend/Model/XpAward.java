package com.websprint.backend.Model;

/** One XP reward, e.g. LEVEL_COMPLETED +100. */
public record XpAward(XpReason reason, int amount) {
}