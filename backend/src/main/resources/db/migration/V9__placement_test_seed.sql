-- ============================================================
-- STARTER placement-test question bank — 3 per subject, just
-- enough to test the feature end to end. Replace/extend these
-- following the exact same pattern (one INSERT ... SELECT block
-- per question, options right after it) until you have as many
-- as you want per subject. order_index must be unique per subject
-- and controls the order questions are shown in.
-- ============================================================

-- ======================= HTML =======================

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does HTML stand for?', 'MCQ',
       'HTML stands for Hyper Text Markup Language — it defines the structure of a web page.', 1
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Hyper Text Markup Language', true, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1
UNION ALL
SELECT q.id, 'B', 'High Tech Modern Language', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1
UNION ALL
SELECT q.id, 'C', 'Hyperlinks and Text Markup Language', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1
UNION ALL
SELECT q.id, 'D', 'Home Tool Markup Language', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which tag is used to create a hyperlink?', 'MCQ',
       'The <a> (anchor) tag, with an href attribute, creates a hyperlink.', 2
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<link>', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2
UNION ALL
SELECT q.id, 'B', '<a>', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2
UNION ALL
SELECT q.id, 'C', '<href>', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2
UNION ALL
SELECT q.id, 'D', '<nav>', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which element is used for the largest heading?', 'MCQ',
       '<h1> is the largest/most important heading; <h6> is the smallest.', 3
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<h6>', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3
UNION ALL
SELECT q.id, 'B', '<heading>', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3
UNION ALL
SELECT q.id, 'C', '<h1>', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3
UNION ALL
SELECT q.id, 'D', '<head>', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3;

-- ======================= CSS =======================

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does CSS stand for?', 'MCQ',
       'CSS stands for Cascading Style Sheets — it controls how HTML looks.', 1
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Cascading Style Sheets', true, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'B', 'Creative Style System', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'C', 'Computer Styled Sections', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'D', 'Colorful Style Sheets', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which property changes text color?', 'MCQ',
       'The `color` property sets the color of an element''s text.', 2
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'font-color', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'B', 'text-color', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'C', 'color', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'D', 'foreground', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which selector targets an element with class "card"?', 'MCQ',
       'A leading dot (.card) selects elements by class in CSS.', 3
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '#card', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'B', '.card', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'C', '*card', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'D', '@card', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3;

-- ======================= JS =======================

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which keyword declares a variable that can be reassigned?', 'MCQ',
       '`let` declares a block-scoped variable that can be reassigned (unlike `const`).', 1
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'const', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'B', 'let', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'C', 'static', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'D', 'fixed', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does `===` check in JavaScript?', 'MCQ',
       '`===` checks both value AND type, with no implicit type conversion (unlike `==`).', 2
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Value only', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'B', 'Type only', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'C', 'Value and type', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'D', 'Neither', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which method adds an item to the end of an array?', 'MCQ',
       '`Array.prototype.push()` adds one or more elements to the end of an array.', 3
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'push()', true, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'B', 'pop()', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'C', 'shift()', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'D', 'slice()', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3;
