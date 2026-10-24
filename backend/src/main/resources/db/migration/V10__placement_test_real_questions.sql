-- ============================================================
-- Placement test: replace the 3-per-subject starter bank (V9)
-- with the real 30-question bank (10 per subject:
-- 4 easy, 3 medium, 3 hard — order_index 1..10 keeps that order).
--
-- This is a NEW migration (V10) rather than an edit to V9 so Flyway
-- doesn't fail with a checksum mismatch on databases that already
-- ran V9. Deleting placement_questions cascades to
-- placement_question_options. user_placement_results is left alone.
-- ============================================================

DELETE FROM placement_questions;


-- ======================= HTML =======================

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the primary purpose of semantic HTML elements?', 'MCQ',
       'Semantic elements (header, nav, main, article...) describe what the content is, which makes code easier to read and lets screen readers and search engines understand the page.', 1
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'To make pages load faster', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1
UNION ALL
SELECT q.id, 'B', 'To improve code readability and accessibility', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1
UNION ALL
SELECT q.id, 'C', 'To reduce CSS size', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1
UNION ALL
SELECT q.id, 'D', 'To replace JavaScript', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 1;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which attribute opens a hyperlink in a new tab?', 'MCQ',
       'target="_blank" opens the link in a new tab or window.', 2
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'target="new"', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2
UNION ALL
SELECT q.id, 'B', 'target="_blank"', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2
UNION ALL
SELECT q.id, 'C', 'open="tab"', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2
UNION ALL
SELECT q.id, 'D', 'newtab="true"', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 2;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which element is most appropriate for the main navigation menu?', 'MCQ',
       '<nav> is the semantic element for a block of primary navigation links.', 3
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<div>', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3
UNION ALL
SELECT q.id, 'B', '<section>', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3
UNION ALL
SELECT q.id, 'C', '<nav>', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3
UNION ALL
SELECT q.id, 'D', '<menuitem>', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 3;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the purpose of the alt attribute on an <img> tag?', 'MCQ',
       'alt supplies text that is shown if the image fails to load and is read aloud by screen readers.', 4
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Resize the image', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 4
UNION ALL
SELECT q.id, 'B', 'Provide fallback text and improve accessibility', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 4
UNION ALL
SELECT q.id, 'C', 'Add a caption', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 4
UNION ALL
SELECT q.id, 'D', 'Optimize loading speed', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 4;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is wrong with this markup?

<ul>
  <p>Apple</p>
  <p>Banana</p>
</ul>', 'MCQ',
       'A <ul> may only contain <li> elements as direct children; the <p> tags should be wrapped in <li>.', 5
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<ul> cannot contain text', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 5
UNION ALL
SELECT q.id, 'B', '<ul> should contain <li> elements as direct children', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 5
UNION ALL
SELECT q.id, 'C', '<p> tags cannot be nested', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 5
UNION ALL
SELECT q.id, 'D', 'Nothing is wrong', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 5;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Why is defer commonly used with external scripts?', 'MCQ',
       'defer downloads the script in parallel with HTML parsing and runs it only after parsing is finished.', 6
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It delays downloading the script', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 6
UNION ALL
SELECT q.id, 'B', 'It downloads in parallel and executes after HTML parsing', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 6
UNION ALL
SELECT q.id, 'C', 'It executes before parsing', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 6
UNION ALL
SELECT q.id, 'D', 'It only works for inline scripts', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 6;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which input type provides built-in email validation?', 'MCQ',
       'type="email" makes the browser check for a valid email format on form submit.', 7
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'type="mail"', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 7
UNION ALL
SELECT q.id, 'B', 'type="text"', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 7
UNION ALL
SELECT q.id, 'C', 'type="email"', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 7
UNION ALL
SELECT q.id, 'D', 'type="validate"', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 7;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which heading hierarchy is considered best for accessibility?', 'MCQ',
       'Headings should descend one level at a time (h1, h2, h3) without skipping, so the document outline stays logical for assistive tech.', 8
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'h1 → h3 → h4', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 8
UNION ALL
SELECT q.id, 'B', 'h1 → h2 → h3', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 8
UNION ALL
SELECT q.id, 'C', 'h2 → h4', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 8
UNION ALL
SELECT q.id, 'D', 'h3 → h1', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 8;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the purpose of rel="noopener" when used with target="_blank"?', 'MCQ',
       'rel="noopener" stops the new page from reaching back to the opener via window.opener, which prevents tabnabbing.', 9
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Makes links load faster', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 9
UNION ALL
SELECT q.id, 'B', 'Prevents the newly opened page from accessing the original window object', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 9
UNION ALL
SELECT q.id, 'C', 'Enables caching', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 9
UNION ALL
SELECT q.id, 'D', 'Improves SEO', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 9;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which element should be used to mark up self-contained content that could stand independently?', 'MCQ',
       '<article> is for self-contained content that makes sense on its own, such as a blog post or news story.', 10
