-- Auto-generated seed migration for CSS subject levels
-- Generated from css-levels.json — this JSON was reviewed before generating SQL

-- Set difficulty per level (extracted from source doc titles)
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 1;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 2;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 3;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 4;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 5;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 6;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 7;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 8;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 9;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 10;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 11;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 12;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 13;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 14;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 15;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 16;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 17;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 18;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 19;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'CSS' AND l.level_number = 20;

-- ============ Level 1: Welcome to CSS – Styling Your First Web Page ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Concept
HTML creates the structure of a webpage, but CSS controls how it looks.
Without CSS:
•	Plain text
•	No colors
•	No layout control
•	No visual appeal
CSS works by selecting HTML elements and applying styles to them.
Example:
h1 {
    color: blue;
}
This rule changes every <h1> heading to blue.
Questions'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does CSS stand for?', 'MCQ', 'CSS stands for Cascading Style Sheets and controls the appearance of HTML elements.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Computer Style Sheets.', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Cascading Style Sheets', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Creative Style System.', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Colorful Style Sheets', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In the CSS rule below, what is the selector? h1 { color: blue; }', 'MCQ', 'The selector identifies which HTML element will be styled.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'color', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'blue', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'h1', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '{ }', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In the CSS rule below, what is the property? h1 {     color: blue; }', 'MCQ', 'The property defines what aspect of the element will change.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'h1', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'blue', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'color', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', ':', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which symbol is used to start a CSS declaration block?', 'MCQ', 'A declaration block begins with an opening curly brace.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '(', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '{', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '[', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is a valid CSS comment?', 'MCQ', 'CSS comments use /* */.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '// This is a comment', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<!-- This is a comment -->', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '/* This is a comment */', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '# This is a comment', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a CSS ruleset?', 'MCQ', 'A ruleset consists of a selector and its styling rules.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A group of HTML tags.', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A selector plus its declarations.', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A webpage template.', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A CSS file.', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 1 AND q.order_index = 6;

-- ============ Level 2: Connecting CSS to HTML ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Concept
There are three ways to apply CSS:
Inline CSS
<p style="color:red;">Hello</p>
Internal CSS
<style>
p {
    color:red;
}
</style>
External CSS
<link rel="stylesheet" href="style.css">
External CSS is the industry standard because it keeps code organized.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which method applies CSS directly to an HTML element?', 'MCQ', 'Inline CSS is written directly within an element''s style attribute.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Internal CSS', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'External CSS', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Inline CSS', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Linked CSS', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag is used for internal CSS?', 'MCQ', 'Internal CSS is written inside the <style> tag.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<css>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<script>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<style>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<link>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which method is considered best for large websites?', 'MCQ', 'It keeps styling separate from HTML and can be reused across multiple pages.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Inline CSS', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Internal CSS', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'External CSS', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Embedded CSS', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which HTML tag links an external stylesheet?', 'MCQ', 'External stylesheets are connected using the <link> tag.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<style>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<css>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<link>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<href>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which attribute specifies the location of the CSS file?', 'MCQ', 'The href attribute contains the path to the stylesheet.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'src', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'file', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'href', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'location', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 2 AND q.order_index = 5;

-- ============ Level 3: Meet the Selectors ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Concept
Selectors tell CSS which elements should receive styles.
Examples:
h1 {}
Element Selector
.title {}
Class Selector
#header {}
ID Selector
* {}
Universal Selector'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which symbol is used for class selectors?', 'MCQ', 'A dot represents a class selector.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '#', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '.', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '*', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '@', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which symbol is used for ID selectors?', 'MCQ', 'IDs use the hash symbol.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '.', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '#', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '*', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '&', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which selector targets every element on a webpage?', 'MCQ', 'The universal selector targets all elements.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '#', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '.', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '*', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'body', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Can multiple elements share the same class?', 'MCQ', 'Classes are reusable.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only in CSS Grid', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only in forms', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Can multiple elements share the same ID?', 'MCQ', 'IDs are intended for a single element.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only with JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only inside divs', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which selector has higher specificity?', 'MCQ', 'Classes are more specific than element selectors.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Element selector', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Class selector', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Universal selector', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Both are equal', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 3 AND q.order_index = 6;

-- ============ Level 4: The Power of the Cascade and Specificity Wars ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Concept
Multiple CSS rules may target the same element.
CSS follows a priority system called the Cascade.
Example:
p {
    color: blue;
}

p {
    color: red;
}
Result:
red
The later rule wins.

Concept
Specificity decides which selector is stronger.
Priority:
Inline Style
↓
ID
↓
Class
↓
Element
Example:
#title {
    color:red;
}

.title {
    color:blue;
}
Result:
Red'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the "Cascade" in CSS refer to?', 'MCQ', 'The cascade determines which rule is applied when multiple rules target the same element.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A color effect', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A method for resolving style conflicts', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A type of animation', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A layout technique', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What happens when two rules style different properties?', 'MCQ', 'Since there is no conflict, both declarations are used.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'One rule is ignored.', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Both styles are applied', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'CSS throws an error.', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The second rule replaces everything.', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'CSS is read primarily in which direction?', 'MCQ', 'CSS rules are processed in the order they appear.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Bottom to top', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Right to left', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Top to bottom', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Randomly', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which selector has higher specificity?', 'MCQ', 'Class selectors are more specific than element selectors.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '.menu', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'div', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Both are equal', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '*', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Given: #heading {     color: red; }  .heading {     color: blue; } What color will be applied?', 'MCQ', 'The ID selector has higher specificity than the class selector.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Blue', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Red', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Both', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'None', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which selector is the least specific?', 'MCQ', 'Element selectors have lower specificity than classes, IDs, and inline styles.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '.box', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '#box', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'div', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Inline Style', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What determines CSS specificity?', 'MCQ', 'Specificity is calculated using the weight of selectors.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'File Size', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Browser Type', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Selector Weight', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Screen Resolution', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 4 AND q.order_index = 7;

