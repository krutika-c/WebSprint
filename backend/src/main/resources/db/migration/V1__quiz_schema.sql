-- Lesson content, one row per level
CREATE TABLE lessons (
  id BIGSERIAL PRIMARY KEY,
  level_id BIGINT NOT NULL UNIQUE REFERENCES levels(id) ON DELETE CASCADE,
  content_markdown TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE questions (
  id BIGSERIAL PRIMARY KEY,
  level_id BIGINT NOT NULL REFERENCES levels(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  question_type TEXT NOT NULL DEFAULT 'MCQ'
    CHECK (question_type IN ('MCQ', 'TRUE_FALSE')),
  explanation TEXT NOT NULL,
  order_index INT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),

  UNIQUE(level_id, order_index)
);

CREATE TABLE question_options (
  id BIGSERIAL PRIMARY KEY,
  question_id BIGINT NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
  option_label TEXT NOT NULL,
  option_text TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT false,
  order_index INT NOT NULL,

  UNIQUE(question_id, order_index)
);

-- Enforces single-answer questions at the DB level (matches the source content —
-- every question in the JS/HTML/CSS docs has exactly one correct option)
CREATE UNIQUE INDEX one_correct_option_per_question
  ON question_options (question_id)
  WHERE is_correct = true;