FROM subjects s WHERE s.code = 'HTML';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<div>', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 10
UNION ALL
SELECT q.id, 'B', '<section>', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 10
UNION ALL
SELECT q.id, 'C', '<article>', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 10
UNION ALL
SELECT q.id, 'D', '<aside>', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'HTML' AND q.order_index = 10;


-- ======================= CSS =======================

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the difference between margin and padding?', 'MCQ',
       'Padding is the space inside an element between its content and border; margin is the space outside the border.', 1
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Margin is inside; padding is outside', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'B', 'Padding is inside; margin is outside', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'C', 'They are identical', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'D', 'Margin affects only text', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 1;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which property changes the stacking order of positioned elements?', 'MCQ',
       'z-index controls which positioned elements appear in front of others.', 2
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'depth', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'B', 'z-index', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'C', 'layer', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'D', 'priority', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 2;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the default value of the position property?', 'MCQ',
       'Elements are position: static by default, meaning normal document flow.', 3
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'relative', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'B', 'absolute', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'C', 'fixed', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'D', 'static', true, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 3;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which selector has the highest specificity?', 'MCQ',
       'An ID selector (#submit) outranks class and element selectors in specificity.', 4
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '.card', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 4
UNION ALL
SELECT q.id, 'B', 'button', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 4
UNION ALL
SELECT q.id, 'C', '#submit', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 4
UNION ALL
SELECT q.id, 'D', 'div.card', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 4;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'In Flexbox, justify-content aligns items along the:', 'MCQ',
       'justify-content distributes items along the main axis (horizontal by default in a row flex container).', 5
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Cross axis', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 5
UNION ALL
SELECT q.id, 'B', 'Main axis', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 5
UNION ALL
SELECT q.id, 'C', 'Z-axis', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 5
UNION ALL
SELECT q.id, 'D', 'Inline axis only', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 5;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the key difference between display: none and visibility: hidden?', 'MCQ',
       'display: none removes the element from the layout entirely; visibility: hidden hides it but still reserves its space.', 6
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Both remove layout space', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 6
UNION ALL
SELECT q.id, 'B', 'display: none removes the element from layout, while visibility: hidden keeps its space', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 6
UNION ALL
SELECT q.id, 'C', 'visibility: hidden removes layout', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 6
UNION ALL
SELECT q.id, 'D', 'No difference', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 6;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'position: absolute positions an element relative to:', 'MCQ',
       'An absolutely positioned element is placed relative to its nearest ancestor that has a non-static position.', 7
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The viewport', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 7
UNION ALL
SELECT q.id, 'B', 'The nearest ancestor with a non-static position', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 7
UNION ALL
SELECT q.id, 'C', 'The <body>', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 7
UNION ALL
SELECT q.id, 'D', 'The document root only', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 7;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does box-sizing: border-box change?', 'MCQ',
       'With border-box, the width and height you set include padding and border, so sizing is more predictable.', 8
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Removes borders', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 8
UNION ALL
SELECT q.id, 'B', 'Includes padding and border within the specified width and height', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 8
UNION ALL
SELECT q.id, 'C', 'Makes elements responsive', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 8
UNION ALL
SELECT q.id, 'D', 'Forces equal box sizes', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 8;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which selector is more specific?

.card { }
div.card { }', 'MCQ',
       'div.card (one element + one class) is more specific than .card (one class).', 9
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '.card', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 9
UNION ALL
SELECT q.id, 'B', 'div.card', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 9
UNION ALL
SELECT q.id, 'C', 'Both are equal', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 9
UNION ALL
SELECT q.id, 'D', 'Depends on browser', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 9;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the difference between em and rem units?', 'MCQ',
       'em is relative to the parent''s font size; rem is relative to the root (html) font size.', 10
FROM subjects s WHERE s.code = 'CSS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'em is relative to the parent font size, rem is relative to the root element''s font size', true, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 10
UNION ALL
SELECT q.id, 'B', 'rem depends on the parent', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 10
UNION ALL
SELECT q.id, 'C', 'They are equivalent', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 10
UNION ALL
SELECT q.id, 'D', 'em works only for fonts', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'CSS' AND q.order_index = 10;