-- ============ Level 5: Inheritance ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Concept
Inheritance & Reusability in CSS
What is Inheritance?
Inheritance is a mechanism where certain CSS properties applied to a parent element are automatically passed down to its child elements.
Think of it like a family tree:
•	Parent element gets a style.
•	Child elements automatically receive that style unless they explicitly define their own value.
Example
HTML:
<body>
    <h1>Welcome</h1>
    <p>This is a paragraph.</p>
</body>
CSS:
body {
    color: blue;
}
Result:
•	<h1> text becomes blue.
•	<p> text becomes blue.
Here body is parent and h1, p are child elements
Not All Properties Are Inherited
Only certain properties inherit automatically.
Common Inherited Properties
color
font-family
font-size
font-weight
font-style
line-height
letter-spacing
word-spacing
text-align
visibility
Common Non-Inherited Properties
margin
padding
border
width
height
background-color
display
position
The inherit Keyword
You can force a non - inheritable property to inherit.
The initial Keyword
Resets a property to the browser default.
Now it ignores inheritance and uses the default text color.
________________________________________
The unset Keyword
Acts like:
•	inherit for inherited properties
•	initial for non-inherited properties'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is inheritance in CSS?', 'MCQ', 'Inheritance allows certain properties to be automatically passed down to child elements.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Copying HTML code', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Passing styles from parent elements to child elements', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Creating CSS files', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Styling images', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property commonly inherits?', 'MCQ', 'Text-related properties such as color are usually inherited.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Width', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Margin', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Color', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Border', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Can inherited styles be overridden?', 'MCQ', 'Child elements can define their own styles and override inherited values.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only with JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only using IDs', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is inheritance useful?', 'MCQ', 'Inheritance allows common styles to be defined once and reused automatically.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Reduces repeated CSS code', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Increases page size', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Removes HTML', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Improves internet speed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Do all CSS properties inherit automatically?', 'MCQ', 'Only certain properties inherit by default.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only colors', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only dimensions', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 5 AND q.order_index = 5;

-- ============ Level 6: REUSABILITY ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'What is Reusability?
Reusability means writing CSS once and using it many times.
Instead of duplicating styles, you create reusable rules.
This is one of the most important principles in frontend development.
________________________________________
Bad Example (Not Reusable)
#btn1 {
    background: blue;
    color: white;
}

#btn2 {
    background: blue;
    color: white;
}

#btn3 {
    background: blue;
    color: white;
}
Problem:
•	Repeated code
•	Hard to maintain
________________________________________
Good Example (Reusable)
.button {
    background: blue;
    color: white;
}
HTML:
<button class="button">Save</button>
<button class="button">Delete</button>
<button class="button">Edit</button>
One class styles all buttons.
________________________________________
Reusability Through Classes
Classes are the primary tool for reusable CSS.
Example:
.card {
    padding: 20px;
    border-radius: 10px;
}
Used anywhere:
<div class="card">Profile</div>

<div class="card">Settings</div>

<div class="card">Dashboard</div>
One definition.
Multiple uses.
________________________________________
Reusability Through CSS Variables
Modern CSS provides custom properties.
Example:
:root {
    --primary-color: #2563eb;
}
Use everywhere:
button {
    background-color: var(--primary-color);
}

.card-title {
    color: var(--primary-color);
}
Need a new brand color?
Change one line:
--primary-color: green;
Entire website updates.
________________________________________
Reusability Through Utility Classes
Many frameworks use utility classes.
Example:
.text-center {
    text-align: center;
}

.bold {
    font-weight: bold;
}
HTML:
<p class="text-center bold">
    Welcome
</p>
Small reusable classes combine together.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the main goal of CSS reusability?', 'MCQ', 'Reusability helps developers avoid duplication by defining styles once and applying them wherever needed.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Increase file size', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Write the same styles repeatedly', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Write styles once and use them multiple times', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Remove HTML elements', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which approach is the most reusable for styling multiple buttons?', 'MCQ', 'Using a class allows the same style to be applied to multiple elements.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '#btn1 {
    background: blue;
}
#btn2 {
    background: blue;
}
#btn3 {
    background: blue;
}', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '.button {
    background: blue;
}', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'button1 {
    background: blue;
}', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'background: blue;', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which HTML correctly uses a reusable CSS class?', 'MCQ', 'Multiple elements can share the same class, making styling reusable.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<button id="btn1">Save</button>
<button id="btn2">Delete</button>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<button class="button">Save</button>
<button class="button">Delete</button>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<button>Save</button>
<button>Delete</button>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<button reuse="button">Save</button>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Consider the CSS: :root {     --primary-color: blue; }  button {     background-color: var(--primary-color); }  .card-title {     color: var(--primary-color); } What happens if --primary-color is changed to green?', 'MCQ', 'Both styles use the same variable, so updating it changes all references automatically.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Only buttons become green.', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Only card titles become green.', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Both buttons and card titles become green.', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Nothing changes.', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why are utility classes considered reusable?', 'MCQ', 'Utility classes like .text-center or .bold can be reused and combined on different elements.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They target only one element.', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They contain small, single-purpose styles that can be combined across many elements.', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They replace CSS Variables.', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They work only with Flexbox.', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 6 AND q.order_index = 5;

