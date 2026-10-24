-- Auto-generated seed migration for HTML subject levels
-- Generated from html-levels.json — this JSON was reviewed before generating SQL

-- Set difficulty per level (extracted from source doc titles)
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 1;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 2;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 3;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 4;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 5;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 6;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 7;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 8;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 9;
UPDATE levels l
SET difficulty = 'Beginner'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 10;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 11;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 12;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 13;
UPDATE levels l
SET difficulty = 'Intermediate'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 14;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 15;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 16;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 17;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 18;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 19;
UPDATE levels l
SET difficulty = 'Advanced'
FROM subjects s
WHERE s.id = l.subject_id AND s.code = 'HTML' AND l.level_number = 20;

-- ============ Level 1: Welcome to HTML ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is HTML?

HTML stands for HyperText Markup Language. It is the standard markup language used to create the structure and content of webpages. Unlike a programming language, HTML does not contain logic such as loops or conditions — it describes the structure of content using elements (also called tags). Every webpage you have ever visited is built, at minimum, with HTML. CSS (Cascading Style Sheets) is later used to style that structure, and JavaScript is used to make it interactive, but HTML always comes first because it defines what content exists and how it is organized.

#### Markup vs Programming Languages

A markup language uses tags to annotate text and tell the browser what each piece of content is — a heading, a paragraph, a link, an image, and so on. HTML is declarative: you describe what something is, not how to compute it. This is different from programming languages like JavaScript or Python, which contain instructions the computer executes step by step. Understanding this distinction matters because many beginners expect HTML to ''do'' things — but HTML only structures and labels content; behavior comes from JavaScript.

#### HTML Editors

An HTML editor is any tool used to write HTML code. There are two broad categories: plain text editors (such as Notepad or TextEdit) and dedicated code editors (such as Visual Studio Code, Sublime Text, or online editors like CodePen and JSFiddle). Dedicated code editors are preferred because they provide syntax highlighting (coloring code based on its meaning), auto-completion, and error detection — all of which make writing and debugging HTML easier. Files written in HTML are saved with the .html extension.

#### Your First Line of Code

An HTML element typically consists of an opening tag, content, and a closing tag, written as: <tagname>content</tagname>. For example, <p>Hello World</p> creates a paragraph containing the text ''Hello World''. The tag name inside the angle brackets (< >) tells the browser what kind of content this is. Some tags are self-closing and do not wrap content, such as <br> (line break) or <img> (image).

#### Why HTML Matters

Browsers read HTML files and render them as visual pages. Search engines also read HTML to understand a page''s content for indexing. Screen readers used by visually impaired users rely on HTML structure to read pages aloud correctly. This means HTML is not just about appearance — it is foundational to accessibility, SEO (Search Engine Optimization), and how machines interpret human-readable content.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does HTML stand for?', 'MCQ', 'HTML stands for HyperText Markup Language, the standard language for creating the structure of webpages.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Hyper Trade Markup Language', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'HyperText Markup Language', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Hyperlink and Text Markup Language', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Home Tool Markup Language', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which statement best describes the difference between HTML and a programming language like JavaScript?', 'MCQ', 'HTML is a markup language that describes structure and content, while JavaScript is a programming language that adds logic and interactivity.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'HTML is faster than JavaScript', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'HTML executes logic while JavaScript only displays text', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'HTML is declarative and structures content, while JavaScript provides behavior and logic', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'There is no meaningful difference between them', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: HTML files must be saved with the .doc extension to be read by a browser.', 'TRUE_FALSE', 'HTML files are saved with the .html (or .htm) extension, not .doc, which is a word processor format.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is an example of a complete HTML element with opening and closing tags?', 'MCQ', 'A complete element includes an opening tag, the content, and a matching closing tag, as in <p>Hello</p>.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<p>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '</p>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<p>Hello</p>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'p Hello p', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why are dedicated code editors generally preferred over plain text editors for writing HTML?', 'MCQ', 'Code editors provide features such as syntax highlighting and auto-completion, which make it easier to write correct code and catch mistakes early.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They are required by web browsers to render HTML', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They automatically publish your website', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They offer features like syntax highlighting and error detection that simplify writing and debugging code', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They convert HTML into CSS automatically', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which group relies on well-structured HTML to correctly interpret a webpage''s content?', 'MCQ', 'Search engines, screen readers, and browsers all depend on properly structured HTML to interpret and present content correctly.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Search engines', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Screen readers', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Web browsers', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'All of the above', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A self-closing tag, such as <br>, does not require a separate _______ tag.', 'MCQ', 'Self-closing tags like <br> and <img> do not wrap content, so they don''t need a separate closing tag.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'opening', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'closing', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'paired', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'ending', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 1 AND q.order_index = 7;

-- ============ Level 2: Your First Webpage ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The DOCTYPE Declaration

Every HTML document should begin with a DOCTYPE declaration: <!DOCTYPE html>. This tells the browser which version of HTML the page is written in so it can render the page using standard rules rather than ''quirks mode'' (an older, inconsistent rendering behavior browsers fall back to when no DOCTYPE is present). In modern HTML5, the declaration is simple and case-insensitive, but it is conventionally written in lowercase.

#### The html Tag

The <html> tag is the root element of every HTML page — every other element is nested inside it. It is good practice to include a lang attribute, such as <html lang=''en''>, which tells browsers and screen readers what language the content is written in. This improves accessibility and helps translation tools work correctly.

#### The head Tag

The <head> section contains metadata about the document — information that is not directly displayed on the page but is used by the browser, search engines, or other systems. Common elements inside <head> include <title> (the text shown in the browser tab), <meta> tags (such as character encoding), and links to stylesheets. The head is processed before the body, but it produces no visible content of its own.

#### The body Tag

The <body> tag contains all the visible content of the webpage: text, images, links, tables, and so on. Everything the user sees and interacts with when viewing the page lives inside the body. A page can only have one <head> and one <body>, and both must be inside the <html> element.

#### Putting It Together

A minimal valid HTML5 document looks like this:
<!DOCTYPE html>
<html lang=''en''>
<head>
  <title>My First Page</title>
</head>
<body>
  <p>Hello, World!</p>
</body>
</html>
This structure is the skeleton for every HTML page you will build. Browsers are often forgiving of small mistakes (like a missing closing tag), but writing valid, well-structured HTML avoids unpredictable rendering and is considered professional practice.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the primary purpose of the <!DOCTYPE html> declaration?', 'MCQ', 'The DOCTYPE declaration informs the browser which rendering standard to apply, helping avoid inconsistent ''quirks mode'' rendering.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It links the page to a CSS file', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It tells the browser which HTML standard to use for rendering the page', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It defines the title shown in the browser tab', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It creates the visible content of the page', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag acts as the root element containing all other HTML elements?', 'MCQ', 'The <html> tag is the root element; both <head> and <body> are nested inside it.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<head>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<body>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<html>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<title>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following would typically be found inside the <head> section?', 'MCQ', 'The head contains metadata such as the title and meta tags, not visible page content.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A paragraph of visible text', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'An image displayed on the page', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The <title> element and metadata', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A clickable button', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: A single HTML document can contain multiple <body> tags as long as each one has different content.', 'TRUE_FALSE', 'A valid HTML document can only contain one <body> tag; all visible content must be inside that single body.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is it good practice to include a lang attribute on the <html> tag?', 'MCQ', 'The lang attribute tells assistive technologies and translation tools what language the content is written in, improving accessibility.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It changes the page''s font automatically', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It improves accessibility and helps screen readers and translation tools interpret the content correctly', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is required for the page to display any text', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the need for a DOCTYPE', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer writes an HTML file without a DOCTYPE declaration. What is the most likely consequence?', 'MCQ', 'Without a DOCTYPE, browsers may fall back to quirks mode, which can cause inconsistent and unpredictable rendering.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The page will fail to load entirely', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The browser may render the page in quirks mode, leading to inconsistent layout behavior', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The page will automatically default to HTML4', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'CSS will stop working completely', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 2 AND q.order_index = 6;

-- ============ Level 3: Saying Things on a Page ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Headings (h1 to h6)

HTML provides six levels of headings, <h1> through <h6>, with <h1> being the most important (typically the page title or main topic) and <h6> the least important. Headings are not just for making text bigger — they create a semantic outline of the page. Browsers, search engines, and screen readers use heading levels to understand the structure and importance of content. A well-structured page typically has one <h1>, followed by <h2> for major sections, and <h3> for subsections within those, and so on.

#### Why Heading Order Matters

Skipping heading levels (for example, going from <h1> directly to <h4>) can confuse screen reader users who navigate by heading structure, and it can also affect how search engines interpret the importance of content. Headings should not be chosen based on font size alone — if you want larger text without semantic meaning, that''s a styling decision (handled later by CSS), not a structural one.

#### Paragraphs

The <p> tag defines a paragraph of text. Browsers automatically add space before and after paragraphs by default. Unlike pressing Enter in a word processor, simply adding line breaks in your HTML source code does not create new paragraphs in the rendered output — whitespace in HTML is generally collapsed. To start a new paragraph, you must use a new <p> tag.

#### HTML Comments

Comments are notes left in the code that are not displayed on the page. They are written as <!-- comment text -->. Developers use comments to explain code, leave reminders, or temporarily disable a piece of code without deleting it. Comments are visible to anyone who views the page''s source code, so they should never contain sensitive information like passwords.

#### Combining Headings and Paragraphs

