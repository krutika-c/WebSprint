-- ============================================================
-- User Progress: tracks per-user completion status per level
-- ============================================================
CREATE TABLE user_level_progress (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  level_id BIGINT NOT NULL REFERENCES levels(id) ON DELETE CASCADE,
  status TEXT NOT NULL DEFAULT 'locked'
    CHECK (status IN ('locked', 'unlocked', 'completed')),
  score INT,                     -- e.g. correct answers out of total, or percentage
  attempts INT NOT NULL DEFAULT 0,
  completed_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ DEFAULT now(),

  UNIQUE(user_id, level_id)
);

CREATE INDEX idx_user_level_progress_user ON user_level_progress(user_id);
CREATE INDEX idx_user_level_progress_level ON user_level_progress(level_id);

-- ============================================================
-- XP: running total on users (fast reads) + event ledger
-- (source of truth / audit trail, so total_xp is always explainable)
-- ============================================================
ALTER TABLE users ADD COLUMN total_xp INT NOT NULL DEFAULT 0;

CREATE TABLE xp_events (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  amount INT NOT NULL,
  reason TEXT NOT NULL
    CHECK (reason IN ('LEVEL_COMPLETED', 'PERFECT_SCORE', 'STREAK_BONUS', 'MANUAL_ADJUSTMENT')),
  level_id BIGINT REFERENCES levels(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_xp_events_user ON xp_events(user_id);

-- ============================================================
-- Streaks: consecutive-day activity tracking
-- ============================================================
CREATE TABLE user_streaks (
  user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  current_streak INT NOT NULL DEFAULT 0,
  longest_streak INT NOT NULL DEFAULT 0,
  last_active_date DATE,
  updated_at TIMESTAMPTZ DEFAULT now()
);