-- ============ Level 7: Attribute Selectors & Advanced Targeting ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Concept
Attribute Selectors
Suppose you have the following HTML:
<input type="text">
<input type="password">
<input type="email">
If you write:
input {
    border: 2px solid blue;
}
All input fields get the same style.
But what if you want:
•	Text fields → Blue border
•	Password fields → Red border
•	Email fields → Green border
This is where Attribute Selectors become useful.
They allow you to target elements based on their attributes and attribute values.
________________________________________
What is an Attribute?
An attribute provides additional information about an HTML element.
Examples:
<input type="text">
<a href="https://example.com">
<img src="image.jpg">
Attributes here are:
type
href
src
Attribute selectors use these attributes to select elements.
________________________________________
Basic Attribute Selector
Syntax:
[attribute] {
    property: value;
}
Example:
[href] {
    color: red;
}
HTML:
<a href="page.html">Home</a>
<a>About</a>
Result:
Home -> Red
About -> Unchanged
Only elements that contain the href attribute are selected.
________________________________________
Exact Value Matching
Syntax:
[attribute="value"]
Example:
input[type="text"] {
    border: 2px solid blue;
}
HTML:
<input type="text">
<input type="password">
Result:
Text input -> Blue border
Password input -> No style
Only inputs whose type is exactly "text" are selected.
Advanced Attribute Selectors
CSS provides several powerful matching options.
Advanced targeting means selecting elements more precisely than just:
p
div
button
You can target elements based on:
•	Attributes
•	Position
•	State
•	Relationships
Examples:
input[type="password"]
Password fields only.
a[href^="https"]
Secure links only.
img[src$=".png"]
PNG images only.
This precision helps large projects stay organized.

1. Contains (*=)
Selects elements whose attribute contains a specific value.
Syntax:
[attribute*="value"]
Example:
a[href*="google"] {
    color: red;
}
HTML:
<a href="https://google.com">
Google
</a>

<a href="https://facebook.com">
Facebook
</a>
Result:
Google -> Red
Facebook -> Unchanged
Because "google" exists inside the href value.
________________________________________
2. Starts With (^=)
Selects attributes that start with a value.
Syntax:
[attribute^="value"]
Example:
a[href^="https"] {
    color: green;
}
HTML:
<a href="https://site.com">
Secure Site
</a>
Result:
Secure Site -> Green
Because the href starts with "https".
________________________________________
3. Ends With ($=)
Selects attributes that end with a value.
Syntax:
[attribute$="value"]
Example:
img[src$=".png"] {
    border: 2px solid red;
}
HTML:
<img src="logo.png">
<img src="photo.jpg">
Result:
logo.png -> Red border
photo.jpg -> No border
________________________________________
Combining Selectors
You can combine element selectors and attribute selectors.
Example:
input[type="email"]
This means:
Select all input elements
whose type equals email
Without input, this would match any element with that attribute.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which selector targets all elements that have an href attribute?', 'MCQ', '[href] selects every element that contains an href attribute.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'href', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '#href', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '[href]', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'href', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the selector below do? a[href^="https"]', 'MCQ', '^= means "starts with".', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Selects links ending with "https"', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Selects links containing "https"', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Selects links starting with "https"', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Selects all links', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the selector below do? img[src$=".png"]', 'MCQ', '$= means "ends with".', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Selects images starting with ".png"', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Selects images ending with ".png"', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Selects all images', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Selects images containing ".png" anywhere', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which attribute selector would target all password fields?', 'MCQ', 'It targets inputs whose type attribute is exactly "password".', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'input[type="password"]', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '.password', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '#password', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'input', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is an advantage of attribute selectors?', 'MCQ', 'Attribute selectors provide precise styling without requiring extra classes or IDs.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They eliminate the need for HTML', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They allow precise targeting based on existing attributes', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They increase CSS file size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They only work with forms', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Suppose you have: <a href="https://google.com">Google</a> <a href="page.html">Home</a> Which selector styles only the Google link?', 'MCQ', '*= checks whether the attribute contains a specific value, making it ideal for targeting links that contain "google".', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'a[href*="google"]', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'a', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '[href]', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'a[href]', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 7 AND q.order_index = 6;

-- ============ Level 8: Interactive Styling with Pseudo-Classes ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Pseudo-classes allow you to style elements based on their state or user interaction without changing the HTML. They make websites feel interactive and responsive. Common pseudo-classes include :hover (mouse over), :focus (selected input field), :active (clicked element), and :visited (previously visited links). They are widely used for buttons, forms, and navigation menus.
Key Concepts
•	:hover
•	:focus
•	:active
•	:visited
•	User interactions
•	State-based styling
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a pseudo-class?', 'MCQ', 'Pseudo-classes target elements in specific states such as hover or focus.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A special state of an element', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A type of HTML tag', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A CSS file', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A browser extension', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which pseudo-class styles a clicked button?', 'MCQ', ':active applies while the element is being clicked.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', ':hover', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', ':visited', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', ':active', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', ':focus', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which pseudo-class is commonly used when a user clicks inside a form field?', 'MCQ', ':focus targets elements that currently have keyboard or mouse focus.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', ':focus', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', ':hover', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', ':active', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', ':checked', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which syntax is correct?', 'MCQ', 'Pseudo-classes use a single colon (:).', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'button:hover', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'button.hover', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'button#hover', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'button::hover', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why are pseudo-classes useful?', 'MCQ', 'Pseudo-classes make webpages interactive and responsive to user actions.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They allow styling based on user interaction', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They create HTML elements', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They replace CSS variables', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They improve internet speed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 8 AND q.order_index = 5;

