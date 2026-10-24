-- Fixes V6: user_level_progress, xp_events, and user_streaks were wired to
-- the empty/unused `users` table (UUID id) instead of `my_app_user` (int8/BIGINT id),
-- and `total_xp` was added to the wrong table too.
--
-- Safe only if these three tables are still empty (no real progress/XP data logged
-- yet under V6) — confirm with:
--   SELECT (SELECT COUNT(*) FROM user_level_progress) AS a,
--          (SELECT COUNT(*) FROM xp_events) AS b,
--          (SELECT COUNT(*) FROM user_streaks) AS c;
-- before running this.

-- 1. Drop the incorrect foreign keys pointing at `users`
ALTER TABLE user_level_progress DROP CONSTRAINT user_level_progress_user_id_fkey;
ALTER TABLE xp_events DROP CONSTRAINT xp_events_user_id_fkey;
ALTER TABLE user_streaks DROP CONSTRAINT user_streaks_user_id_fkey;

-- user_streaks.user_id is also its primary key — drop that too before changing type
ALTER TABLE user_streaks DROP CONSTRAINT user_streaks_pkey;

-- 2. Correct the column type: UUID -> BIGINT, to match my_app_user.id (int8)
--    Safe no-op data-wise since these tables are empty (USING NULL never runs
--    against a real row, but is required syntax for a UUID->BIGINT type change).
ALTER TABLE user_level_progress ALTER COLUMN user_id TYPE BIGINT USING NULL;
ALTER TABLE xp_events ALTER COLUMN user_id TYPE BIGINT USING NULL;
ALTER TABLE user_streaks ALTER COLUMN user_id TYPE BIGINT USING NULL;

-- 3. Re-add the primary key on user_streaks
ALTER TABLE user_streaks ADD PRIMARY KEY (user_id);

-- 4. Re-add foreign keys, now correctly pointing at my_app_user
ALTER TABLE user_level_progress
  ADD CONSTRAINT user_level_progress_user_id_fkey
  FOREIGN KEY (user_id) REFERENCES my_app_user(id) ON DELETE CASCADE;

ALTER TABLE xp_events
  ADD CONSTRAINT xp_events_user_id_fkey
  FOREIGN KEY (user_id) REFERENCES my_app_user(id) ON DELETE CASCADE;

ALTER TABLE user_streaks
  ADD CONSTRAINT user_streaks_user_id_fkey
  FOREIGN KEY (user_id) REFERENCES my_app_user(id) ON DELETE CASCADE;

-- 5. Move total_xp to the real user table
ALTER TABLE my_app_user ADD COLUMN total_xp INT NOT NULL DEFAULT 0;
ALTER TABLE users DROP COLUMN total_xp;