A typical content section might look like:
<h1>Page Title</h1>
<p>An introductory paragraph.</p>
<h2>Section One</h2>
<p>Content for section one.</p>
<!-- Section Two starts below -->
<h2>Section Two</h2>
<p>Content for section two.</p>
This creates a clear, navigable hierarchy that both humans and machines can interpret correctly.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which heading tag should typically be used only once per page to represent the main topic?', 'MCQ', '<h1> represents the main topic of the page and is conventionally used only once per page for a clear hierarchy.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<h6>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<h3>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<h1>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<h2>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is skipping heading levels (e.g., <h1> to <h4>) generally discouraged?', 'MCQ', 'Skipping heading levels breaks the logical outline of the page, which can confuse assistive technology users and reduce semantic clarity.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Browsers will refuse to render the page', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It can confuse screen reader navigation and weaken the semantic structure of the page', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It causes a syntax error', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It prevents the use of paragraphs afterward', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Adding multiple line breaks in your HTML source code (by pressing Enter several times) will create extra space between paragraphs in the rendered page.', 'TRUE_FALSE', 'Whitespace in HTML source code is collapsed by default; visual spacing comes from actual elements like <p> tags, not from extra line breaks in the code.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How are HTML comments written?', 'MCQ', 'HTML comments use the syntax <!-- comment -->, which browsers ignore when rendering the page.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '// comment', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '# comment', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<!-- comment -->', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '/* comment */', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Should sensitive information such as passwords ever be placed inside an HTML comment?', 'TRUE_FALSE', 'Comments are visible in a page''s source code to anyone, so sensitive information should never be placed inside them.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants larger text purely for visual emphasis, with no change in the content''s semantic importance. What is the most appropriate approach?', 'MCQ', 'Headings should reflect semantic importance, not visual size; purely visual changes should be handled with styling, not by misusing heading levels.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Use a higher-level heading tag like <h1>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Use a lower-level heading tag like <h6>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Use a styling solution (like CSS) rather than a heading tag chosen for size alone', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Use multiple <p> tags stacked together', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which best describes the purpose of the <p> tag?', 'MCQ', 'The <p> tag is used to define a block of paragraph text.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'To create a numbered list', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'To define a paragraph of text content', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'To insert an image', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'To create a page title in the browser tab', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 3 AND q.order_index = 7;

-- ============ Level 4: Making Text Stand Out ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Bold and Strong

The <b> tag makes text bold purely for visual styling, with no added semantic meaning. The <strong> tag also makes text bold by default, but it carries semantic importance — it tells browsers and screen readers that the text is important. Screen readers may change their tone of voice for <strong> text, while <b> text is read normally despite looking bold. Choosing between them depends on whether the emphasis is meaningful or purely visual.

#### Italic and Emphasis

Similarly, <i> italicizes text without semantic meaning (often used for terms, foreign words, or titles), while <em> italicizes text to indicate emphasis — meaning the word''s stress changes the sentence''s meaning, similar to how you''d emphasize a word when speaking aloud. For example, ''I did *not* say that'' uses emphasis to change meaning, which is best represented with <em>.

#### Other Text Formatting Tags

HTML provides several other formatting tags: <u> for underlined text, <mark> for highlighted text, <small> for smaller side-comment text, <sub> for subscript (like in H2O), <sup> for superscript (like in x2), and <del> / <ins> for showing deleted and inserted text respectively (useful for tracking changes).

#### HTML Entities

Some characters have special meaning in HTML and cannot be typed directly into content, because the browser would interpret them as code rather than text. For example, the less-than sign (<) signals the start of a tag. To display these characters as plain text, HTML entities are used: &lt; displays <, &gt; displays >, &amp; displays &, and &quot; displays a quotation mark. Entities always begin with & and end with a semicolon (;).

#### Why Entities Matter

If you tried to write ''5 < 10'' directly in HTML without an entity, the browser would interpret < as the start of a new tag, potentially breaking the page''s rendering. Writing ''5 &lt; 10'' instead displays correctly because the entity is interpreted as the literal character rather than markup syntax.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between <b> and <strong>?', 'MCQ', '<strong> indicates that content is semantically important (which may affect how screen readers present it), while <b> only changes visual appearance.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<b> is for italics and <strong> is for bold', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<strong> conveys semantic importance while <b> is purely visual styling', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<b> only works in HTML5 while <strong> works in all versions', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'There is no difference; they are interchangeable in every way', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag would be most appropriate for emphasizing a word that changes the meaning of a sentence, such as ''I did not say that''?', 'MCQ', '<em> is used for emphasis that changes the meaning of a sentence, similar to vocal stress in speech.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<i>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<b>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<em>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<u>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why can''t you type the character < directly into HTML content when you want it to display as plain text?', 'MCQ', 'Because < signals the start of an HTML tag, typing it directly can cause the browser to misinterpret the content as markup.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Browsers do not support the < character at all', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The browser interprets < as the start of a tag, which can break rendering', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is against W3C copyright rules', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The < symbol does not exist in any character set', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which HTML entity correctly displays the ampersand character (&)?', 'MCQ', '&amp; is the correct HTML entity for displaying a literal ampersand character.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '&amp;', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '&and;', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '&ersand;', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '&amper;', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: <i> and <em> always produce visually identical results, so the choice between them never matters.', 'TRUE_FALSE', 'While both typically render as italic text by default, they carry different semantic meaning, which matters for accessibility and screen readers even when the visual result looks the same.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag would you use to display a chemical formula like H2O with a properly lowered ''2''?', 'MCQ', '<sub> is used for subscript text, which is appropriate for chemical formulas like H2O.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<sup>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<sub>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<small>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<mark>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants to highlight a search term within a paragraph to visually draw attention to it. Which tag is most appropriate?', 'MCQ', '<mark> is specifically designed to highlight text, such as a matched search term.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<mark>', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<del>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<sup>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<strong>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 4 AND q.order_index = 7;

-- ============ Level 5: Linking the World ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The Anchor Tag

The <a> (anchor) tag creates a hyperlink, allowing users to navigate to another page, file, or location. The destination is specified using the href (hypertext reference) attribute. For example: <a href=''https://example.com''>Visit Example</a> creates a clickable link with the text ''Visit Example'' that navigates to the specified URL.

#### Absolute vs Relative Paths