-- ============ Level 9: Styling Parts of Elements with Pseudo-Elements ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Pseudo-elements allow you to style specific parts of an element or insert decorative content without modifying the HTML. For example, you can style only the first letter of a paragraph or add icons before and after text. They help create visually appealing designs while keeping HTML clean.
Key Concepts
•	::before
•	::after
•	::first-letter
•	::first-line
•	Generated content
•	Decorative styling
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a pseudo-element?', 'MCQ', 'Pseudo-elements allow styling specific portions of an element, such as the first letter or inserted content.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A special state of an element', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A way to style specific parts of an element', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A CSS file', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A type of selector group', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which pseudo-element styles the first letter of text?', 'MCQ', '::first-letter targets only the first letter of an element''s text.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '::before', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '::after', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '::first-letter', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', ':first', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which syntax is correct for a pseudo-element?', 'MCQ', 'Pseudo-elements use double colons (::).', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'p:first-letter', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'p#first-letter', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'p::first-letter', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'p.first-letter', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property is commonly used with ::before and ::after?', 'MCQ', 'The content property defines what text or symbol will be inserted.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'content', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'color', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'margin', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'border', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Can pseudo-elements create visual decorations without changing HTML?', 'MCQ', 'Pseudo-elements can add decorative content without modifying HTML.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only with JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only in forms', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which pseudo-element targets the first line of a paragraph?', 'MCQ', '::first-line styles only the first line of text within an element.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '::first-line', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '::before', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '::after', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '::line', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 9 AND q.order_index = 6;

-- ============ Level 10: Understanding the Box Model ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Every HTML element is treated as a rectangular box. The CSS Box Model explains how space is calculated around elements using four layers: content, padding, border, and margin. Understanding the box model is essential because it affects sizing, spacing, alignment, and layout throughout a webpage.
Key Concepts
•	Content
•	Padding
•	Border
•	Margin
•	box-sizing
•	content-box
•	border-box
Understanding the CSS Box Model
The CSS Box Model is one of the most important concepts in CSS. Every HTML element on a webpage is treated as a rectangular box, and CSS uses the Box Model to determine how much space that element occupies.
+----------------------+
|       Margin         |
|  +----------------+  |
|  |     Border     |  |
|  | +------------+ |  |
|  | |  Padding   | |  |
|  | | +--------+ | |  |
|  | | |Content | | |  |
|  | | +--------+ | |  |
|  | +------------+ |  |
|  +----------------+  |
+----------------------+
The Four Parts of the Box Model
1. Content
The content area contains the actual information.
Examples:
•	Text
•	Images
•	Videos
•	Buttons
HTML:
<p>Hello World</p>
CSS:
p {
    width: 200px;
    height: 100px;
}
The width and height apply to the content area by default.
Content is the innermost part of the box.
________________________________________
2. Padding
Padding is the space inside the border but outside the content.
Example:
div {
    padding: 20px;
}
Visualization:
Border
 └─ Padding
      └─ Content
If your content is touching the border, add padding.
Without padding:
|Hello|
With padding:
|  Hello  |
Individual Padding Sides
padding-top: 10px;
padding-right: 20px;
padding-bottom: 30px;
padding-left: 40px;
Shortcut:
padding: 10px 20px 30px 40px;
Order:
Top Right Bottom Left
3. Border
The border surrounds the padding and content.
Example:
div {
    border: 2px solid black;
}
Parts of a border:
border-width
border-style
border-color
Example:
border: 5px dashed red;
Result:
----- dashed red line -----
________________________________________
Border Radius
Makes corners rounded.
border-radius: 10px;
Before:
+--------+
|        |
+--------+
After:
(        )
Used heavily in modern UI design.
________________________________________
4. Margin
Margin is space outside the border.
Example:
div {
    margin: 20px;
}
Margin separates elements from one another.
Without margin:
[Box1][Box2]
With margin:
[Box1]    [Box2]
________________________________________
Individual Margins
margin-top
margin-right
margin-bottom
margin-left
The Problem with Default Box Sizing
By default CSS uses:
box-sizing: content-box;
Meaning:
width = content only
Padding and borders get added afterward.
This often causes layout issues.
________________________________________
content-box (Default)
Example:
div {
    width: 200px;
    padding: 20px;
}
Actual size:
240px
because padding is added.
________________________________________
border-box (Modern Standard)
Most developers use:
box-sizing: border-box;
Now:
width includes:
content
padding
border
Example:
div {
    width: 200px;
    padding: 20px;
    border: 5px solid black;
    box-sizing: border-box;
}
Actual width:
200px
Margin Collapse
A special Box Model behavior.
Consider:
div {
    margin-bottom: 20px;
}

p {
    margin-top: 30px;
}
You might expect:
20 + 30 = 50px
But CSS collapses vertical margins.
Actual gap:
30px
The larger margin wins.
This is called Margin Collapse.
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Every HTML element is treated as what?', 'MCQ', 'CSS views every element as a rectangular box.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A Grid', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A Box', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A Circle', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A Container Only', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which part of the box model contains the actual content?', 'MCQ', 'The content area holds text, images, and other element content.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Border', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Margin', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Content', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Padding', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is padding?', 'MCQ', 'Padding creates space between content and the border.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Space outside the border', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Space inside the border around content', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Element width', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Element height', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is margin?', 'MCQ', 'Margin creates space between an element and neighboring elements.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Space outside the border', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Space inside the border', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Content size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Border thickness', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which layer surrounds the padding?', 'MCQ', 'The border wraps around the content and padding.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Margin', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Content', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Border', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Width', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the default box-sizing value?', 'MCQ', 'By default, width and height apply only to the content area.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'border-box', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'content-box', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'padding-box', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'margin-box', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which box-sizing value includes padding and border within width calculations?', 'MCQ', 'border-box makes width calculations easier by including padding and borders.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'content-box', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'border-box', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'width-box', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'inherit-box', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 10 AND q.order_index = 7;