-- ======================= JS =======================

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the difference between == and ===?', 'MCQ',
       '== converts types before comparing (loose equality); === compares both value and type (strict equality).', 1
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '== compares value only, === compares value and type', true, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'B', '=== works only for numbers', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'C', '== is deprecated', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1
UNION ALL
SELECT q.id, 'D', 'No difference', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 1;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does Boolean("") return?', 'MCQ',
       'An empty string is falsy, so Boolean("") returns false.', 2
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'true', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'B', 'false', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'C', 'null', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2
UNION ALL
SELECT q.id, 'D', 'undefined', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 2;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'Which keyword allows reassignment?', 'MCQ',
       'let allows reassignment, while const does not.', 3
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'const', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'B', 'let', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'C', 'Neither', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3
UNION ALL
SELECT q.id, 'D', 'Both', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 3;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is the output of typeof null?', 'MCQ',
       'typeof null returns "object" — a long-standing quirk of the language.', 4
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '"null"', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 4
UNION ALL
SELECT q.id, 'B', '"undefined"', false, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 4
UNION ALL
SELECT q.id, 'C', '"object"', true, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 4
UNION ALL
SELECT q.id, 'D', '"boolean"', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 4;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does this print?

console.log(1 + "2" + 3);', 'MCQ',
       '1 + "2" becomes the string "12" through concatenation, then + 3 appends "3", giving "123".', 5
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '6', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 5
UNION ALL
SELECT q.id, 'B', '"123"', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 5
UNION ALL
SELECT q.id, 'C', '"33"', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 5
UNION ALL
SELECT q.id, 'D', 'Error', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 5;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does Array.prototype.map() return?', 'MCQ',
       'map() leaves the original array untouched and returns a new array of transformed values.', 6
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A modified original array', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 6
UNION ALL
SELECT q.id, 'B', 'A new transformed array', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 6
UNION ALL
SELECT q.id, 'C', 'A boolean', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 6
UNION ALL
SELECT q.id, 'D', 'The first matching element', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 6;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is a closure?', 'MCQ',
       'A closure is a function that keeps access to variables from the scope where it was created, even after that outer function has returned.', 7
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A browser feature', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 7
UNION ALL
SELECT q.id, 'B', 'A function retaining access to variables from its lexical scope after the outer function has returned', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 7
UNION ALL
SELECT q.id, 'C', 'An event listener', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 7
UNION ALL
SELECT q.id, 'D', 'A promise callback', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 7;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What will this output?

const obj = { x: 1 };
const copy = obj;
copy.x = 5;
console.log(obj.x);', 'MCQ',
       'Objects are assigned by reference, so copy and obj point to the same object; changing copy.x changes obj.x to 5.', 8
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '1', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 8
UNION ALL
SELECT q.id, 'B', '5', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 8
UNION ALL
SELECT q.id, 'C', 'undefined', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 8
UNION ALL
SELECT q.id, 'D', 'Error', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 8;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What is printed?

setTimeout(() => console.log("A"), 0);
console.log("B");', 'MCQ',
       'setTimeout callbacks run after the current synchronous code finishes, even with a 0ms delay, so B prints first.', 9
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A B', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 9
UNION ALL
SELECT q.id, 'B', 'B A', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 9
UNION ALL
SELECT q.id, 'C', 'Simultaneously', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 9
UNION ALL
SELECT q.id, 'D', 'Error', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 9;

INSERT INTO placement_questions (subject_id, question_text, question_type, explanation, order_index)
SELECT s.id, 'What does the following produce?

const [first, ...rest] = [1, 2, 3, 4];', 'MCQ',
       'Destructuring with a rest element puts the first value in first and the remaining values into the array rest.', 10
FROM subjects s WHERE s.code = 'JS';

INSERT INTO placement_question_options (placement_question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'first = [1]', false, 1 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 10
UNION ALL
SELECT q.id, 'B', 'first = 1, rest = [2, 3, 4]', true, 2 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 10
UNION ALL
SELECT q.id, 'C', 'rest = 2', false, 3 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 10
UNION ALL
SELECT q.id, 'D', 'Syntax error', false, 4 FROM placement_questions q
  JOIN subjects s ON s.id = q.subject_id WHERE s.code = 'JS' AND q.order_index = 10;
