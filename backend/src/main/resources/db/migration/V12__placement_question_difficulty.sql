-- ============================================================
-- Placement test: give every question a difficulty weight.
--
-- difficulty is the number of points a correct answer is worth when the
-- placement test is scored (1 = easy ... 5 = hard). The score for a
-- subject is points earned / points available, so hard questions move a
-- user's starting level more than easy ones.
--
-- The V10 question bank is ordered 4 easy, 3 medium, 3 hard per subject
-- (order_index 1..10), so the weights are derived from order_index:
--   order_index 1-4  -> 1 (easy)
--   order_index 5-7  -> 2 (medium)
--   order_index 8-10 -> 3 (hard)
-- That gives 4*1 + 3*2 + 3*3 = 19 points available per subject.
--
-- New migration (not an edit to V10) so Flyway doesn't report a checksum
-- mismatch on databases that already ran V10.
-- ============================================================

ALTER TABLE placement_questions
    ADD COLUMN IF NOT EXISTS difficulty SMALLINT NOT NULL DEFAULT 1;

-- Added separately so it also applies if the column already existed
-- (e.g. it was added by hand earlier). Dropped first to stay re-runnable.
ALTER TABLE placement_questions
    DROP CONSTRAINT IF EXISTS placement_questions_difficulty_check;

ALTER TABLE placement_questions
    ADD CONSTRAINT placement_questions_difficulty_check
    CHECK (difficulty BETWEEN 1 AND 5);

UPDATE placement_questions
SET difficulty = CASE
    WHEN order_index <= 4 THEN 1   -- easy
    WHEN order_index <= 7 THEN 2   -- medium
    ELSE 3                         -- hard
END;