An absolute path includes the full URL, including the protocol (http:// or https://) and domain name, such as https://example.com/about.html. This works regardless of where the linking page is hosted. A relative path, on the other hand, points to a location relative to the current file, such as about.html or ../images/photo.jpg. Relative paths are commonly used for links within the same website because they remain valid even if the entire site is moved to a different domain.

#### Navigating Relative Paths

In relative paths, a single dot (./) refers to the current directory, and two dots (../) move up one directory level. For example, if you are in a ''pages'' folder and want to link to an image in a sibling ''images'' folder, you would write ../images/photo.jpg — moving up one level out of ''pages'' and then into ''images''.

#### The target Attribute

By default, clicking a link opens the destination in the same browser tab. Adding target=''_blank'' opens the link in a new tab instead. This is often used for external links so users don''t lose their place on the original site. When using target=''_blank'', it is considered best practice to also add rel=''noopener noreferrer'' for security reasons, as it prevents the new page from gaining access to the original page''s window object.

#### Link Accessibility

Link text should be descriptive. Phrases like ''click here'' provide no context when read out of order by screen readers, which often let users navigate by jumping between links. A better practice is descriptive text, such as <a href=''report.pdf''>Download the annual report</a>, which makes sense even without surrounding context.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which attribute of the <a> tag specifies the destination of a link?', 'MCQ', 'The href attribute defines the URL or path that the link points to.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'src', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'href', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'link', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'target', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is an example of a relative path?', 'MCQ', 'A relative path like ''about.html'' refers to a location relative to the current file, without specifying a full domain or protocol.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'https://example.com/about.html', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'about.html', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'www.example.com', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'ftp://example.com/file.html', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does ../ mean when used in a relative file path?', 'MCQ', '../ moves up one level in the directory structure relative to the current file''s location.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Stay in the current directory', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Move up one directory level', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Move to the website''s root directory', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Create a new directory', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does adding target=''_blank'' to a link do?', 'MCQ', 'target=''_blank'' instructs the browser to open the linked content in a new tab or window.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Disables the link', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Opens the link in the same tab', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Opens the link in a new browser tab', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Makes the link bold', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is it recommended to add rel=''noopener noreferrer'' when using target=''_blank''?', 'MCQ', 'Without rel=''noopener'', the new page opened via target=''_blank'' could potentially access and manipulate the original page through the window.opener object, which is a security risk.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It makes the page load faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It improves the visual styling of the link', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It prevents the newly opened page from accessing the original page''s window object, improving security', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is required for the link to function at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is link text like ''click here'' considered poor practice for accessibility?', 'MCQ', 'Screen reader users often navigate by listening to a list of links; non-descriptive text like ''click here'' gives no indication of where the link leads.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It is too long for screen readers to process', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It provides no context when read out of order, such as when screen reader users navigate by jumping between links', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Browsers do not support that phrase', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It causes the link to stop working', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A website''s images folder is a sibling of its pages folder (both inside a root folder). From a file inside ''pages'', which path would correctly reference an image called photo.jpg inside ''images''?', 'MCQ', 'Since ''images'' is a sibling folder (not nested inside ''pages''), you must move up one level with ../ before navigating into ''images''.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'images/photo.jpg', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '../images/photo.jpg', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', './photo.jpg', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '/pages/images/photo.jpg', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 5 AND q.order_index = 7;

-- ============ Level 6: Images on the Web ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The img Tag

Images are embedded using the self-closing <img> tag. Unlike most tags, <img> does not wrap content — it uses attributes to define the image. The two essential attributes are src (source), which specifies the path or URL to the image file, and alt (alternative text), which provides a text description of the image. Example: <img src=''dog.jpg'' alt=''A golden retriever sitting in a park''>.

#### Why alt Text Matters

The alt attribute serves three key purposes: it is read aloud by screen readers for visually impaired users, it displays as fallback text if the image fails to load, and it is used by search engines to understand image content for indexing. Good alt text is descriptive but concise — it should describe the image''s content and purpose, not simply restate that ''this is an image.'' Decorative images that add no informational value can use an empty alt='''' so screen readers skip over them.

#### Width and Height Attributes

The width and height attributes can be set directly on the <img> tag to specify the image''s display dimensions in pixels, such as <img src=''dog.jpg'' alt=''A dog'' width=''400'' height=''300''>. Setting these attributes helps browsers reserve the correct amount of space before the image finishes loading, preventing content from jumping around as the page loads (a usability issue known as layout shift).

#### HTML Color Basics

Colors in HTML (and CSS) can be specified in a few common ways: by name (e.g., ''red'', ''blue''), by hexadecimal code (e.g., #FF0000 for red), or by RGB values (e.g., rgb(255, 0, 0)). Hexadecimal codes use six characters representing red, green, and blue intensity in pairs, ranging from 00 (none) to FF (full intensity). While color is primarily applied through CSS rather than HTML attributes today, understanding these formats is foundational, since they appear throughout both HTML and CSS.

#### Image File Formats

Common image formats include JPEG (.jpg, good for photos with many colors), PNG (.png, supports transparency, good for graphics and logos), GIF (.gif, supports simple animation), and SVG (.svg, a scalable vector format covered in a later level). Choosing the right format affects load time and visual quality.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which two attributes are essential when embedding an image with the <img> tag?', 'MCQ', 'src specifies the image file location, and alt provides descriptive text for accessibility and fallback purposes.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'src and href', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'src and alt', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'link and alt', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'source and description', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why should decorative images that add no informational content use alt=''''?', 'MCQ', 'An empty alt attribute signals that the image is decorative, so screen readers skip it rather than announcing irrelevant content.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because it makes the image load faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Because empty alt text allows screen readers to skip the image instead of reading unnecessary descriptions', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because it is required for all images regardless of purpose', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Because it removes the image from search engine indexing', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What problem does setting width and height attributes on an image help prevent?', 'MCQ', 'Specifying width and height lets the browser reserve space for the image before it loads, preventing surrounding content from shifting.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Slow internet connections', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Layout shift, where content jumps around as the image loads', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Incorrect color rendering', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Broken links', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which hexadecimal color code represents pure red?', 'MCQ', 'Hex codes represent red, green, and blue in that order; #FF0000 means full red, no green, no blue.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '#00FF00', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '#0000FF', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '#FF0000', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '#FFFFFF', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: The alt attribute has no effect on search engine optimization (SEO).', 'TRUE_FALSE', 'Search engines use alt text to understand image content, which contributes to SEO.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which image format is generally best suited for logos or graphics that require a transparent background?', 'MCQ', 'PNG supports transparency, making it well-suited for logos and graphics, unlike standard JPEG.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'JPEG', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'PNG', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'GIF only', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'None support transparency', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: An image fails to load due to a broken file path. What will the user see if alt text was properly provided?', 'MCQ', 'When an image fails to load, browsers display the alt text as fallback content, helping users understand what was supposed to appear.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A blank white space with nothing displayed', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The browser''s default broken-image icon with no text', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The descriptive alt text displayed in place of the image', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The page will fail to load entirely', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 6 AND q.order_index = 7;

-- ============ Level 7: Organising with Lists ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Unordered Lists

An unordered list, created with the <ul> tag, represents a collection of items where order does not matter. Each item is wrapped in an <li> (list item) tag. By default, browsers display unordered lists with bullet points. Example:
<ul>
  <li>Apples</li>
  <li>Bananas</li>
</ul>

#### Ordered Lists

An ordered list, created with the <ol> tag, represents items where sequence matters, such as step-by-step instructions. Items are automatically numbered by the browser. The start attribute can change the starting number, and the type attribute can change the numbering style (e.g., type=''A'' for letters, type=''I'' for Roman numerals). Example:
<ol>
  <li>Preheat the oven</li>
  <li>Mix the ingredients</li>
</ol>

#### Description Lists

A description list, created with <dl>, pairs terms with their descriptions. It uses <dt> (description term) for the term and <dd> (description detail) for its explanation. This is useful for glossaries, FAQs, or metadata pairs. Example:
<dl>
  <dt>HTML</dt>
  <dd>A markup language for structuring web content.</dd>
</dl>

#### Nested Lists

Lists can be nested inside one another by placing a new <ul> or <ol> inside an <li> element. This is useful for representing hierarchical information, such as a table of contents with sub-sections. Proper nesting requires the inner list to be placed entirely within the outer list item''s opening and closing <li> tags.

#### Quotations

HTML provides two main quotation elements: <blockquote> for long, block-level quotations (typically indented by default), and <q> for short, inline quotations (browsers typically add quotation marks automatically around <q> content). Both can use the cite attribute to reference the source URL of the quotation, which, while not visibly displayed by default, provides useful metadata.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag is used to create a list where the order of items does not matter?', 'MCQ', '<ul> creates an unordered list, typically displayed with bullet points, used when sequence is not important.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<ol>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<ul>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<dl>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<li>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which attribute would you use on an <ol> tag to start numbering from 5 instead of 1?', 'MCQ', 'The start attribute sets the initial number for an ordered list.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'type=''5''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'value=''5''', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'start=''5''', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'begin=''5''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In a description list, what is the correct pairing of tags?', 'MCQ', '<dt> defines the description term, and <dd> defines its corresponding detail/explanation.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<dl> for the term and <dt> for the detail', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<dt> for the term and <dd> for the detail', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<dd> for the term and <dt> for the detail', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<li> for the term and <dd> for the detail', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: To correctly nest a list, the inner <ul> or <ol> should be placed inside an <li> element of the outer list.', 'TRUE_FALSE', 'Nested lists are correctly structured by placing the inner list element inside an <li> of the outer list.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which element is most appropriate for a short, inline quotation within a sentence?', 'MCQ', '<q> is designed for short inline quotations, and browsers typically add quotation marks automatically.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<blockquote>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<q>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<dl>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<cite>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: You are building a recipe page that needs to show step-by-step cooking instructions in the correct sequence. Which list type is most appropriate?', 'MCQ', 'Since the steps must be followed in a specific sequence, an ordered list (<ol>) is the appropriate choice.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<ul>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<ol>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<dl>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<q>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the cite attribute on a <blockquote> or <q> element?', 'MCQ', 'The cite attribute references the source of the quotation, providing useful metadata even though it isn''t visibly rendered by default.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It changes the font style of the quote', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It provides a reference to the quote''s source URL as metadata', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is required for the quote to display at all', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It automatically numbers the quote', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 7 AND q.order_index = 7;

-- ============ Level 8: Building Tables ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Basic Table Structure

Tables are created with the <table> tag. Inside it, <tr> (table row) defines each row, and within each row, <td> (table data) defines a standard cell, while <th> (table header) defines a header cell, which browsers typically render as bold and centered by default. Example:
<table>
  <tr><th>Name</th><th>Age</th></tr>
  <tr><td>Alice</td><td>30</td></tr>
</table>

#### Table Sectioning Elements

Larger tables benefit from sectioning elements: <thead> wraps the header row(s), <tbody> wraps the main data rows, and <tfoot> wraps footer rows (such as totals). These elements don''t change the visible layout dramatically by default, but they improve semantic clarity, allow independent styling, and can help browsers optimize rendering for long tables (for example, keeping headers visible while scrolling, when combined with CSS).

#### Merging Cells: colspan and rowspan

The colspan attribute makes a cell span multiple columns, and rowspan makes a cell span multiple rows. For example, <td colspan=''2''>Total</td> makes that cell occupy the width of two columns. These attributes are useful for creating summary rows or grouped headers but must be used carefully, as miscounting spans can break the table''s visual alignment.

#### The caption Element

The <caption> tag provides a title or description for a table and must be the first child inside the <table> element. It is especially useful for accessibility, as it gives screen reader users context about the table''s purpose before they navigate into its data.

#### When to Use Tables

Tables should be used for genuinely tabular data — information naturally organized into rows and columns, like schedules, pricing comparisons, or datasets. They should not be used purely for page layout (positioning unrelated content side by side), which was a common but outdated practice before CSS layout tools like Flexbox and Grid became standard. Misusing tables for layout creates accessibility problems, since screen readers interpret table semantics literally.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag defines a header cell within a table row?', 'MCQ', '<th> defines a header cell, typically rendered bold and centered by default, distinct from a standard data cell (<td>).', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<td>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<tr>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<th>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<thead>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the colspan attribute do?', 'MCQ', 'colspan extends a cell horizontally across multiple columns.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Makes a cell span multiple rows', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Makes a cell span multiple columns', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Adds a border to a cell', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Colors the background of a cell', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which element should be the first child inside a <table> tag if a caption is used?', 'MCQ', '<caption> must appear as the first child of <table> and provides a title/description for the table.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<thead>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<tr>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<caption>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<tfoot>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: <thead>, <tbody>, and <tfoot> are purely decorative and have no effect on semantic meaning or accessibility.', 'TRUE_FALSE', 'These sectioning elements improve semantic clarity and accessibility, helping screen readers and other tools interpret table structure correctly.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is using tables purely for page layout (rather than tabular data) considered bad practice today?', 'MCQ', 'Using tables for layout misrepresents the content''s structure to assistive technologies, which interpret tables as tabular data, not generic layout containers.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Tables are no longer supported in modern browsers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It creates accessibility problems because screen readers interpret table semantics literally', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is impossible to style tables with CSS', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Tables cannot contain images or links', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer needs a summary row at the bottom of a financial table showing ''Total'' that should visually span across the first two columns. Which attribute should be used?', 'MCQ', 'colspan allows the ''Total'' cell to span across multiple columns within the same row.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'rowspan', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'colspan', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'caption', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'tfoot', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which sectioning element is most appropriate for wrapping rows that show column totals at the bottom of a table?', 'MCQ', '<tfoot> is designed to wrap footer rows, such as totals, at the bottom of a table.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<thead>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<tbody>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<tfoot>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<caption>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 8 AND q.order_index = 7;

-- ============ Level 9: Block vs Inline ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Block-Level Elements

Block-level elements always start on a new line and take up the full available width of their container by default, pushing subsequent content to the next line. Common block-level elements include <div>, <p>, <h1> through <h6>, <ul>, <ol>, and <table>. Even if a block element''s content is short, it still occupies the full width unless explicitly styled otherwise.

#### Inline Elements

Inline elements do not start on a new line — they flow within the surrounding text and only take up as much width as their content requires. Common inline elements include <a>, <span>, <strong>, <em>, and <img>. Multiple inline elements can sit next to each other on the same line, wrapping naturally like words in a sentence.

#### The div and span Elements

<div> is a generic block-level container with no inherent semantic meaning, used to group content for styling or scripting purposes. <span> is its inline equivalent — a generic inline container used to apply styling or behavior to a small piece of text without affecting the surrounding flow. Both are commonly used alongside CSS classes and IDs, though more semantic alternatives (covered in a later level) are often preferred when applicable.

#### Why This Distinction Matters

Understanding block versus inline behavior is essential for predicting how a page will visually flow before any CSS is applied. For example, placing two <div> elements next to each other in your code will still result in them stacking vertically, because divs are block-level by default. Placing two <span> elements next to each other, however, will keep them on the same line. This default behavior can later be overridden using CSS (such as display: inline-block or display: flex), but understanding the defaults is foundational.

#### Basic Layout Flow

By default, HTML content flows from top to bottom and left to right, following the order elements appear in the source code. This is often called the ''normal flow.'' Block elements stack vertically, while inline elements flow horizontally until they run out of space, at which point they wrap to a new line, much like text wrapping in a paragraph.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which best describes the default behavior of a block-level element?', 'MCQ', 'Block-level elements start on a new line and expand to fill their container''s width by default.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It stays on the same line as surrounding content', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It starts on a new line and takes up the full available width', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It can never contain other elements', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is always invisible until styled', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is an inline element by default?', 'MCQ', '<span> is an inline element, used to apply styling or scripting to a small piece of content without breaking the surrounding flow.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<div>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<p>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<span>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<table>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: <div> carries specific semantic meaning that tells browsers what kind of content it contains.', 'TRUE_FALSE', '<div> is a generic container with no inherent semantic meaning; it is used purely for grouping content for styling or scripting.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'If two <div> elements are placed next to each other in HTML with no CSS applied, how will they appear by default?', 'MCQ', 'Since <div> is block-level by default, each one starts on a new line, causing them to stack vertically.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Side by side on the same line', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Stacked vertically, one below the other', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Overlapping each other', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They will not render at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants to style just one word within a sentence without disrupting the paragraph''s normal text flow. Which element is most appropriate?', 'MCQ', '<span> is inline and designed for styling small portions of text without breaking the surrounding flow.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<div>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<span>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<p>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<section>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following correctly pairs an element with its default display type?', 'MCQ', '<a> is inline by default, while <h1> is block-level by default.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<a> - block, <h1> - inline', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<a> - inline, <h1> - block', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<span> - block, <div> - inline', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<p> - inline, <strong> - block', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 9 AND q.order_index = 7;

-- ============ Level 10: Getting Input ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The form Element

The <form> tag wraps all the elements that make up a form, such as input fields, labels, and buttons. While the form''s action and method attributes (which determine where and how submitted data is sent) are covered in more depth in a later level, at this stage it is enough to understand that <form> acts as a container that groups related input controls together for submission.

#### The input Element and Its Types

The <input> tag is the most commonly used form control, and its behavior changes based on its type attribute. Common types include: type=''text'' for single-line text entry, type=''password'' for masked text entry, type=''email'' for email addresses (which enables basic format validation in supporting browsers), type=''number'' for numeric values, and type=''checkbox'' for a toggle-able box. Each input should have a name attribute, which identifies the data when the form is submitted.

#### Labels

The <label> tag describes what an input field is for, and properly associating labels with inputs is essential for accessibility. This is done either by wrapping the input inside the label, or by giving the input an id and setting the label''s for attribute to match that id. Example:
<label for=''username''>Username:</label>
<input type=''text'' id=''username'' name=''username''>
Properly associated labels allow screen readers to announce the field''s purpose, and they also let users click the label text itself to focus the corresponding input.

#### Buttons

Forms typically include a submission button, created with <button type=''submit''>Submit</button> or <input type=''submit'' value=''Submit''>. There is also type=''button'', which creates a generic clickable button with no default form behavior, often used in combination with JavaScript, and type=''reset'', which clears all form fields back to their default values.

#### A Simple Example

A basic form combining these elements might look like:
<form>
  <label for=''email''>Email:</label>
  <input type=''email'' id=''email'' name=''email''>
  <button type=''submit''>Subscribe</button>
</form>
This structure — label, input, button — is the foundation for nearly every form you will build, with more advanced attributes and validation covered later.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which attribute on an <input> tag determines what kind of data the field is meant to collect (e.g., text, email, password)?', 'MCQ', 'The type attribute determines the input''s behavior and the kind of data it is designed to collect.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'name', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'type', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'value', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'id', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is the name attribute important on a form input?', 'MCQ', 'The name attribute identifies each piece of submitted data, allowing the receiving system to know which value corresponds to which field.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It changes the input''s visual appearance', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It identifies the data when the form is submitted', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is purely decorative and has no functional purpose', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is required only for checkboxes', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following correctly associates a label with its input using the for/id method?', 'MCQ', 'The label''s for attribute must match the input''s id attribute to correctly associate them.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<label for=''username''>Username</label><input type=''text'' name=''username''>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<label for=''username''>Username</label><input type=''text'' id=''username''>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<label id=''username''>Username</label><input type=''text'' for=''username''>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<label>Username</label><input type=''text'' label=''username''>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: A screen reader can announce a form field''s purpose correctly even if the label is not properly associated with the input.', 'TRUE_FALSE', 'Without proper association (via wrapping or matching for/id), screen readers may not correctly announce what the input field is for.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between <input type=''submit''> and <input type=''reset''>?', 'MCQ', 'type=''submit'' sends the form data, while type=''reset'' clears the form fields back to their original default values.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They behave identically in all cases', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '''submit'' clears the form, while ''reset'' submits it', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '''submit'' sends the form''s data, while ''reset'' clears all fields back to their default values', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '''reset'' is used only for checkboxes', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer creates an input field for collecting a user''s age. Which input type is most appropriate?', 'MCQ', 'type=''number'' is designed for numeric input, making it the most appropriate choice for a field like age.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'type=''text''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'type=''number''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'type=''checkbox''', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'type=''password''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which element acts as the container that groups related input controls together for submission?', 'MCQ', '<form> wraps and groups all related input elements, labels, and buttons together.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<input>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<label>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<form>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<button>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 10 AND q.order_index = 7;

-- ============ Level 11: Forms That Actually Work ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The action Attribute

The action attribute on a <form> tag specifies the URL where the form''s data should be sent upon submission. For example, <form action=''/submit-form''> tells the browser to send the collected data to the ''/submit-form'' endpoint on the server. If action is omitted, the form submits to the current page''s URL by default.

#### The method Attribute: GET vs POST

The method attribute determines how form data is sent. method=''get'' appends the form data directly to the URL as a query string (e.g., ?name=John&age=30), making it visible in the browser''s address bar. This is suitable for non-sensitive data like search queries, and it allows the resulting URL to be bookmarked or shared. method=''post'' sends data in the body of the HTTP request, keeping it out of the URL. This is more appropriate for sensitive data (like passwords) or large amounts of data, since POST requests are not limited by URL length and are not stored in browser history in the same visible way.

#### accept-charset

The accept-charset attribute specifies which character encodings the server accepts for form submission, such as accept-charset=''UTF-8''. UTF-8 is the modern standard, supporting virtually all characters and languages, and is the default assumption in nearly all modern web development.

#### autocomplete

The autocomplete attribute controls whether browsers may automatically fill in previously entered values for a field. Setting autocomplete=''off'' on a form or input disables this behavior, which can be useful for sensitive one-time fields like security codes, though browsers don''t always strictly honor this for fields like passwords due to their own built-in security and usability features.

#### autofocus

The autofocus attribute automatically places the cursor in a specified input field as soon as the page loads, saving the user a click. It should be used sparingly — typically on only one field per page, usually the first or most important field — since multiple autofocus attributes on a page create unpredictable, conflicting behavior.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the action attribute on a <form> tag define?', 'MCQ', 'The action attribute specifies the destination URL that will receive the submitted form data.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The visual style of the form', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The URL where form data is sent upon submission', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The type of data the form collects', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The number of fields in the form', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which submission method is generally more appropriate for sending a password during login?', 'MCQ', 'POST sends data in the request body rather than the URL, making it more appropriate for sensitive information like passwords.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'GET, because it is faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'POST, because it keeps data out of the visible URL and browser history', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'GET, because it allows bookmarking', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Neither method affects data visibility', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why might a search form reasonably use method=''get'' instead of method=''post''?', 'MCQ', 'Since GET appends data to the URL, search result pages become shareable and bookmarkable, which is often desirable for non-sensitive queries.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'GET is required for all forms by HTML standards', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'GET allows the resulting URL (with the search query) to be bookmarked and shared', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'GET is more secure than POST', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'POST does not support text input', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Multiple input fields on the same page can each safely have the autofocus attribute without causing any issues.', 'TRUE_FALSE', 'Using autofocus on multiple fields creates conflicting, unpredictable behavior since only one field can actually receive focus on page load.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the accept-charset attribute?', 'MCQ', 'accept-charset specifies which character encoding(s), such as UTF-8, are acceptable for the submitted form data.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It defines which character encodings the server accepts for the submitted data', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It determines the form''s visual theme', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It restricts which countries can submit the form', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It sets a password requirement', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer is building a one-time-use security code field and wants to discourage the browser from suggesting previously saved values. Which attribute should they consider applying?', 'MCQ', 'autocomplete=''off'' signals that the browser should not offer to autofill previously saved values for that field, appropriate for one-time codes.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'action=''off''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'method=''post''', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'autocomplete=''off''', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'autofocus=''true''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'If a form''s action attribute is omitted entirely, what happens by default?', 'MCQ', 'When action is omitted, the form defaults to submitting to the URL of the current page.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The form will fail to submit', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The form submits to the current page''s own URL', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The browser will prompt the user to enter a URL', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The form data will be discarded automatically', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 11 AND q.order_index = 7;

-- ============ Level 12: Structuring Like a Pro ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Why Semantic HTML?

Before HTML5, developers relied heavily on generic <div> elements with descriptive class names (like class=''header'') to organize pages, since no dedicated structural tags existed. HTML5 introduced semantic elements that describe their purpose directly through the tag name itself, improving accessibility, SEO, and code readability. Semantic elements don''t look any different from a <div> by default — their value lies in meaning, not appearance.

#### header and footer

The <header> element represents introductory content for its nearest ancestor (often the page, but it can also be used within an <article> or <section> for that specific block''s own header). It commonly contains a site logo, title, and navigation. The <footer> element represents closing content, often containing copyright information, contact details, or site links. Importantly, a page can contain multiple <header> and <footer> elements if used within different sectioning contexts.

#### nav

The <nav> element wraps major navigation links, such as a main menu. Not every group of links needs to be wrapped in <nav> — it is reserved for major navigation blocks, not every single link on a page (such as one-off links inside a paragraph).

#### section vs article

The <article> element represents a self-contained piece of content that could be independently distributed or syndicated, such as a blog post, news story, or forum post. The <section> element represents a thematic grouping of content, typically with its own heading, but it does not need to make sense entirely on its own outside the page. A useful test: if content could be pulled out and published elsewhere while still making complete sense, it''s likely an <article>; if it''s just a logical section of a larger page, <section> is more appropriate.

#### aside

The <aside> element represents content that is tangentially related to the main content, such as a sidebar, pull quote, or advertisement. It signals to assistive technology and search engines that this content is supplementary rather than central to the page''s primary purpose.

#### Choosing Between Semantic Tags and div

When no semantic element correctly describes a content block''s purpose — for example, a purely visual wrapper used only for styling or layout grouping — <div> remains the appropriate choice. Semantic tags should be chosen based on meaning, not forced into use where they don''t accurately apply.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the primary benefit of using semantic HTML elements over generic <div> tags with class names?', 'MCQ', 'Semantic elements communicate the purpose of content directly, which benefits accessibility tools, search engines, and developers reading the code.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Semantic elements render faster in all browsers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Semantic elements improve accessibility, SEO, and code readability by conveying meaning through the tag itself', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Semantic elements automatically apply CSS styling', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Semantic elements are required for HTML5 validation', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Can a single HTML page contain more than one <header> element?', 'TRUE_FALSE', 'A page can contain multiple <header> elements if they are used within different sectioning contexts, such as inside individual <article> elements.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which element is most appropriate for a self-contained blog post that could be independently syndicated elsewhere?', 'MCQ', '<article> is designed for self-contained content that makes sense independently, such as a blog post or news story.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<section>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<aside>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<article>', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<div>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What distinguishes <section> from <article>?', 'MCQ', 'Article content should make sense on its own if extracted; section content is a thematic grouping within a larger context and doesn''t need to stand alone.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<section> requires JavaScript and <article> does not', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<article> represents independently distributable content, while <section> represents a thematic grouping that need not stand alone', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They are functionally identical with no meaningful difference', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<section> can only appear inside <article>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A blog post page includes a sidebar showing ''related articles'' that are not essential to understanding the main post. Which element is most appropriate for this sidebar?', 'MCQ', '<aside> is designed for content that is tangentially related to the main content, such as a sidebar of related links.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<nav>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<aside>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<header>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<article>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Every link on a webpage, including a single inline link inside a paragraph, should be wrapped in a <nav> element.', 'TRUE_FALSE', '<nav> is reserved for major navigation blocks, not every individual link; wrapping every link in <nav> misuses the element''s purpose.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'When is using a generic <div> still appropriate in HTML5?', 'MCQ', '<div> remains appropriate when content has no specific semantic meaning to convey, such as a wrapper used purely for layout or styling purposes.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Never, since semantic tags have fully replaced div', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'When no semantic element accurately describes the content''s purpose, such as a purely visual styling wrapper', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only inside <article> elements', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only for the page''s main header', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 12 AND q.order_index = 7;

-- ============ Level 13: Media on the Page ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The audio Tag

The <audio> tag embeds sound content, such as music or podcasts. It requires a source, specified either through the src attribute directly on the tag or through one or more nested <source> elements (useful for providing multiple file formats for browser compatibility). Example:
<audio controls>
  <source src=''song.mp3'' type=''audio/mpeg''>
  Your browser does not support the audio element.
</audio>
The text inside the tag (''Your browser does not support...'') is fallback content, displayed only if the browser cannot play HTML5 audio at all.

#### The video Tag

The <video> tag works similarly to <audio> but for video content, and also supports a poster attribute, which specifies an image to display before playback begins. Example:
<video controls width=''640'' poster=''thumbnail.jpg''>
  <source src=''movie.mp4'' type=''video/mp4''>
  Your browser does not support the video element.
</video>

#### Key Media Attributes

controls displays the browser''s built-in playback interface (play/pause button, volume, progress bar). Without it, there is no visible way for users to control playback unless custom controls are built separately with JavaScript. autoplay starts playback automatically when the page loads. loop restarts the media automatically when it finishes. muted starts the media without sound, which is often required by modern browsers in order for autoplay to function at all.

#### Why Autoplay Is Controversial

Autoplaying media — especially with sound — is widely considered poor practice because it can be jarring, consume unexpected bandwidth (especially on mobile data), and create accessibility issues for users with cognitive or attention-related conditions, or those using screen readers, who may have sound playback interfere with the assistive audio they rely on. Most modern browsers block autoplay with sound unless the media is muted, specifically to curb this disruptive pattern.

#### Multiple Sources for Compatibility

Not all browsers support every audio or video file format. Providing multiple <source> elements with different formats and matching type attributes (such as both an MP4 and a WebM version of the same video) allows the browser to choose whichever format it supports, ensuring broader compatibility.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the controls attribute on an <audio> or <video> element?', 'MCQ', 'The controls attribute displays the browser''s default playback UI, such as play/pause buttons and a progress bar.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It changes the volume permanently', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It displays the browser''s built-in playback interface', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It hides the media element entirely', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is required for the media to load at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why do most modern browsers require the muted attribute alongside autoplay?', 'MCQ', 'Browsers restrict autoplay with sound by requiring muted, specifically to prevent the disruptive experience of unexpected audio.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because autoplay does not work without it under any circumstances in older browsers too', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'To curb the disruptive and jarring experience of unexpected sound playing automatically', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because muted is required for the video tag to render at all', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Because autoplay and muted are functionally identical', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the poster attribute do on a <video> element?', 'MCQ', 'poster specifies an image displayed before the video starts playing, often used as a preview thumbnail.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Specifies a fallback audio track', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Specifies an image shown before playback begins', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Loops the video automatically', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Sets the video''s playback speed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Providing multiple <source> elements with different file formats inside a <video> tag improves cross-browser compatibility.', 'TRUE_FALSE', 'Since not all browsers support every video format, multiple sources let the browser choose a format it can play.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is autoplaying media with sound considered an accessibility concern?', 'MCQ', 'Unexpected autoplaying sound can clash with screen reader audio and create a disruptive experience for users with certain cognitive or attention-related needs.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It has no real accessibility impact', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It can interfere with assistive audio tools like screen readers and disrupt users with attention-related conditions', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It only affects users with slow internet connections', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is purely a bandwidth issue with no accessibility relevance', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants background music to loop continuously without user interaction on a webpage, while complying with common browser autoplay restrictions. Which combination of attributes is most likely required?', 'MCQ', 'Most browsers require muted alongside autoplay for it to function, and loop ensures continuous playback.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'controls and poster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'autoplay and loop, combined with muted', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'loop only, with no other attributes', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'autoplay alone, without muted', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the fallback text placed between the opening and closing <audio> or <video> tags?', 'MCQ', 'The fallback text is only rendered when the browser entirely lacks support for HTML5 audio/video elements.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It is shown in addition to the media, as a caption', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It is displayed only if the browser cannot support HTML5 media playback at all', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It replaces the need for a source attribute', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It controls the volume level', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 13 AND q.order_index = 7;

-- ============ Level 14: Embedding the Web ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is an iframe?

The <iframe> (inline frame) element embeds another HTML document within the current page, effectively creating a ''window'' into separate content. This is commonly used to embed maps, videos, advertisements, or third-party widgets without leaving the host page. Example: <iframe src=''https://example.com/map'' width=''600'' height=''400''></iframe>.

#### Sizing an iframe

The width and height attributes (or equivalent CSS) control the visible dimensions of the embedded content. Unlike many other elements, an iframe''s content does not automatically resize based on its content — the iframe is essentially a fixed-size viewport into another document, and the embedded page''s own content scrolls or is clipped within that fixed area unless specifically designed to be responsive.

#### The sandbox Attribute

The sandbox attribute applies a set of restrictions to the embedded content, such as disabling scripts, form submission, or top-level navigation, depending on which sandbox values are specified. Adding sandbox with no values applies the strictest possible restrictions; specific permissions (like allow-scripts) can be added back individually. This is a key security feature when embedding untrusted third-party content.

#### Security Considerations

Because an iframe loads an entirely separate document, embedding content from untrusted sources carries security risks, including clickjacking (tricking users into clicking something different from what they perceive, by overlaying invisible iframes) and exposure to malicious scripts. The sandbox attribute and the related Content-Security-Policy HTTP header (set at the server level, not in HTML) are common defenses. As a general principle, iframes should only embed trusted sources.

#### When to Use (and Avoid) iframes

Iframes are appropriate for legitimately embedding separate, independently maintained content — like an embedded YouTube video or Google Map — where recreating that functionality yourself would be impractical. They are generally inappropriate as a layout tool for splitting up your own site''s pages, since this creates accessibility issues, complicates navigation (e.g., browser back/forward buttons behaving unexpectedly), and can hurt SEO, since search engines may not properly index content inside iframes as part of the main page.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the <iframe> element do?', 'MCQ', '<iframe> embeds a separate HTML document inline within the current page, like a window into another page.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It creates a new browser tab', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It embeds another HTML document within the current page', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is used exclusively for displaying images', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the need for the <img> tag', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What happens to an iframe''s embedded content if it doesn''t fit within the specified width and height?', 'MCQ', 'An iframe is a fixed-size viewport; content beyond its dimensions will scroll or be clipped unless the embedded page is designed responsively.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The iframe automatically resizes to fit all content', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The content scrolls or is clipped within the fixed-size viewport, unless the embedded page itself is responsive', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The page will fail to load', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The browser will throw an error', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does adding the sandbox attribute with no specified values do to an embedded iframe?', 'MCQ', 'An empty sandbox attribute applies maximum restrictions; specific permissions must be explicitly added back if needed.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It has no effect unless values are specified', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It applies the strictest possible set of restrictions to the embedded content', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It deletes the iframe''s content', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It automatically enables all scripts', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Embedding third-party content via iframe carries no security risk as long as width and height are set correctly.', 'TRUE_FALSE', 'Security risks like clickjacking and malicious scripts are unrelated to sizing; they depend on the trustworthiness of the embedded source and protections like sandbox.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why are iframes generally discouraged as a layout tool for splitting up a site''s own pages?', 'MCQ', 'Using iframes for layout creates navigation and accessibility problems and can interfere with how search engines index page content.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because iframes are deprecated and no longer supported', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Because it creates accessibility issues, complicates navigation, and can hurt SEO indexing', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because iframes cannot contain any text content', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Because browsers limit each page to only one iframe', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants to embed a YouTube video on their page without recreating video playback functionality from scratch. Which approach is most appropriate?', 'MCQ', 'Embedding via an official <iframe> embed code is the standard, supported way to include YouTube videos without rebuilding playback functionality.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Use a <video> tag pointing directly to YouTube''s internal servers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Use an <iframe> with YouTube''s official embed URL', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Use a <div> styled to look like a video player', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Use an <img> tag with a video file as the source', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is clickjacking, in the context of iframe security?', 'MCQ', 'Clickjacking exploits iframes by overlaying invisible or disguised content to trick users into unintended clicks.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A method for speeding up iframe load times', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A technique where users are tricked into clicking something different from what they perceive, often via overlaid invisible iframes', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A type of CSS animation', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A way to validate HTML syntax', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 14 AND q.order_index = 7;

-- ============ Level 15: Forms Like a Pro ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Advanced Input Types

Beyond basic text and email fields, HTML5 provides specialized input types that improve usability and trigger appropriate device interfaces. type=''date'' opens a date picker, type=''url'' validates URL-like syntax, type=''tel'' is intended for phone numbers (and triggers a numeric keypad on mobile devices, though it does not enforce a specific format on its own), type=''range'' creates a slider control bounded by min and max, and type=''color'' opens a color picker. Choosing the correct type improves both usability and the quality of built-in validation.

#### Native Validation Attributes

HTML5 supports validation without any JavaScript through several attributes: required prevents submission if the field is empty, min and max set numeric or date boundaries, minlength and maxlength constrain text length, and step defines valid increments for numeric or range inputs (for example, step=''5'' on a number input only allows multiples of 5 from the starting value). When validation fails, browsers display a built-in error message and prevent submission automatically.

#### The pattern Attribute

The pattern attribute allows custom validation using a regular expression (regex) — a sequence of characters defining a search pattern for text matching. For example, pattern=''[0-9]{5}'' would only accept exactly five digits, useful for validating a postal code format. Regular expressions are a powerful but separate skill; for form validation purposes, it''s enough to understand that pattern checks the input''s value against a defined text structure and rejects submission if it doesn''t match.

#### Limitations of Native Validation

While native HTML5 validation handles many common cases without writing any JavaScript, it has limits: it cannot validate logic that depends on multiple interrelated fields (such as confirming a password match), cannot communicate with a server to check uniqueness (like confirming a username isn''t already taken), and its default error messages and styling vary slightly between browsers. For more complex needs, JavaScript-based validation is typically layered on top of, not instead of, native HTML validation, since native validation still provides a fast, accessible first line of defense.

#### Combining Attributes for Robust Forms

A well-built field often combines several validation attributes together. For example:
<input type=''email'' required maxlength=''100'' placeholder=''you@example.com''>
This ensures the field isn''t empty, follows basic email syntax, doesn''t exceed a reasonable length, and shows helpful placeholder text — all without a single line of JavaScript.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which input type is most appropriate for a webpage''s volume control where users select a value within a defined range?', 'MCQ', 'type=''range'' creates a slider control suited for selecting a value within a bounded range, like volume.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'type=''number''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'type=''range''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'type=''text''', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'type=''date''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the required attribute do on a form input?', 'MCQ', 'required ensures the browser blocks submission and shows a validation message if the field is empty.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It hides the field until clicked', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It prevents form submission if the field is left empty', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It automatically fills the field with a default value', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It restricts the field to numeric input only', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the pattern attribute on an input field?', 'MCQ', 'pattern validates input against a regular expression, allowing custom text-matching rules.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It sets the input''s background color pattern', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It validates the input''s value against a custom regular expression', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It limits the number of characters allowed', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It defines the step increment for number inputs', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is a limitation of native HTML5 validation?', 'MCQ', 'Native validation handles single-field rules well but cannot natively check relationships between multiple fields, such as password confirmation.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It cannot validate logic that depends on multiple interrelated fields, such as confirming matching passwords', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It requires a separate plugin to function at all', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It only works in one specific browser', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It cannot be combined with the required attribute', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: JavaScript-based form validation typically replaces native HTML5 validation entirely in professional development.', 'TRUE_FALSE', 'JavaScript validation is typically layered on top of native HTML5 validation rather than replacing it, since native validation still provides a fast, accessible baseline.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A form field must accept only exactly four digits, such as a PIN code. Which attribute would best enforce this exact structure?', 'MCQ', 'A pattern using regex, such as [0-9]{4}, precisely enforces exactly four digits, which maxlength or type alone cannot guarantee.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'min=''4''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'maxlength=''4'' alone, with no other attributes', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'pattern=''[0-9]{4}''', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'type=''number'' alone, with no other attributes', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the step attribute control on a numeric or range input?', 'MCQ', 'step defines the valid increment values, such as only allowing multiples of 5 starting from the input''s minimum.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The number of fields submitted at once', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The valid increments allowed between the input''s minimum and selected value', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The font size of the input', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Whether the field is required', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 15 AND q.order_index = 7;

-- ============ Level 16: Images That Adapt & SVG in Practice ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### The Problem Responsive Images Solve

A single fixed image file is often poorly suited to every device. A large, high-resolution image wastes bandwidth on small mobile screens, while a small image looks blurry when stretched on a large, high-density display. Responsive image techniques let the browser choose the most appropriate image file based on screen size, resolution, or layout, without requiring separate pages for different devices.

#### srcset and sizes

The srcset attribute on an <img> tag lists multiple image file options along with their intrinsic widths, such as:
<img src=''photo-800.jpg'' srcset=''photo-400.jpg 400w, photo-800.jpg 800w, photo-1200.jpg 1200w'' sizes=''(max-width: 600px) 400px, 800px'' alt=''A mountain landscape''>
The browser uses the sizes attribute (describing how wide the image will display at different viewport widths) together with srcset to choose the most efficient file to download. This technique, called resolution switching, serves the same image content at different file sizes.

#### The picture Element and Art Direction

While srcset handles resolution switching (same image, different sizes), the <picture> element handles art direction — serving genuinely different image crops or compositions depending on screen size, such as a tightly cropped portrait version for mobile versus a wide landscape version for desktop. The <picture> element contains multiple <source> elements with media conditions, plus a fallback <img>:
<picture>
  <source media=''(max-width: 600px)'' srcset=''portrait.jpg''>
  <source media=''(min-width: 601px)'' srcset=''landscape.jpg''>
  <img src=''landscape.jpg'' alt=''Scenic view''>
</picture>

#### Inline SVG Basics

SVG (Scalable Vector Graphics) describes images using mathematical shapes and paths rather than pixels, meaning SVG images scale perfectly to any size without losing quality. Inline SVG is written directly in HTML using the <svg> tag, containing shape elements like <circle>, <rect>, <line>, and <path>. Example: <svg viewBox=''0 0 100 100''><circle cx=''50'' cy=''50'' r=''40'' /></svg> draws a circle.

#### Understanding viewBox

The viewBox attribute defines the coordinate system and aspect ratio of the SVG''s internal drawing area, written as four numbers: min-x, min-y, width, height. It allows the SVG to scale responsively within its container while preserving the proportions and positions of shapes drawn relative to that internal coordinate space, independent of the SVG element''s actual rendered size on the page.

#### SVG vs img for Vector Content

SVG can be included either inline (directly in HTML, as shown above) or referenced externally via <img src=''icon.svg''>. Inline SVG allows CSS and JavaScript to directly target and manipulate individual shapes within it (such as changing a specific path''s color on hover), while an externally referenced SVG via <img> is treated as a single static image and cannot be manipulated piece by piece. The choice depends on whether that level of interactivity or styling control is needed.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What problem does responsive image technique (such as srcset) primarily solve?', 'MCQ', 'Responsive images let the browser choose the most efficient image file for the device''s screen size and resolution, balancing quality and bandwidth.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It allows images to be encrypted', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It lets browsers select an appropriately sized image file based on device characteristics, avoiding wasted bandwidth or blurriness', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It removes the need for the alt attribute', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It automatically compresses all images to the same file size', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between resolution switching (via srcset) and art direction (via picture)?', 'MCQ', 'srcset/sizes serves different-sized versions of the same image, while <picture> can serve entirely different crops or compositions depending on conditions.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'There is no real difference; they solve identical problems', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Resolution switching serves the same image at different sizes, while art direction serves genuinely different image compositions based on screen size', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Art direction only works with SVG images', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Resolution switching requires JavaScript while art direction does not', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the viewBox attribute control on an SVG element?', 'MCQ', 'viewBox defines the internal coordinate space and proportions for shapes, allowing the SVG to scale responsively while preserving relative positioning.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The file size of the SVG', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The internal coordinate system and aspect ratio used for drawing shapes, independent of the element''s rendered size', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The color palette available to the SVG', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Whether the SVG supports animation', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: SVG images lose visual quality when scaled to a much larger size, similar to raster image formats like JPEG.', 'TRUE_FALSE', 'SVG is vector-based, using mathematical descriptions of shapes, so it scales to any size without losing quality, unlike raster formats.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why might a developer choose inline SVG over referencing an SVG file with <img src=''icon.svg''>?', 'MCQ', 'Inline SVG exposes its internal shape elements to CSS and JavaScript for fine-grained styling or manipulation, unlike an externally referenced SVG treated as one static image.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Inline SVG loads faster under all circumstances', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Inline SVG allows CSS and JavaScript to directly target and manipulate individual shapes within it', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Referenced SVG files cannot be displayed at all in modern browsers', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'There is no functional difference between the two approaches', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A news website wants to show a tightly cropped close-up photo on mobile devices but a wide panoramic version of the same scene on desktop. Which technique is most appropriate?', 'MCQ', 'Since the mobile and desktop versions require genuinely different crops/compositions (not just different sizes of the same image), this is an art direction use case suited to <picture>.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'srcset with multiple resolutions of the same crop', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The picture element with different source elements for art direction', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A single img tag with a fixed width', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'An inline SVG of the photo', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In the srcset attribute, what does a value like ''800w'' represent?', 'MCQ', 'The ''w'' descriptor in srcset specifies the image file''s intrinsic width in pixels, which the browser uses alongside the sizes attribute to select the best file.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The image''s width in centimeters', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The image''s intrinsic pixel width, used by the browser to choose the appropriate file', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A weight value affecting image priority loading', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The display duration of the image', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 16 AND q.order_index = 7;

-- ============ Level 17: Interactive Without JS ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### details and summary

The <details> element creates a collapsible widget that the user can open and close, while the nested <summary> element defines the visible label that remains shown when the content is collapsed. Example:
<details>
  <summary>Click to expand</summary>
  <p>Hidden content revealed on click.</p>
</details>
By default, <details> is collapsed; adding the open attribute (e.g., <details open>) makes it expanded on page load. This single combination replaces what used to require JavaScript-driven accordion widgets for simple cases.

#### The dialog Element

The <dialog> element represents a native dialog box or modal window. It can be displayed as a regular embedded box, but its real value comes from its open attribute and its two associated methods accessible via JavaScript: .show() (displays it as a regular, non-modal dialog) and .showModal() (displays it as a true modal, dimming and disabling interaction with the rest of the page until closed). Even though triggering it typically still involves a small amount of JavaScript today, the element itself natively handles modal behavior, focus trapping, and accessibility concerns that previously required substantial custom code.

#### Closing a dialog

A <dialog> can be closed using a <form method=''dialog''> containing a submit button, which closes the dialog without needing JavaScript for that specific action, or via the .close() method when JavaScript is used. Using method=''dialog'' on a nested form is a clean, JavaScript-free way to let users dismiss the dialog.

#### The popover Attribute

The popover attribute, added directly to any element, designates it as a popover — content that displays on top of other page content and is automatically dismissed when clicking outside it or pressing Escape, without requiring custom JavaScript for that dismissal behavior. It is typically paired with a triggering button using the popovertarget attribute, which references the popover element''s id. Example:
<button popovertarget=''info''>Show Info</button>
<div id=''info'' popover>Helpful information here.</div>
This pattern covers many cases (tooltips, menus, notifications) that previously required JavaScript to manage visibility and outside-click dismissal.

#### Where JavaScript Is Still Needed

While these elements cover many common interactive patterns natively, more complex behavior — such as animating the transition between open and closed states with custom timing, synchronizing multiple interactive widgets together, or building entirely custom interaction patterns not covered by these elements — still requires JavaScript. These native elements reduce, but do not eliminate, the need for scripting in interactive interfaces.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the <summary> element when used inside <details>?', 'MCQ', '<summary> provides the always-visible label/trigger for the collapsible <details> widget.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It hides the entire details widget permanently', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It defines the visible label that remains shown when the details content is collapsed', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It automatically submits a form', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It has no visual effect on the page', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does adding the open attribute to a <details> element do?', 'MCQ', 'By default <details> is collapsed; the open attribute makes it appear expanded when the page loads.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It disables the widget entirely', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It makes the details content expanded by default on page load', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It removes the summary label', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It converts the element into a dialog', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between calling .show() versus .showModal() on a dialog element?', 'MCQ', '.showModal() creates a true modal experience with the rest of the page disabled, while .show() displays it as a non-modal dialog.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They are functionally identical', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '.showModal() displays the dialog as a true modal that disables interaction with the rest of the page, while .show() does not', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '.show() only works on mobile devices', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '.showModal() permanently closes the dialog after use', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How can a dialog be closed without using JavaScript?', 'MCQ', 'A form with method=''dialog'' inside the dialog allows a submit button to close it natively, without JavaScript.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It is impossible to close a dialog without JavaScript', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'By using a nested <form method=''dialog''> with a submit button', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'By adding the popover attribute to it', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'By removing the open attribute manually in the browser''s address bar', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the popovertarget attribute on a button do?', 'MCQ', 'popovertarget references the id of the element that should be shown/toggled as a popover when the button is activated.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It styles the button''s background color', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It links the button to a popover element (by id) that it will toggle', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It disables the popover from being dismissed', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is used only with the dialog element', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: The introduction of details, dialog, and popover completely eliminates the need for JavaScript in all interactive web interfaces.', 'TRUE_FALSE', 'These elements cover many common patterns natively, but complex custom behavior, animations, and synchronized widgets still require JavaScript.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants to build a simple FAQ accordion where clicking a question reveals the answer, with no need for custom animations. Which native HTML approach is most appropriate?', 'MCQ', '<details>/<summary> is purpose-built for simple collapsible question/answer patterns like FAQ accordions, without requiring JavaScript.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<dialog> for each question', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<details> and <summary> for each question/answer pair', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The popover attribute on the entire FAQ section', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'This requires JavaScript and cannot be done natively', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 17 AND q.order_index = 7;

-- ============ Level 18: HTML for SEO ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### SEO-Relevant Meta Tags

Beyond the basic <title> tag (which heavily influences search rankings and is shown as the clickable headline in search results), the meta description tag — <meta name=''description'' content=''A concise summary of the page.''> — provides the snippet text often shown beneath the title in search results. While the description tag does not directly boost ranking the way it once did, a well-written one can improve click-through rates, since it shapes how the page is presented to users browsing search results.

#### Open Graph Tags

Open Graph (OG) tags, originally developed by Facebook but now widely adopted, control how a page appears when shared on social media platforms. Common OG tags include og:title (the title shown in the shared preview), og:description, og:image (the preview image), and og:url (the canonical URL for the shared content). Example: <meta property=''og:title'' content=''10 Tips for Learning HTML''>. Without these tags, social platforms often guess at appropriate content, sometimes inaccurately.

#### Twitter Card Tags

Similarly, Twitter (X) uses its own set of meta tags, prefixed with twitter:, such as twitter:card (defining the card layout type, e.g., ''summary_large_image''), twitter:title, and twitter:description. Many of these values can fall back to Open Graph equivalents if Twitter-specific tags are absent, but providing both ensures more precise control over the appearance across platforms.

#### The canonical Link Element

When the same or similar content is accessible via multiple URLs (for example, with and without tracking parameters, or via both HTTP and HTTPS), search engines may treat these as duplicate content, which can dilute ranking signals. The canonical link element, <link rel=''canonical'' href=''https://example.com/page''>, tells search engines which URL should be treated as the authoritative version, consolidating ranking signals to that one URL.

#### Structured Data Basics

Structured data refers to a standardized format (commonly JSON-LD, embedded within a <script type=''application/ld+json''> tag) that explicitly describes a page''s content in a way search engines can directly parse, such as marking up a recipe''s ingredients, cooking time, and ratings. This can enable ''rich results'' in search listings, like star ratings or recipe cards, going beyond a standard blue link. While implementing structured data syntax in depth is a more specialized skill, understanding its purpose — giving search engines explicit, machine-readable context about content — is foundational to modern SEO practice.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the primary purpose of the meta description tag?', 'MCQ', 'The meta description provides the descriptive snippet shown in search results, influencing click-through behavior rather than directly boosting ranking.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It directly and significantly boosts search ranking position on its own', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It provides snippet text often shown beneath the title in search results, which can influence click-through rates', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It controls the page''s font size', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is required for the page to be indexed at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What do Open Graph tags primarily control?', 'MCQ', 'Open Graph tags define how a page''s preview (title, description, image) appears when shared on social platforms.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The page''s loading speed', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'How a page appears when shared on social media platforms', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The browser''s address bar color', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The page''s HTML validation status', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why might a developer include both Open Graph tags and Twitter Card tags on the same page?', 'MCQ', 'While Twitter can fall back to Open Graph values, providing dedicated Twitter Card tags allows finer control over how content appears specifically on that platform.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because they are required to be identical, so including both is redundant but mandatory', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Because Twitter-specific tags allow more precise control of the Twitter/X preview, even though some values can fall back to Open Graph equivalents', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because Open Graph tags do not work in any browser', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Because Twitter Card tags replace the need for a meta description', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What problem does the canonical link element solve?', 'MCQ', 'The canonical tag consolidates ranking signals to one authoritative URL when the same content exists at multiple URLs.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It speeds up page load times', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It tells search engines which URL is the authoritative version when content is accessible via multiple URLs, preventing duplicate content dilution', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It encrypts the page''s content', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It automatically translates the page into other languages', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Structured data (such as JSON-LD) is primarily intended to make content more visually appealing to human readers viewing the page directly.', 'TRUE_FALSE', 'Structured data is intended to give search engines explicit, machine-readable context about content, not to change the page''s visual appearance for human visitors.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: An e-commerce site has the same product accessible at both example.com/shirt and example.com/shirt?ref=email. What is the most appropriate way to prevent search engines from treating these as separate duplicate pages?', 'MCQ', 'A canonical link tells search engines which URL is authoritative, consolidating signals from both versions to the preferred one.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Add a canonical link pointing to example.com/shirt on both versions', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Add separate meta descriptions to each URL', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Block one of the URLs entirely using an iframe', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Add an Open Graph tag specifying the preferred URL', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which format is most commonly used to implement structured data on a webpage?', 'MCQ', 'JSON-LD, embedded via a script tag with type=''application/ld+json'', is the most common modern format for structured data.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'CSV embedded in a <table> tag', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'JSON-LD embedded in a <script type=''application/ld+json''> tag', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Plain text inside an HTML comment', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'XML embedded directly inside the <body>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 18 AND q.order_index = 7;

-- ============ Level 19: Accessibility Deep Dive ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is ARIA?

ARIA (Accessible Rich Internet Applications) is a set of attributes that can be added to HTML elements to improve accessibility, particularly for custom or complex interface components that native HTML doesn''t fully describe on its own. ARIA does not change an element''s appearance or behavior — it only changes how assistive technologies, like screen readers, interpret and announce that element.

#### The First Rule of ARIA

The foundational guideline for using ARIA is: if a native HTML element or attribute already provides the needed semantics and behavior, use it instead of re-purposing a generic element with ARIA roles. For example, using a real <button> element is preferable to using a <div role=''button''> with added JavaScript and ARIA attributes to simulate button behavior, because the native <button> already comes with built-in keyboard support, focus handling, and semantics. ARIA should supplement HTML, not replace good semantic structure.

#### Common ARIA Roles and Attributes

role defines what an element represents when no native HTML equivalent fits, such as role=''alert'' for an important, time-sensitive message. aria-label provides an accessible name for an element when visible text isn''t sufficient or present, such as <button aria-label=''Close menu''><svg>...</svg></button> for an icon-only button. aria-hidden=''true'' hides an element from assistive technology entirely (while it may remain visually visible), useful for purely decorative elements like icons that already have an adjacent text label. aria-live announces dynamic content changes to screen reader users automatically, with values like ''polite'' (announced when convenient) or ''assertive'' (announced immediately, interrupting current speech).

#### Keyboard Navigation

Many users navigate websites using only a keyboard — whether due to motor impairments, visual impairments combined with screen readers, or simple preference. Every interactive element must be reachable and operable via keyboard alone, typically using the Tab key to move between focusable elements and Enter or Space to activate them. The tabindex attribute can adjust an element''s position in this focus order, with tabindex=''0'' adding a non-naturally-focusable element (like a div) into the natural tab order, and tabindex=''-1'' removing an element from the tab order while still allowing it to be focused programmatically.

#### Recap: Semantic HTML and ARIA Together

Accessibility deep dives often involve combining everything learned across earlier levels: meaningful headings, descriptive alt text and link text, semantic structural elements like <nav> and <main>, native interactive elements like <button> and <details>, and ARIA only where native HTML genuinely falls short — such as describing live regions or complex custom widgets that have no native equivalent.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the primary effect of adding ARIA attributes to an HTML element?', 'MCQ', 'ARIA attributes affect how assistive technology interprets elements; they do not change visual appearance or natively add behaviors like keyboard support.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It changes the element''s visual styling', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It changes how assistive technologies interpret and announce the element, without altering its appearance or default behavior', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It automatically adds keyboard support to any element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the need for valid HTML structure entirely', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'According to the first rule of ARIA usage, when should a native HTML element be chosen over a generic element with ARIA roles?', 'MCQ', 'The first rule of ARIA states that native HTML elements, which come with built-in behavior and semantics, should be preferred over recreating that behavior manually with ARIA.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Never; ARIA roles are always preferable', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Whenever a native element already provides the needed semantics and behavior, such as using <button> instead of a div with role=''button''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only when building forms', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only on mobile devices', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does aria-hidden=''true'' do when applied to an element?', 'MCQ', 'aria-hidden hides content specifically from assistive technology; the element can still be visually present on the page.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It removes the element from the page entirely, including visually', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It hides the element from assistive technology while it may remain visually visible', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It makes the element flash to draw attention', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is identical in effect to using the HTML hidden attribute', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which aria-live value would be most appropriate for an urgent error message that should interrupt the screen reader immediately?', 'MCQ', 'aria-live=''assertive'' interrupts current screen reader speech immediately, appropriate for urgent messages.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'aria-live=''polite''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'aria-live=''assertive''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'aria-live=''off''', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'aria-live=''hidden''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: tabindex=''-1'' removes an element from the natural tab order while still allowing it to be focused programmatically (for example, via JavaScript).', 'TRUE_FALSE', 'tabindex=''-1'' takes an element out of the keyboard tab sequence but does not prevent it from receiving focus through other means, such as a script call.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer builds an icon-only button (no visible text) that closes a modal. What is the most appropriate way to make this accessible?', 'MCQ', 'Since there''s no visible text, aria-label provides an accessible name so screen reader users understand the button''s purpose.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Leave it as is, since icons are self-explanatory to all users', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Add aria-label=''Close'' to the button so screen readers announce its purpose', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Add aria-hidden=''true'' to the button', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Add tabindex=''-1'' to remove it from the tab order', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why must interactive elements be operable using only a keyboard?', 'MCQ', 'Keyboard-only navigation is essential for users with certain motor or visual impairments, making full keyboard operability a core accessibility requirement.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because mouse support is being deprecated from all browsers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Because many users, including those with motor or visual impairments, rely on keyboard-only navigation', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because keyboard navigation is faster for all users in every case', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Because it is purely a stylistic preference with no accessibility relevance', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 19 AND q.order_index = 7;

-- ============ Level 20: HTML Meets the Real World ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### data-* Attributes

Custom data attributes, written as data-followed-by-any-name (e.g., data-user-id=''482'', data-status=''active''), allow developers to store extra information directly on an HTML element without affecting its appearance or behavior natively. This data can then be read by JavaScript (via the dataset property, e.g., element.dataset.userId) or targeted by CSS attribute selectors. They are widely used to connect markup with application logic in a clean, standards-compliant way, rather than relying on non-standard or misused attributes.

#### The template Element

The <template> element holds HTML markup that is not rendered when the page loads — its content is inert (inactive) until explicitly activated, typically via JavaScript, which clones the template''s content and inserts it into the visible document. This is useful for defining a reusable chunk of markup once (such as a card layout) and stamping out multiple instances of it dynamically, rather than duplicating the same HTML repeatedly in the source.

#### The slot Element and Web Components

The <slot> element is used within Web Components (a browser standard for creating custom, reusable HTML elements) to define a placeholder where external content can be inserted when the custom component is used. This allows a custom component''s internal structure to remain fixed while still accepting flexible, user-provided content — conceptually similar to how a photo frame has a fixed structure but holds a different photo each time.

#### How Frameworks Build on HTML

Modern JavaScript frameworks like React and Vue do not replace HTML — they generate it dynamically. React''s JSX syntax, for instance, closely resembles HTML but compiles down to actual HTML elements rendered in the browser. Concepts learned in plain HTML directly carry over: semantic structure still matters, accessibility attributes still apply, and understanding how the browser parses and displays HTML elements is foundational to understanding what these frameworks ultimately produce and how they update the page efficiently.

#### Component Thinking in Plain HTML

Even without a framework, developers can think in terms of ''components'' — reusable, self-contained pieces of UI, like a navigation bar, a card, or a button group — by combining consistent class naming conventions (such as BEM, Block Element Modifier, e.g., class=''card card__title'') with data-* attributes as JavaScript hooks rather than relying on IDs or fragile selectors. This mindset is the conceptual bridge between plain HTML/CSS/JS and the component-based architecture used throughout modern frameworks.

#### Where HTML Goes From Here

With a solid grasp of HTML structure, semantics, accessibility, forms, media, and how it connects to styling and behavior, the natural next steps are CSS (to control visual presentation) and JavaScript (to add interactivity and dynamic behavior) — both of which operate on the very HTML structures covered throughout this curriculum.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the primary purpose of a data-* attribute, such as data-user-id?', 'MCQ', 'data-* attributes let developers attach custom data to elements in a standards-compliant way, readable via JavaScript''s dataset property or CSS attribute selectors.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'To apply default browser styling to an element', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'To store custom data directly on an HTML element, accessible via JavaScript or CSS selectors, without affecting native behavior', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'To replace the need for the class attribute', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'To validate form input automatically', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is content inside a <template> element not rendered when the page initially loads?', 'MCQ', '<template> content is intentionally inert until JavaScript clones and inserts it into the active document, allowing reusable markup to be defined once.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because the browser considers it broken HTML', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Because template content is inert by design until explicitly activated and inserted into the document, typically via JavaScript', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because it requires a special file extension', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Because templates can only contain text, not HTML elements', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the conceptual purpose of the <slot> element within Web Components?', 'MCQ', '<slot> allows a custom component to maintain a fixed internal structure while still accepting flexible content provided by whoever uses the component.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It hides content from screen readers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It defines a placeholder where external, user-provided content can be inserted into a custom component''s fixed structure', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It validates a form before submission', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the need for the head element', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: Frameworks like React and Vue eliminate the need to understand HTML, since they generate markup automatically.', 'TRUE_FALSE', 'Frameworks generate HTML dynamically, but understanding HTML structure, semantics, and accessibility remains foundational to using these frameworks effectively.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the main advantage of using data-* attributes as JavaScript hooks instead of relying on IDs for scripting purposes?', 'MCQ', 'Using data-* attributes as dedicated scripting hooks separates concerns, reducing fragile dependencies where an ID serves multiple, potentially conflicting purposes.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'data-* attributes are faster to type', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It creates a cleaner separation, avoiding fragile reliance on IDs that may also be used for CSS styling or anchor links', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'IDs are deprecated in HTML5', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'data-* attributes automatically generate JavaScript functions', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Scenario: A developer wants to define a reusable ''product card'' layout once and dynamically generate ten instances of it with different content via JavaScript, without repeating the HTML markup ten times in the source file. Which element is most suited to this task?', 'MCQ', '<template> is designed precisely for this use case: defining reusable, inert markup once that can be cloned and inserted multiple times dynamically.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<dialog>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<template>', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<details>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<iframe>', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which naming convention is mentioned as an example of consistent class naming for component-based thinking in plain HTML?', 'MCQ', 'BEM (Block Element Modifier) is presented as an example naming convention that supports component-based thinking in plain HTML and CSS.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'CamelCase Attribute Naming (CAN)', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'BEM (Block Element Modifier)', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'ARIA Convention Standard (ACS)', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Semantic Tag Replacement (STR)', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'HTML' AND l.level_number = 20 AND q.order_index = 7;

