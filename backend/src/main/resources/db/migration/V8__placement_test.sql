-- ============================================================
-- Placement test ("genre test"): a one-time quiz per subject
-- that's used to classify a new user's starting level instead
-- of making them start every subject at Level 1.
--
-- Deliberately separate from `questions` / `question_options`
-- (which belong to a specific level) so seeding/editing the
-- placement bank can never disturb real level quizzes.
-- ============================================================

CREATE TABLE placement_questions (
  id BIGSERIAL PRIMARY KEY,
  subject_id BIGINT NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  question_type TEXT NOT NULL DEFAULT 'MCQ'
    CHECK (question_type IN ('MCQ', 'TRUE_FALSE')),
  explanation TEXT NOT NULL,
  order_index INT NOT NULL,

  UNIQUE(subject_id, order_index)
);

CREATE TABLE placement_question_options (
  id BIGSERIAL PRIMARY KEY,
  placement_question_id BIGINT NOT NULL REFERENCES placement_questions(id) ON DELETE CASCADE,
  option_label TEXT NOT NULL,
  option_text TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT false,
  order_index INT NOT NULL,

  UNIQUE(placement_question_id, order_index)
);

CREATE UNIQUE INDEX one_correct_option_per_placement_question
  ON placement_question_options (placement_question_id)
  WHERE is_correct = true;

-- One row per (user, subject): the latest placement result. Re-taking the
-- test overwrites it (see PlacementService), it isn't an attempt history.
CREATE TABLE user_placement_results (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL REFERENCES my_app_user(id) ON DELETE CASCADE,
  subject_id BIGINT NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
  score INT NOT NULL,
  placed_level_id BIGINT NOT NULL REFERENCES levels(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT now(),

  UNIQUE(user_id, subject_id)
);