-- ============ Level 11: Sizing & Overflow ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Sizing properties control how large or small elements appear on a webpage. CSS provides properties like width, height, min-width, and max-width to manage dimensions. Sometimes content becomes larger than its container, and the overflow property determines whether the content is shown, hidden, or scrollable.
•	Cards
•	Images
•	Buttons
•	Sidebars
•	Navigation menus
•	Forms
And sometimes content doesn''t fit inside those elements. That''s where overflow comes in.
________________________________________
Part 1: Sizing
Sizing determines how large or small an element appears.
CSS provides several properties for controlling dimensions.
________________________________________
Width
The width property controls the horizontal size of an element.
Example:
div {
    width: 300px;
}
Common Width Values
Pixels (Fixed Size)
width: 300px;
Always 300 pixels.
Percentage
width: 50%;
Width becomes 50% of the parent element.
Example:
<div class="parent">
    <div class="child"></div>
</div>
.parent {
    width: 1000px;
}

.child {
    width: 50%;
}
Viewport Width
width: 100vw;
vw = viewport width.
Example:
Screen width = 1200px
100vw = 1200px

min-width
Sets the minimum width an element can shrink to.
Example:
div {
    min-width: 300px;
}
max-width
Sets the maximum width.
Example:
div {
    max-width: 600px;
}
Meaning:
Never exceed 600px
Part 2: Overflow
Overflow occurs when content is larger than the available space.
Example:
.box {
    width: 200px;
    height: 100px;
}
overflow: hidden;
Anything outside the box is cut off.
Example:
+----------+
| Content  |
| More Con |
+----------+
Remaining content disappears.
overflow: auto
overflow: auto;
Scrollbars appear only when necessary.
overflow-x and overflow-y
Control directions independently.
________________________________________
Horizontal Overflow
overflow-x: scroll;
Vertical Overflow
overflow-y: scroll;
Overflow decides:
What happens when too many things are inside the room
Possible outcomes:
visible → let items spill out
hidden → cut them off
scroll → always allow scrolling
auto → scroll only if needed'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property sets an element''s width?', 'MCQ', 'The width property controls horizontal size.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'height', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'width', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'dimension', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property defines the maximum width an element can have?', 'MCQ', 'max-width prevents an element from growing too large.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'width', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'min-width', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'max-width', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'limit-width', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the overflow property control?', 'MCQ', 'Overflow determines what happens when content doesn''t fit inside an element.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Text color', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Content that exceeds an element''s boundaries', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Font size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Positioning', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which value hides overflowing content?', 'MCQ', 'overflow: hidden clips content that extends beyond the element.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'visible', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'auto', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'hidden', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'scroll', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which value always displays scrollbars?', 'MCQ', 'overflow: scroll shows scrollbars regardless of necessity.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'hidden', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'auto', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'scroll', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'visible', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which value displays scrollbars only when needed?', 'MCQ', 'overflow: auto adds scrollbars only when content overflows.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'auto', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'hidden', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'visible', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'inherit', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 11 AND q.order_index = 6;

-- ============ Level 12: Typography & Text Styling ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Typography focuses on making text readable, attractive, and well-structured. CSS provides properties for changing fonts, text size, alignment, spacing, and capitalization. Good typography improves user experience and helps communicate information clearly.
Key Concepts
•	font-family
•	font-size
•	font-weight
•	font-style
•	text-align
•	letter-spacing
•	word-spacing
•	line-height
•	text-transform'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property changes the font type?', 'MCQ', 'font-family specifies the typeface used for text.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'font-style', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'font-family', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'font-size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'text-style', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property changes text size?', 'MCQ', 'font-size controls how large or small text appears.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'font-family', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'font-size', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'text-size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'size', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property makes text bold?', 'MCQ', 'font-weight controls the thickness of text.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'font-style', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'text-weight', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'font-weight', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'bold', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property makes text italic?', 'MCQ', 'font-style: italic displays slanted text.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'font-weight', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'font-style', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'text-style', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'italic', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property aligns text horizontally?', 'MCQ', 'text-align controls horizontal alignment such as left, center, or right.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'text-align', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'align-text', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'text-position', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'justify-content', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property adds space between letters?', 'MCQ', 'letter-spacing increases or decreases space between characters.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'word-spacing', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'letter-spacing', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'line-height', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'font-spacing', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls vertical spacing between lines of text?', 'MCQ', 'line-height determines the distance between lines of text.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'line-height', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'letter-spacing', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'text-height', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'word-spacing', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property transforms text to uppercase, lowercase, or capitalize?', 'MCQ', 'text-transform changes the capitalization of text without altering the original content.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'text-style', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'font-transform', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'text-transform', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'case-change', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 12 AND q.order_index = 8;

-- ============ Level 13: Colors, Backgrounds & Gradients ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Colors and backgrounds are essential for creating visually appealing websites. CSS allows you to style text using different color formats such as Hex, RGB, and HSL. You can also apply background colors, images, and gradients to elements. These properties help establish branding, improve readability, and make interfaces more engaging.
Key Concepts
•	color
•	background-color
•	background-image
•	background-size
•	background-repeat
•	Hex colors (#FF5733)
•	RGB colors
•	HSL colors
•	linear-gradient()
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property is used to change the text color?', 'MCQ', 'The color property controls the color of text content.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'background-color', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'text-color', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'color', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'font-color', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property changes the background color of an element?', 'MCQ', 'background-color sets the background color behind an element.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'color', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'bg-color', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'background-color', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fill-color', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is a valid hexadecimal color?', 'MCQ', 'Hexadecimal colors begin with # followed by 3 or 6 hexadecimal digits.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '#FF5733', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'FF5733', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'color(255,87,51)', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'hexFF5733', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which color format uses red, green, and blue values?', 'MCQ', 'RGB defines colors using Red, Green, and Blue components.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'HSL', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'RGB', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'HEX', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'CMYK', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which CSS function creates a gradient?', 'MCQ', 'linear-gradient() creates a smooth transition between colors.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'gradient()', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'linear-gradient()', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'color-gradient()', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'background-gradient()', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property is used to add a background image?', 'MCQ', 'background-image allows an image to be used as an element''s background.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'image', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'background-image', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'img', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'background-src', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls how a background image is repeated?', 'MCQ', 'background-repeat determines whether an image repeats horizontally, vertically, both, or not at all.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'background-repeat', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'image-repeat', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'repeat-image', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'background-size', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls the size of a background image?', 'MCQ', 'background-size controls how large or small a background image appears.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'background-fit', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'image-size', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'background-size', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'size-background', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which color model uses Hue, Saturation, and Lightness?', 'MCQ', 'HSL represents colors using hue, saturation, and lightness values.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'RGB', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'HEX', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'HSL', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'CMYK', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 13 AND q.order_index = 9;

-- ============ Level 14: Borders, Shadows & Visual Effects ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Borders, shadows, and opacity help elements stand out and create visual hierarchy on a webpage. Borders define boundaries, shadows add depth, and opacity controls transparency. These effects make interfaces look more modern and improve the user''s visual experience.
Key Concepts
•	border
•	Border styles (solid, dashed, dotted)
•	border-radius
•	box-shadow
•	text-shadow
•	outline
•	opacity
•	Transparency effects
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property adds a border around an element?', 'MCQ', 'The border property creates a visible boundary around an element.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'outline', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'border', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'frame', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'edge', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property creates a shadow around an element?', 'MCQ', 'box-shadow adds depth and visual separation to elements.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'text-shadow', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'shadow', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'box-shadow', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'border-shadow', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property creates a shadow on text?', 'MCQ', 'text-shadow applies shadow effects directly to text.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'box-shadow', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'font-shadow', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'text-shadow', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'shadow-text', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which border style creates a dashed border?', 'MCQ', 'The dashed border style displays a series of dashes.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'solid', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'dotted', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'dashed', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'double-line', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which border style creates a dotted border?', 'MCQ', 'The dotted style displays a series of dots.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'dashed', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'dotted', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'solid', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'groove', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property creates rounded corners?', 'MCQ', 'border-radius rounds the corners of an element.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'corner-radius', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'border-radius', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'radius', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'round-border', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of an outline?', 'MCQ', 'Outlines appear outside the border and do not affect layout size.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Creates spacing', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Adds a line outside the border', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Creates shadows', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Changes text color', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls transparency?', 'MCQ', 'opacity controls how transparent or visible an element appears.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'visibility', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'transparent', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'opacity', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'alpha', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does an opacity value of 0 mean?', 'MCQ', 'An opacity of 0 makes the element completely invisible.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Fully visible', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Half visible', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Fully transparent', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Invalid value', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 14 AND q.order_index = 9;

-- ============ Level 15: Display & Positioning ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'The display and positioning properties determine how elements are arranged on a webpage. Display controls whether elements behave as blocks, inline elements, or flexible containers. Positioning allows elements to be moved relative to their normal location, fixed on the screen, or placed precisely within a layout. Understanding these concepts is crucial before learning modern layout systems like Flexbox and Grid.
Key Concepts
•	display
•	block
•	inline
•	inline-block
•	position: static
•	position: relative
•	position: absolute
•	position: fixed
•	z-index
•	float
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which display value makes an element behave like a block element?', 'MCQ', 'display: block makes the element start on a new line and occupy available width.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'inline', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'block', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'grid', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which display value keeps elements on the same line?', 'MCQ', 'Inline elements do not start on a new line.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'block', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'inline', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'grid', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which display value combines inline behavior with width and height support?', 'MCQ', 'inline-block allows sizing while remaining inline.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'block', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'inline', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'inline-block', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which positioning value is the default for HTML elements?', 'MCQ', 'Elements are positioned statically by default.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'relative', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'absolute', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'static', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fixed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which positioning value allows movement relative to its normal position?', 'MCQ', 'position: relative shifts an element from its original location.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'absolute', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'relative', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'fixed', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'sticky', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which positioning value places an element relative to its nearest positioned ancestor?', 'MCQ', 'Absolutely positioned elements are removed from normal flow and positioned relative to an ancestor.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'static', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'relative', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'absolute', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fixed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which positioning value keeps an element fixed on the screen during scrolling?', 'MCQ', 'Fixed elements stay in the same viewport position.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'relative', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'absolute', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'fixed', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'static', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls stacking order?', 'MCQ', 'z-index determines which element appears on top when elements overlap.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'layer', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'z-index', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'stack-order', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'depth', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which CSS property was traditionally used for layouts before Flexbox and Grid?', 'MCQ', 'Floats were commonly used for multi-column layouts before modern layout systems.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'float', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'z-index', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'overflow', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'display', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 15 AND q.order_index = 9;

-- ============ Level 16: Flexbox Fundamentals ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Flexbox (Flexible Box Layout) is a modern CSS layout system designed for arranging elements in a single row or column. It makes it easy to align items, distribute space, and create responsive layouts without complicated positioning. Flexbox is one of the most commonly used tools in modern frontend development.
Key Concepts
•	display: flex
•	Flex Container
•	Flex Items
•	flex-direction
•	justify-content
•	align-items
•	flex-wrap
•	Main Axis
•	Cross Axis
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does Flexbox primarily help with?', 'MCQ', 'Flexbox is designed for arranging and aligning items efficiently.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Styling text', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Creating flexible layouts', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Creating databases', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Loading images', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property turns an element into a flex container?', 'MCQ', 'display: flex activates Flexbox behavior.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'display: block', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'display: flex', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'display: grid', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'display: inline', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the default main axis direction in Flexbox?', 'MCQ', 'Flex items are arranged horizontally by default.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Column', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Row', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Vertical', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Reverse', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property changes the main axis direction?', 'MCQ', 'flex-direction controls whether items are arranged in rows or columns.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-wrap', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'justify-content', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex-direction', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'align-items', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property aligns items along the main axis?', 'MCQ', 'justify-content controls distribution along the main axis.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'justify-content', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'align-items', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'align-content', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-wrap', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property aligns items along the cross axis?', 'MCQ', 'align-items controls alignment perpendicular to the main axis.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'justify-content', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-direction', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'align-items', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-grow', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property allows items to move to the next line?', 'MCQ', 'flex-wrap enables wrapping when space runs out.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-grow', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-wrap', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'align-items', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'justify-content', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which value centers items horizontally in a row-based flex container?', 'MCQ', 'justify-content: center centers items along the main axis.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'justify-content: center', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'align-items: center', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex-wrap: center', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-grow: center', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a flex container?', 'MCQ', 'The parent element becomes a flex container and controls the layout of its flex items.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'An item inside Flexbox', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The parent element using display: flex', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A grid element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'An HTML form', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 16 AND q.order_index = 9;

-- ============ Level 17: Advanced Flexbox Layouts ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'After learning Flexbox basics, advanced Flexbox features allow more control over how individual items grow, shrink, align, and reorder themselves. These properties help build complex navigation bars, dashboards, card layouts, and responsive interfaces while keeping the code simple and maintainable.
Key Concepts
•	flex-grow
•	flex-shrink
•	flex-basis
•	flex shorthand
•	align-self
•	order
•	gap
•	row-reverse
•	Advanced item control'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls how much a flex item can grow?', 'MCQ', 'flex-grow determines how much available space a flex item can take up relative to other items.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-shrink', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-grow', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex-wrap', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-basis', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property controls how much a flex item can shrink?', 'MCQ', 'flex-shrink determines how much an item can reduce in size when space is limited.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-grow', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-shrink', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex-wrap', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'justify-content', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property sets the initial size of a flex item?', 'MCQ', 'flex-basis defines the starting size before growing or shrinking.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-basis', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-grow', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'align-items', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-direction', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the shorthand flex: 1 primarily indicate?', 'MCQ', 'flex: 1 allows an item to grow and fill available space.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The item should take available space', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The item becomes fixed width', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The item cannot shrink', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The item moves to the center', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property allows an individual flex item to override the container''s alignment?', 'MCQ', 'align-self lets a single flex item have different alignment from its siblings.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'justify-content', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-direction', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'align-self', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-grow', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property changes the visual order of flex items?', 'MCQ', 'The order property controls the display order of flex items.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-wrap', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'order', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'align-self', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'gap', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does gap do in Flexbox?', 'MCQ', 'gap creates consistent spacing between items without margins.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Adds borders', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Adds spacing between flex items', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Centers items', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Resizes items', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property can reverse the order of items horizontally?', 'MCQ', 'row-reverse displays items in the opposite horizontal order.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'flex-direction: row-reverse', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'flex-wrap: reverse', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'justify-content: reverse', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'align-items: reverse', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which Flexbox property is applied to individual items rather than the container?', 'MCQ', 'flex-grow is applied directly to flex items.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'justify-content', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'align-items', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'flex-grow', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'flex-direction', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 17 AND q.order_index = 9;

-- ============ Level 18: CSS Grid Layout ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'CSS Grid is a powerful two-dimensional layout system that allows you to organize content into rows and columns. Unlike Flexbox, which focuses on one dimension at a time, Grid can control both horizontal and vertical layouts simultaneously. It is ideal for creating complex page structures such as dashboards, galleries, landing pages, and entire website layouts.
Key Concepts
•	display: grid
•	Grid Container
•	Grid Items
•	grid-template-columns
•	grid-template-rows
•	gap
•	fr unit
•	Grid Tracks
•	grid-template-areas
•	Two-dimensional layouts
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property turns an element into a grid container?', 'MCQ', 'display: grid enables CSS Grid layout functionality.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'display: flex', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'display: block', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'display: grid', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'display: inline', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is CSS Grid primarily designed for?', 'MCQ', 'CSS Grid handles both rows and columns simultaneously.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Typography', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Two-dimensional layouts', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Animations', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Forms', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property defines the columns of a grid?', 'MCQ', 'grid-template-columns specifies the number and size of columns.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'grid-template-columns', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'grid-columns', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'column-layout', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'grid-template-rows', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property defines the rows of a grid?', 'MCQ', 'grid-template-rows specifies the number and size of rows.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'grid-rows', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'grid-template-rows', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'row-template', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'grid-layout', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property creates spacing between grid items?', 'MCQ', 'gap creates consistent spacing between rows and columns.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'spacing', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'margin', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'gap', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'padding', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a grid track?', 'MCQ', 'Tracks are the rows and columns that make up a grid.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A border', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A row or column in a grid', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A shadow', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A flex item', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which unit represents a fraction of available space in Grid?', 'MCQ', 'The fr unit divides available space proportionally.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'px', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'em', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'fr', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '%', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property allows naming areas within a grid?', 'MCQ', 'grid-template-areas creates named sections for easier layouts.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'grid-template-areas', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'area-name', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'grid-name', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'template-grid', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 18 AND q.order_index = 8;

-- ============ Level 19: Responsive Design & Media Queries ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Modern websites must work well on phones, tablets, laptops, and large desktop screens. Responsive Design ensures that layouts adapt to different screen sizes and devices. Media Queries allow CSS to apply different styles based on conditions such as screen width, height, or orientation. This helps create a consistent user experience across all devices.
Key Concepts
•	Responsive Design
•	@media
•	Media Queries
•	Breakpoints
•	Viewport
•	vw (viewport width)
•	vh (viewport height)
•	rem
•	Flexible layouts
•	Mobile-first design
________________________________________'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is responsive design?', 'MCQ', 'Responsive design ensures websites work well on phones, tablets, and desktops.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Making websites load faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Making websites adapt to different screen sizes', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Creating animations', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Styling text', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which CSS feature enables responsive styling?', 'MCQ', 'Media queries apply styles based on screen characteristics.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Variables', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Grid', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Media Queries', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Pseudo-elements', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which at-rule is used for media queries?', 'MCQ', '@media defines conditional styling rules.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '@style', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '@media', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '@screen', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '@responsive', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What can media queries detect?', 'MCQ', 'Media queries can respond to multiple device characteristics.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Screen width', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Screen height', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Orientation', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'All of the above', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which unit is relative to the viewport width?', 'MCQ', 'vw represents a percentage of the viewport width.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'px', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'em', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'vw', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'rem', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which unit is relative to the viewport height?', 'MCQ', 'vh represents a percentage of the viewport height.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'vh', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'vw', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'rem', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'em', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which unit is relative to the root element''s font size?', 'MCQ', 'rem scales relative to the root (html) font size.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'em', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'rem', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'px', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'vh', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a breakpoint?', 'MCQ', 'Breakpoints define when responsive styles should activate.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A CSS error', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A screen size where layout changes', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A type of selector', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A Grid property', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is responsive design important?', 'MCQ', 'Responsive design ensures a good user experience on all screen sizes.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It improves compatibility across devices', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It removes HTML', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It replaces JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It reduces CSS file size', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 19 AND q.order_index = 9;

-- ============ Level 20: Modern CSS (Variables, Animations, Transforms & Advanced Features) ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, 'Modern CSS introduces advanced tools that make stylesheets more maintainable, reusable, and powerful. CSS Variables help create consistent design systems, Transforms and Animations add interactivity, and newer features like Container Queries, Nesting, and Cascade Layers improve scalability for large projects. These concepts represent the current direction of professional frontend development.
Key Concepts
•	CSS Variables (Custom Properties)
•	var()
•	calc()
•	min()
•	max()
•	clamp()
•	transform
•	transition
•	@keyframes
•	CSS Animations
•	Container Queries
•	CSS Nesting
•	Cascade Layers (@layer)
•	Modern CSS Architecture'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which syntax defines a CSS variable?', 'MCQ', 'CSS custom properties are defined using two hyphens (--).', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '$primary-color', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '--primary-color', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '@primary-color', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '#primary-color', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which function is used to access a CSS variable?', 'MCQ', 'var() retrieves the value of a custom property.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'get()', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'value()', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'var()', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'use()', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which function performs CSS calculations?', 'MCQ', 'calc() allows mathematical operations within CSS values.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'math()', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'calculate()', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'calc()', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'formula()', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which property is used to rotate, scale, or move an element?', 'MCQ', 'transform applies visual transformations like rotation, scaling, and translation.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'transition', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'animation', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'transform', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'translate', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which CSS feature creates smooth changes between states?', 'MCQ', 'Transitions animate property changes over time.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'transform', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'transition', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'animation', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'variable', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which rule is used to define custom animations?', 'MCQ', '@keyframes defines the stages of a CSS animation.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '@transition', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '@animation', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '@keyframes', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '@motion', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of CSS Nesting?', 'MCQ', 'Nesting allows styles to be written inside related selectors, improving readability.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Organizing related styles together', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Creating HTML elements', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Replacing Grid', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Improving browser speed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What are Cascade Layers (@layer) used for?', 'MCQ', 'Cascade Layers help manage style precedence in large projects.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Creating animations', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Organizing CSS priority levels', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Making layouts responsive', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Creating variables', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of Container Queries?', 'MCQ', 'Container Queries allow components to adapt based on their container dimensions rather than the viewport.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Styling based on parent container size', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Styling based on screen size only', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Creating Grid layouts', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Loading CSS files', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 9;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which modern CSS feature is most useful for creating reusable design systems?', 'MCQ', 'CSS Variables enable consistent colors, spacing, typography, and other design values across an application.', 10
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Variables (Custom Properties)', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Float', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Outline', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Overflow', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'CSS' AND l.level_number = 20 AND q.order_index = 10;

