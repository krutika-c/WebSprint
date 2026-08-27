
-- ============ Level 1: JavaScript Exists ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is JavaScript?

JavaScript is a programming language that runs in the browser. While HTML structures content and CSS styles it, JavaScript makes pages interactive — it responds to user actions, updates the page without reloading, fetches data from servers, and much more. Every modern browser (Chrome, Firefox, Safari, Edge) has a built-in JavaScript engine that reads and executes your JS code. JavaScript is the only programming language that runs natively in browsers, which is why it became the dominant language of the web.

JavaScript is not Java. They share a similar name due to a 1990s marketing decision, but they are completely different languages with different syntax, different use cases, and no shared codebase.

#### Adding JavaScript to a Page — the script tag

You add JavaScript to an HTML page using the <script> tag. You can write JavaScript directly inside it (inline) or link to an external .js file using the src attribute.

For real projects, you almost always use external files. This keeps HTML and JavaScript separate, makes code reusable, and allows the browser to cache the file.

#### console.log

console.log() is your most essential debugging tool. It prints values to the browser''s developer console — the Console tab in DevTools (open with F12 or right-click → Inspect → Console). It does not show anything on the visible page.

You will use console.log constantly to check what your code is doing, verify variable values, and trace errors. Every professional developer has the console open while writing JavaScript.

#### Script Placement — defer vs async

Where you place your <script> tag and which attributes you use controls when the browser loads and runs your JavaScript. This matters because JavaScript that runs before the HTML is fully parsed can fail to find elements it is looking for.

Without any attribute: the browser stops parsing HTML, downloads the script, executes it, then continues. This blocks rendering and is the slowest approach.

defer: the script downloads in the background while HTML parses. It only executes after the HTML is fully parsed, in order. This is the recommended approach for most scripts.

async: the script downloads in the background and executes as soon as it downloads, interrupting HTML parsing. Use only for scripts that are completely independent (like analytics).'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the role of JavaScript on a webpage?', 'MCQ', 'JavaScript adds behavior and interactivity. HTML structures, CSS styles, JavaScript acts.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It defines the structure and content of the page', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It styles the page with fonts, colors, and layout', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It makes the page interactive and responds to user actions', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It tells the browser which HTML version to use', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which tag is used to add JavaScript to an HTML page?', 'MCQ', 'The <script> tag embeds or links JavaScript in an HTML document.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '<js>', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '<code>', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '<javascript>', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '<script>', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does console.log() do?', 'MCQ', 'console.log() outputs values to the Console tab in DevTools — not to the visible page.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Displays a popup alert on the page', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Prints a value to the browser''s developer console', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Writes text directly onto the visible webpage', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Sends data to a server', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the defer attribute do on a <script> tag?', 'MCQ', 'defer allows HTML to parse without interruption and runs the script after parsing is complete, in document order.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Makes the script run before HTML starts parsing', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Blocks HTML parsing until the script is downloaded', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Downloads the script in the background and runs it after HTML is fully parsed', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Prevents the script from running at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between defer and async?', 'MCQ', 'defer is ordered and waits for HTML parsing. async is unordered and interrupts parsing when ready. Use defer for most scripts.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'defer runs scripts in order after parsing, async runs scripts as soon as downloaded regardless of order or parsing state', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'async runs scripts after parsing, defer runs them immediately', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They are identical — just different names', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'defer is for inline scripts, async is for external files', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: JavaScript and Java are the same language.', 'TRUE_FALSE', 'JavaScript and Java are unrelated languages. The similar name was a 1990s marketing decision.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True — they share the same syntax and runtime', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False — they are completely different languages that happen to have similar names', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A developer links an analytics script that must not depend on the page content and should run as soon as possible. Which attribute is best?', 'MCQ', 'async is appropriate for independent scripts like analytics that do not need to interact with the DOM and should run as soon as downloaded.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'defer', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'async', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'No attribute needed', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'src', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Where should you look to see the output of console.log()?', 'MCQ', 'console.log() output appears in the Console panel of browser DevTools, opened with F12.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'In the HTML page itself', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'In an alert popup box', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'In the Console tab of the browser''s developer tools (DevTools)', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'In the source code of the HTML file', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 1 AND q.order_index = 8;

-- ============ Level 2: Variables and Values ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is a Variable?

A variable is a named container for storing a value. In JavaScript, you create variables using the keywords var, let, or const. Once a variable is declared, you can use its name anywhere in your code to refer to the value it holds.

#### var, let, and const

JavaScript has three variable keywords, each with different behaviour:

var — the original keyword. It has function scope (not block scope), and is hoisted to the top of its function. This causes surprising bugs. Avoid var in modern code.

let — introduced in ES6 (2015). Block-scoped, not hoisted in a usable way. Use for values that will change.

const — also block-scoped. Must be assigned a value immediately and cannot be reassigned. Use for values that should not change. Note: for objects and arrays declared with const, the contents can still be changed — only the binding is locked.

#### Data Types

JavaScript has several built-in data types. The most important ones for beginners:

String — text, wrapped in single quotes, double quotes, or backticks.

Number — any numeric value, integers and decimals alike.

Boolean — true or false only.

null — intentionally empty. A developer sets a value to null to say ''this has no value on purpose''.

undefined — a variable declared but not yet assigned any value.

#### typeof

The typeof operator returns a string describing the type of a value. It is useful for debugging.

The typeof null returning ''object'' is a well-known historical bug in JavaScript that was never fixed because fixing it would break existing websites. Always remember this quirk.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which keyword should you use for a value that will never be reassigned?', 'MCQ', 'const declares a variable whose binding cannot be reassigned. Use it for values that should remain constant.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'var', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'let', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'const', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fixed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between let and var?', 'MCQ', 'let is block-scoped which prevents variables leaking outside their intended block. var''s function scope and hoisting cause unexpected bugs.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'let allows reassignment, var does not', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'let is block-scoped, var is function-scoped and prone to hoisting bugs', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'var is newer and preferred in modern code', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are identical in behaviour', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does typeof null return in JavaScript?', 'MCQ', 'typeof null returns ''object'' due to a historical bug in JavaScript that has never been fixed for backwards compatibility.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '''null''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '''undefined''', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '''object''', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '''empty''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A variable is declared but never assigned a value. What is its type?', 'MCQ', 'A declared but unassigned variable has the value and type undefined.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'null', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'empty', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'string', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'undefined', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between null and undefined?', 'MCQ', 'null is deliberately assigned to signal ''no value''. undefined means a variable exists but has not been given a value yet.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They are identical — both mean empty', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'null is an intentional empty value set by the developer, undefined means the variable was never assigned', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined is set by developers, null is set by the browser', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'null is a number type, undefined is a string type', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You declare: const name = ''Riya''. Then you write: name = ''Priya''. What happens?', 'MCQ', 'const prevents reassignment of the variable binding. Attempting it throws a TypeError at runtime.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'name is updated to ''Priya''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'JavaScript throws a TypeError because const variables cannot be reassigned', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The second line is ignored silently', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'name becomes undefined', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of the following is NOT a primitive data type in JavaScript?', 'MCQ', 'Arrays are objects in JavaScript, not primitives. The primitive types are string, number, boolean, null, undefined, symbol, and bigint.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'string', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'boolean', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'array', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'number', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does typeof ''hello'' return?', 'MCQ', 'typeof returns ''string'' for any string value — single-quoted, double-quoted, or template literal.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '''text''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '''string''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '''word''', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '''char''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 2 AND q.order_index = 8;

-- ============ Level 3: Operators and Expressions ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Arithmetic Operators

JavaScript supports standard math operations: + (addition), - (subtraction), * (multiplication), / (division), % (modulo — remainder), and ** (exponentiation).

The modulo operator (%) is extremely useful — you''ll use it to check if a number is even (n % 2 === 0), cycle through values, and more.

#### Comparison Operators — == vs ===

Comparison operators return true or false. The most important distinction in JavaScript is between == (loose equality) and === (strict equality).

== (double equals) — compares values after type coercion. JavaScript converts one type to match the other before comparing. This causes surprises.

=== (triple equals) — compares both value AND type. No coercion. This is almost always what you want.

Use === by default. Only use == when you specifically want type coercion, which is rare.

#### Logical Operators

Logical operators combine or invert boolean expressions:

#### Type Coercion

JavaScript automatically converts values from one type to another in certain situations. This is called type coercion and is one of the most confusing aspects of the language.

The + operator triggers string concatenation when either operand is a string. All other math operators trigger numeric conversion. Understanding this prevents a huge class of bugs.

#### The Ternary Operator

The ternary operator is a one-line if/else. Syntax: condition ? value_if_true : value_if_false.

Use the ternary for simple assignments. For complex logic, use if/else for readability.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does 10 % 3 evaluate to?', 'MCQ', 'The modulo operator returns the remainder. 10 divided by 3 is 3 with a remainder of 1.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '3', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '1', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '0', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '3.33', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the result of 1 + ''2'' + 3 in JavaScript?', 'MCQ', '1 + ''2'' triggers string coercion, producing ''12''. Then ''12'' + 3 produces ''123''. The + operator concatenates when either operand is a string.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '6', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '''123''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '''33''', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'TypeError', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why should you use === instead of == by default?', 'MCQ', '=== avoids type coercion surprises. 5 == ''5'' is true (unexpected), but 5 === ''5'' is correctly false.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '=== is faster at runtime', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '=== compares both value and type with no coercion, avoiding unexpected truthy results', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '== only works for numbers', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '=== is newer and == is deprecated', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does 5 === ''5'' return?', 'MCQ', '=== checks type too. 5 is a number, ''5'' is a string — different types, so false.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'true', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'false', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It throws an error', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the expression true && false evaluate to?', 'MCQ', 'The && operator returns true only if both operands are true. Since false is on the right, the result is false.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'true', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'false', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'null', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'undefined', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does ''hello'' - 1 return?', 'MCQ', 'The - operator tries to convert both sides to numbers. ''hello'' cannot be converted, so the result is NaN (Not a Number).', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '''hell''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '''hello1''', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'NaN — Not a Number, because ''hello'' cannot be converted to a number', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '0', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does this ternary expression return: 10 > 5 ? ''yes'' : ''no''?', 'MCQ', '10 > 5 is true, so the ternary returns the first value: ''yes''.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '''no''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'true', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '''yes''', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '10', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does !false evaluate to?', 'MCQ', 'The ! (NOT) operator inverts a boolean. !false is true.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'false', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'null', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '0', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'true', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does ''hello'' == true return?', 'MCQ', 'When comparing with ==, true coerces to 1, ''hello'' coerces to NaN. NaN equals nothing, so the result is false.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'true', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'false', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '''true''', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 3 AND q.order_index = 9;

-- ============ Level 4: Control Flow ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### if / else / else if

Conditional statements let your code make decisions. The if statement runs a block only if the condition is true. else runs if the condition is false. else if allows multiple conditions.

Conditions are evaluated top to bottom. Once a true condition is found, that block runs and the rest are skipped.

#### switch

The switch statement is cleaner than many else-if chains when you are checking a single variable against many specific values.

The break statement exits the switch after a matching case. Without break, execution falls through to the next case — this is usually a bug, but occasionally intentional.

#### for loop

The for loop repeats a block a specific number of times. It has three parts: initializer, condition, and update.

#### while loop

The while loop runs as long as its condition is true. Use when you do not know in advance how many iterations are needed.

#### do...while loop

The do...while loop runs the block first, then checks the condition. This guarantees the block runs at least once even if the condition is immediately false.

#### break and continue

break exits the loop entirely. continue skips the current iteration and moves to the next one.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What happens when no condition is true in an if/else if chain and there is no else block?', 'MCQ', 'If no condition matches and there is no else, JavaScript simply skips the entire if/else if chain and continues with the next line of code.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'JavaScript throws an error', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The first condition runs by default', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Nothing runs — execution continues after the if block', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'undefined is returned', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of break in a switch statement?', 'MCQ', 'Without break, execution ''falls through'' to subsequent cases. break exits the switch after the matched case completes.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It ends the entire JavaScript file', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It exits the switch block after a matching case runs, preventing fall-through', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It skips the current case and tries the next', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is required for the switch to function at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the default case in a switch statement do?', 'MCQ', 'default is the fallback case that runs when no other case value matches the switch expression.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It runs first before any case is checked', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It runs if no other case matches, similar to an else block', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is required — switch will error without it', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It cancels all other cases', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How many times does this loop run: for (let i = 1; i <= 4; i++)?', 'MCQ', 'Starting at i=1, the loop runs while i <= 4, so i takes values 1, 2, 3, 4 — four iterations total.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '3', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '4', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '5', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It runs infinitely', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between a while loop and a do...while loop?', 'MCQ', 'do...while executes the block first, then evaluates the condition. This guarantees at least one execution even if the condition is false from the start.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'while loops are faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'do...while runs the block at least once before checking the condition, while checks first', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'do...while is deprecated in modern JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'while requires a counter variable, do...while does not', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does continue do inside a loop?', 'MCQ', 'continue skips the remaining code in the current iteration and jumps to the next loop cycle.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Exits the loop entirely', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Restarts the loop from the beginning', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Skips the rest of the current iteration and moves to the next one', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Pauses the loop for one tick', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A loop runs forever and the browser freezes. What is the most likely cause?', 'MCQ', 'An infinite loop occurs when the condition is always true, often because the counter variable is never updated. The browser''s main thread freezes because JavaScript is single-threaded.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The loop has too many iterations', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The loop condition never becomes false — an infinite loop', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The JavaScript file is too large', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The browser does not support that type of loop', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does this output: for (let i = 0; i < 3; i++) { console.log(i); }?', 'MCQ', 'i starts at 0 and runs while i < 3, so it logs 0, 1, and 2. When i becomes 3, the condition is false and the loop stops.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '1, 2, 3', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '0, 1, 2, 3', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '0, 1, 2', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '0, 1', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 4 AND q.order_index = 8;

-- ============ Level 5: Functions ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is a Function?

A function is a reusable block of code that performs a specific task. Instead of writing the same code multiple times, you define it once in a function and call it whenever needed. Functions are the building blocks of every JavaScript program.

#### Function Declaration

A function declaration defines a named function using the function keyword. It is hoisted — meaning JavaScript moves it to the top of its scope, so you can call it before it appears in the code.

#### Function Expression

A function expression assigns a function to a variable. It is not hoisted, so you can only call it after the line where it is defined.

#### Arrow Functions

Arrow functions are a shorter syntax introduced in ES6. They are most commonly used for short functions, callbacks, and array methods.

If the arrow function body has only one expression, you can omit the curly braces and the return keyword — the expression is returned automatically. As soon as you add curly braces, you must write return explicitly.

#### Parameters and Return Values

Parameters are the named inputs a function accepts. Arguments are the actual values passed when calling it. The return statement sends a value back from the function to the caller. A function without a return statement returns undefined.

#### Default Parameters

Default parameters give a parameter a fallback value if no argument is provided when the function is called.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between a function declaration and a function expression?', 'MCQ', 'Function declarations are hoisted to the top of their scope. Function expressions are not, so calling them before their definition throws a ReferenceError.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Function declarations return values, expressions do not', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Function declarations are hoisted and can be called before their definition, expressions are not', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Function expressions are faster at runtime', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'There is no difference — they behave identically', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does a function return if it has no return statement?', 'MCQ', 'A function with no return statement, or an empty return, implicitly returns undefined.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '0', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'null', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'false', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'undefined', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the short arrow function const double = n => n * 2 equivalent to?', 'MCQ', 'When an arrow function has no curly braces, the expression is implicitly returned. It is equivalent to a function that explicitly returns n * 2.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'const double = function(n) { n * 2 }', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'const double = function(n) { return n * 2; }', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'const double = (n) => { n * 2 }', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'function double(n) { n * 2 }', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'An arrow function has curly braces: const fn = (x) => { x * 2 }. What does fn(5) return?', 'MCQ', 'When curly braces are present in an arrow function, return must be written explicitly. Without it, the function returns undefined.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '10', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '25', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined — no explicit return inside curly braces', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'TypeError', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a default parameter?', 'MCQ', 'Default parameters provide a fallback value used when the caller does not pass an argument for that parameter.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A parameter that is always required', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A parameter that uses a fallback value when no argument is passed for it', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The first parameter of a function', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A parameter that resets to 0 after each call', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You call a function with 2 arguments but it only accepts 1 parameter. What happens?', 'MCQ', 'JavaScript does not enforce the number of arguments. Extra arguments are simply ignored. Missing arguments become undefined.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'JavaScript throws a TypeError', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The second argument is ignored — JavaScript does not enforce argument count', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Both arguments are merged into an array', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The function only uses the second argument', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'True or False: You can call a function declaration before it appears in the code.', 'TRUE_FALSE', 'Function declarations are hoisted to the top of their scope, so they can be called before their definition in the source code.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'True — function declarations are hoisted', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'False — all functions must be defined before use', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What are the ''parameters'' of a function?', 'MCQ', 'Parameters are the named placeholders in the function definition. Arguments are the actual values passed when the function is called.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The values passed when calling the function', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The named variables listed in the function definition that receive incoming values', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The return values of the function', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The variables declared inside the function body', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 5 AND q.order_index = 8;

-- ============ Level 6: Arrays ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is an Array?

An array is an ordered list of values stored in a single variable. Arrays can hold any mix of data types — numbers, strings, booleans, objects, even other arrays. They are one of the most used data structures in JavaScript.

#### Accessing Elements

Array elements are accessed by their index — a zero-based number starting at 0. The first element is at index 0, the second at 1, and so on.

#### length

The length property returns the number of elements in the array. Since arrays are zero-indexed, the last element is always at index array.length - 1.

#### Adding and Removing Elements

The four most common methods for adding/removing elements:

push() — adds one or more elements to the END. Returns new length.

pop() — removes the LAST element. Returns the removed element.

unshift() — adds one or more elements to the BEGINNING. Returns new length.

shift() — removes the FIRST element. Returns the removed element.

#### splice and slice

splice() — adds or removes elements at a specific index. It mutates (modifies) the original array.

slice() — returns a new array from a start index to (not including) an end index. It does NOT mutate the original.

#### Iterating Arrays

Use for...of to loop cleanly through every element in an array:'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Arrays in JavaScript are zero-indexed. What does this mean?', 'MCQ', 'Zero-indexing means the first element is accessed with index 0, not 1. This is fundamental and causes off-by-one errors for many beginners.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The first element has no index', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The first element is at index 0, the second at index 1, and so on', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Arrays start counting from 0 but display from 1', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Empty arrays have a length of zero', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does push() do and what does it return?', 'MCQ', 'push() adds elements to the end of the array and returns the new length of the array. It mutates the original.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Removes the last element and returns it', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Adds one or more elements to the end of the array and returns the new length', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Adds an element to the beginning and returns the element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Creates a new array with the added element', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between splice() and slice()?', 'MCQ', 'splice() modifies the original array in place. slice() creates and returns a new array, leaving the original unchanged.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'slice() mutates the original, splice() does not', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'splice() mutates the original array, slice() returns a new array without changing the original', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They do exactly the same thing', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'splice() only works with numbers, slice() works with any type', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Given arr = [10, 20, 30, 40], what does arr[arr.length - 1] return?', 'MCQ', 'arr.length is 4. arr.length - 1 is 3. arr[3] is 40 — the last element.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '10', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'undefined', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '3', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '40', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You call arr.pop() on [1, 2, 3]. What are the return value and new array state?', 'MCQ', 'pop() removes and returns the last element. 3 is returned and the array becomes [1, 2].', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Returns 1, array becomes [2, 3]', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Returns 3, array becomes [1, 2]', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Returns [1, 2], array becomes [3]', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Returns undefined, array is unchanged', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does arr.slice(1, 3) return for arr = [''a'', ''b'', ''c'', ''d'', ''e'']?', 'MCQ', 'slice(1, 3) returns elements from index 1 up to but NOT including index 3: ''b'' and ''c''.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '[''a'', ''b'', ''c'']', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '[''b'', ''c'']', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '[''b'', ''c'', ''d'']', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '[''c'', ''d'', ''e'']', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the result of accessing an index that does not exist in an array?', 'MCQ', 'JavaScript returns undefined for any index that is out of bounds. No error is thrown.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'An error is thrown', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'null is returned', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined is returned', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The last element is returned', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You want to add ''Cherry'' to the BEGINNING of a fruits array. Which method do you use?', 'MCQ', 'unshift() adds elements to the beginning of the array. push() adds to the end.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'fruits.push(''Cherry'')', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'fruits.unshift(''Cherry'')', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'fruits.add(''Cherry'', 0)', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fruits.prepend(''Cherry'')', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 6 AND q.order_index = 8;

-- ============ Level 7: Objects ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is an Object?

An object is a collection of key-value pairs. While an array stores ordered items accessed by index, an object stores named properties accessed by key. Objects are used to represent real-world entities with multiple attributes.

#### Accessing Properties

You access object properties using dot notation or bracket notation:

Dot notation is preferred for static, known keys. Bracket notation is necessary when the key is stored in a variable or contains spaces or special characters.

#### Adding and Deleting Properties

You can add new properties or update existing ones at any time:

The delete operator removes a property from an object:

#### Nested Objects

Object properties can themselves be objects, creating nested structures. Access nested properties by chaining dot or bracket notation:

#### Methods — Functions Inside Objects

When a function is stored as a property of an object, it is called a method.

#### Iterating with for...in

The for...in loop iterates over all enumerable property keys of an object:'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between an array and an object in JavaScript?', 'MCQ', 'Arrays use numeric indexes and maintain order. Objects use named string keys with no guaranteed order.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Arrays can hold more values than objects', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Arrays are ordered lists accessed by numeric index, objects are collections of named key-value pairs', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Objects can only hold strings, arrays can hold any type', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are identical — arrays are just a type of object', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'When must you use bracket notation instead of dot notation to access a property?', 'MCQ', 'Dot notation requires valid identifier names. Bracket notation handles dynamic keys, keys with spaces, and keys that start with numbers.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Always — dot notation is deprecated', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'When the property name contains spaces, starts with a number, or is stored in a variable', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only when the value is a string', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'When the object is nested inside another object', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does delete user.name do?', 'MCQ', 'The delete operator removes the property from the object. Accessing it afterward returns undefined because the property no longer exists.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Sets user.name to null', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Sets user.name to undefined', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Removes the name property from the user object entirely', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Throws an error if name does not exist', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is an object method?', 'MCQ', 'When a function is assigned as a value to an object property, it is called a method of that object.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A special type of property that only holds numbers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A built-in JavaScript function for objects', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A function stored as a property of an object', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A way to add properties to an object', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How do you access city in: let person = { address: { city: ''Delhi'' } }?', 'MCQ', 'Nested object properties are accessed by chaining dot notation: person.address gives the address object, then .city accesses its city property.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'person.address[city]', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'person[address][city]', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'person.address.city', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'person.city', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does for...in iterate over?', 'MCQ', 'for...in iterates over the property keys of an object. To get values, use obj[key] inside the loop.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The values of an object', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The keys (property names) of an object', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Both keys and values simultaneously', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only numeric properties of an object', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You access a property that does not exist on an object: user.phone. What is returned?', 'MCQ', 'Accessing a non-existent property returns undefined. No error is thrown — this is different from how strongly-typed languages behave.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'null', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'An error is thrown', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'false', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'An object has a property whose key is stored in a variable: let prop = ''name''. How do you access that property on object obj?', 'MCQ', 'When the key is in a variable, you must use bracket notation with the variable name: obj[prop]. obj.prop would look for a literal property named ''prop''.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'obj.prop', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'obj.name', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'obj[prop]', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'obj[''prop'']', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 7 AND q.order_index = 8;

-- ============ Level 8: Scope and Closures ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is Scope?

Scope determines where in your code a variable is accessible. If a variable is ''in scope'', your code can read or write it. If it is ''out of scope'', trying to use it throws a ReferenceError.

#### Global Scope

Variables declared outside any function or block are in global scope. They are accessible everywhere in the file. While convenient, global variables can cause bugs in large codebases because any part of the code can accidentally modify them.

#### Function Scope

Variables declared inside a function are only accessible inside that function. var is function-scoped — it is visible anywhere within the function it is declared in, but not outside.

#### Block Scope

let and const are block-scoped — they only exist within the {} curly braces where they are declared. This includes if blocks, for loops, and any other block.

#### Hoisting

JavaScript moves variable and function declarations to the top of their scope before code runs. This is called hoisting.

Function declarations are fully hoisted — you can call them before their definition. var declarations are hoisted but their value is not — they are undefined until the assignment line runs. let and const are hoisted but are in a ''temporal dead zone'' — accessing them before their declaration throws a ReferenceError.

#### Closures

A closure is a function that remembers and accesses variables from its outer (enclosing) scope, even after the outer function has finished executing. This is one of JavaScript''s most powerful and distinctive features.

The inner function closes over count — it keeps a reference to it even though makeCounter() has returned. Each call to counter() increments the same count variable. This is a closure.

Closures are used for data privacy (variables only accessible through the returned function), factory functions, callbacks, and event handlers throughout JavaScript.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What happens when you try to access a let variable before its declaration in the code?', 'MCQ', 'let and const are hoisted but cannot be accessed before their declaration. This period before declaration is called the temporal dead zone.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It returns undefined', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It returns null', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It throws a ReferenceError because let is in the temporal dead zone', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It works fine — let is hoisted', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A var variable declared inside an if block — is it accessible outside the if block?', 'MCQ', 'var is function-scoped, not block-scoped. A var inside an if block is accessible anywhere within the enclosing function, regardless of whether the if ran.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'No — all variables are block-scoped in JavaScript', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Yes — var is function-scoped, not block-scoped, so it leaks out of blocks', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only if the if condition was true', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only if it was declared with a value', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a closure?', 'MCQ', 'A closure occurs when an inner function captures and remembers the variables of its enclosing scope, even after the outer function has finished executing.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A way to close or end a function', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A function that cannot be called more than once', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A function that retains access to variables from its outer scope even after the outer function has returned', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A function declared inside a class', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In the counter closure example, why does count keep its value between calls?', 'MCQ', 'The inner function closes over count. As long as the inner function exists, count is kept in memory. Each call to counter() reads and updates the same count.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'count is a global variable', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The inner function holds a reference to the count variable in the enclosing scope, keeping it alive', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'JavaScript automatically saves variable values between function calls', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'makeCounter() runs again each time counter() is called', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the ''temporal dead zone''?', 'MCQ', 'The temporal dead zone is the period from the start of a block scope until the let or const declaration is reached. Accessing the variable in this zone throws a ReferenceError.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The time between page load and script execution', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The period between the start of a block and the declaration of a let or const variable, during which the variable cannot be accessed', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A zone in memory where deleted variables are stored', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A deprecated JavaScript concept', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the output of: function f() { console.log(x); var x = 5; }  f();', 'MCQ', 'var x is hoisted to the top of the function, but the assignment x = 5 stays in place. So when console.log runs, x exists but is still undefined.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '5', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'ReferenceError', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined — var is hoisted but its value is not', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'null', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which type of variable leaks outside if/for blocks?', 'MCQ', 'var is function-scoped and ignores block boundaries. let and const are block-scoped and do not leak outside their block.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'let', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'const', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'var', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'All three leak', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What practical problem do closures solve?', 'MCQ', 'Closures enable data encapsulation — you can create private state that persists between calls but cannot be accessed or modified from outside the closure.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They make functions run faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They allow private state — variables encapsulated inside a function, accessible only through the returned inner function', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They eliminate the need for global variables entirely', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They allow functions to run asynchronously', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A function called outer() returns an inner function that uses outer''s variable x. After outer() finishes, inner() is called. Can it still access x?', 'MCQ', 'The inner function creates a closure that keeps x alive in memory as long as the inner function exists. Calling inner() after outer() returns still has full access to x.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'No — x is destroyed when outer() finishes', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Yes — the inner function forms a closure over x, keeping it alive', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only if x is declared with var', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only if inner() is called within 1 second', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 8 AND q.order_index = 9;

-- ============ Level 9: The DOM ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is the DOM?

When a browser loads HTML, it builds a tree-like structure in memory called the Document Object Model (DOM). Every HTML tag becomes a node in this tree. JavaScript can read this tree, change it, add nodes, remove nodes — and every change is immediately reflected on the visible page.

The DOM is the bridge between HTML and JavaScript. Without the DOM, JavaScript would have no way to interact with the content on screen.

#### Selecting Elements

Before you can change an element, you must select it. JavaScript provides several methods:

getElementById() — selects a single element by its id attribute. Returns null if not found.

querySelector() — selects the FIRST element matching a CSS selector. Returns null if not found.

querySelectorAll() — selects ALL elements matching a CSS selector. Returns a NodeList (similar to an array).

#### Reading and Changing Content

Once selected, you can read or update an element''s content:

textContent — gets or sets the text inside an element. Treats everything as plain text (safe from XSS).

innerHTML — gets or sets the HTML inside an element. More powerful but can be a security risk if used with user-provided content.

#### Changing Styles

You can change CSS styles directly from JavaScript using the style property:

For multiple style changes, it is better to toggle a CSS class using classList:

#### Creating and Inserting Elements

You can create new HTML elements and add them to the page:

#### DOM Traversal

You can navigate the DOM tree from any element:'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the DOM?', 'MCQ', 'The Document Object Model is the live, in-memory representation of the HTML structure. JS uses it to interact with and modify page content.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A CSS framework for layout', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The browser''s in-memory tree representation of an HTML document that JavaScript can read and modify', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A JavaScript library for animations', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The file system of a website', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between querySelector() and querySelectorAll()?', 'MCQ', 'querySelector() returns the first match (or null). querySelectorAll() returns a NodeList containing all matching elements.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'querySelector() is faster, querySelectorAll() is more accurate', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'querySelector() returns the first matching element, querySelectorAll() returns a NodeList of all matches', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'querySelectorAll() only works with class selectors', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are identical', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does element.textContent = ''Hello'' do?', 'MCQ', 'textContent sets the text inside the element as plain text. Any existing content is replaced, and HTML tags in the string are treated as literal characters.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Adds ''Hello'' as an HTML tag inside the element', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Sets the element''s visible text to ''Hello'', treating it as plain text', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Appends ''Hello'' after the element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Changes the element''s CSS text property', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is innerHTML potentially dangerous when used with user-provided content?', 'MCQ', 'innerHTML interprets HTML, which means malicious users could inject <script> tags or event handlers, leading to Cross-Site Scripting (XSS) attacks. Use textContent for user data.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It only works with div elements', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It is slower than textContent', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It parses HTML, so user-provided script tags or event attributes can execute malicious code (XSS)', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the entire document', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does classList.toggle(''active'') do?', 'MCQ', 'toggle() is a convenient method that switches the class on or off based on its current state.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Always adds the ''active'' class', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Always removes the ''active'' class', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Adds ''active'' if it is absent, removes it if it is present', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Checks if ''active'' is present and returns true or false', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You select all elements with class ''card'' using querySelectorAll. You then try to use forEach on the result. Does this work?', 'MCQ', 'Modern browsers support forEach on NodeList. For older compatibility, you can spread it into an array: [...document.querySelectorAll(''.card'')].forEach(...)', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'No — NodeList does not support forEach', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Yes — modern NodeLists support forEach', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only in Internet Explorer', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only if you convert it to an array first', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does appendChild() do?', 'MCQ', 'appendChild() inserts a node as the last child of the specified parent element.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Creates a new element', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Removes a child element', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Adds an element as the last child of a parent element', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Copies an element and inserts it', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How do you change the font color of a selected element to blue using JavaScript?', 'MCQ', 'Inline styles are set through the element''s style property. CSS property names are camelCase in JavaScript — e.g., fontSize for font-size.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'element.color = ''blue''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'element.style.color = ''blue''', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'element.css(''color'', ''blue'')', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'element.setAttribute(''color'', ''blue'')', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does element.parentElement return?', 'MCQ', 'parentElement returns the direct parent of the element — one level up in the DOM tree.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The element itself', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'All parent elements up to the root', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The immediate parent element of the selected element', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The first child element', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 9 AND q.order_index = 9;

-- ============ Level 10: Events ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What are Events?

An event is something that happens in the browser — a user clicks a button, types in a field, moves the mouse, submits a form, the page finishes loading, and so on. JavaScript lets you ''listen'' for these events and run code when they occur. This is the core mechanism of interactivity.

#### addEventListener

The addEventListener() method attaches a function (called an event handler or listener) to an element. When the specified event occurs, the function runs.

Or with an arrow function:

#### Common Event Types

JavaScript supports dozens of event types. The most important ones:

Mouse events: click (single click), dblclick (double click), mouseenter (mouse enters element), mouseleave (mouse leaves element).

Keyboard events: keydown (fires when key is pressed), keyup (fires when key is released), keypress (deprecated — avoid).

Form events: submit (form submitted), input (value changes), change (value changes and field loses focus), focus, blur.

Window events: load (page fully loaded), DOMContentLoaded (HTML parsed, scripts deferred), resize, scroll.

#### The Event Object

When an event fires, JavaScript automatically passes an event object to your handler function. This object contains details about the event.

#### preventDefault

Some events have default browser behaviors. Clicking a form submit button submits the form. Clicking a link navigates away. preventDefault() stops the default behavior without stopping the event.

#### Event Bubbling

When an event fires on an element, it bubbles up through all its ancestors in the DOM tree. A click on a button inside a div inside a section will trigger click handlers on the button, then the div, then the section, all the way to the document.

stopPropagation() prevents the event from bubbling further up the DOM tree:

#### Event Delegation

Instead of adding listeners to every child element, you can add one listener to the parent and check which child was clicked using event.target. This is more efficient for dynamic lists.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does addEventListener() do?', 'MCQ', 'addEventListener() registers a callback function that JavaScript calls automatically whenever the specified event fires on the target element.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Triggers an event manually', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Attaches a function that runs when a specified event occurs on an element', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Removes an existing event from an element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Creates a new HTML element with an event built in', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does event.target refer to inside an event handler?', 'MCQ', 'event.target is the actual element that was clicked or interacted with. It may be a child of the element the listener is attached to.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The element the event listener was attached to', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The element that actually triggered the event', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The parent of the clicked element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The window object', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'A form submit event''s default behavior is to send the form and reload the page. How do you prevent this?', 'MCQ', 'event.preventDefault() cancels the default browser action for the event while still allowing the event handler to run.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'event.stop()', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'event.cancel()', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'event.preventDefault()', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'return false inside the handler', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is event bubbling?', 'MCQ', 'Bubbling means the event travels upward from the target element through parent, grandparent, and all ancestors up to the document.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'An event that repeats itself multiple times', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'An event that fires on an element and then propagates up through its ancestor elements', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'An event fired on the window before any element', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Multiple events firing simultaneously', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does stopPropagation() do?', 'MCQ', 'stopPropagation() halts event bubbling — ancestor handlers for the same event type will not run after it is called.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Prevents the default browser behavior', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Stops the event from bubbling up to parent elements', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Removes the event listener', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Prevents the event from firing at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between the ''input'' and ''change'' events on a text field?', 'MCQ', 'input fires immediately on every character typed. change fires when the user finishes and moves away from the field (blur), only if the value changed.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They are identical', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'input fires on every keystroke as the value changes, change fires when the field loses focus after a value change', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'change fires on every keystroke, input fires on blur', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'input is for checkboxes, change is for text fields', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is event delegation and why is it useful?', 'MCQ', 'Event delegation exploits bubbling — a click on any child bubbles to the parent, where one handler checks event.target to determine which child was clicked.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Delegating event handling to a third-party library', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Adding one event listener to a parent element to handle events from all its children — more efficient than adding listeners to each child', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Running an event handler on a delay', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Firing an event from JavaScript code manually', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which event fires when HTML parsing is complete and deferred scripts have run, but before images and stylesheets finish loading?', 'MCQ', 'DOMContentLoaded fires when the HTML is parsed and the DOM is ready. The load event fires later, after all resources including images and CSS are fully loaded.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'load', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'ready', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'DOMContentLoaded', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'domready', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'You click a button inside a div. Both have click listeners. In what order do the handlers fire?', 'MCQ', 'Events fire on the target element first, then bubble upward. So the button''s handler fires before the div''s handler.', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The div''s handler fires first, then the button''s', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Both fire simultaneously', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only the button''s handler fires', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The button''s handler fires first, then the div''s — events bubble up', true, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 10 AND q.order_index = 9;

-- ============ Level 11: Array Methods Deep Dive ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### map()

map() creates a NEW array by transforming every element with a callback function. It does not modify the original array. Use it whenever you need to produce a new array of the same length with each value changed.

#### filter()

filter() creates a NEW array containing only the elements for which the callback returns true. Use it to select a subset of items.

#### reduce()

reduce() collapses an array down to a single value — a sum, an object, another array, anything. It takes a callback with an accumulator and the current value, plus an optional initial value for the accumulator.

The accumulator starts at the initial value (0 here), and after each element it becomes the return value of the callback. reduce() is the most flexible array method — map and filter can both be implemented using it.

#### forEach()

forEach() runs a callback once for every element but always returns undefined — it does not build a new array. Use it purely for side effects like logging, not for transformation.

#### find() and findIndex()

find() returns the FIRST element that satisfies the callback, or undefined if none match. findIndex() does the same but returns the index instead, or -1 if none match.

#### some() and every()

some() returns true if AT LEAST ONE element satisfies the callback. every() returns true only if ALL elements satisfy it.

#### sort()

sort() sorts an array IN PLACE (it mutates the original). By default it sorts elements as strings, which produces wrong results for numbers unless you provide a comparator function.

#### Chaining Methods

Array methods that return arrays (map, filter) can be chained together for concise, readable data pipelines:'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between map() and forEach()?', 'MCQ', 'map() builds and returns a new array from the callback''s return values. forEach() simply runs the callback for each element and returns undefined — it''s not meant for building new data.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They are identical in every way', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'map() returns a new transformed array, forEach() always returns undefined and is used for side effects', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'forEach() is faster than map() in all cases', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'map() mutates the original array, forEach() does not', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does [1,2,3,4].filter(n => n > 2) return?', 'MCQ', 'filter() keeps only elements for which the callback returns true. 3 and 4 are greater than 2, so they are kept.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '[1, 2]', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '[3, 4]', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'true', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '4', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does [1,2,3].reduce((acc, cur) => acc + cur, 10) return?', 'MCQ', 'The accumulator starts at 10 (the initial value), then adds 1, 2, and 3 in turn: 10+1=11, 11+2=13, 13+3=16.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '6', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '16', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '10', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '[10, 1, 2, 3]', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why does [10, 1, 21, 2].sort() produce [1, 10, 2, 21] instead of numeric order?', 'MCQ', 'Without a comparator, sort() treats every element as a string. ''10'' comes before ''2'' alphabetically because ''1'' < ''2''. Pass (a, b) => a - b for correct numeric sorting.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'sort() is broken in JavaScript', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'By default sort() converts elements to strings and compares them lexicographically, unless given a comparator function', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'sort() only works on arrays of strings', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The array needs to be reversed first', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does find() return if no element matches the condition?', 'MCQ', 'find() returns undefined when no element satisfies the callback. findIndex() returns -1 in the same situation.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'null', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '-1', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'An empty array', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between some() and every()?', 'MCQ', 'some() returns true if ANY element satisfies the condition. every() returns true only if ALL elements satisfy it.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'some() checks if at least one element passes the test, every() checks if all elements pass', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'every() checks if at least one element passes, some() checks if all do', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They are aliases for the same method', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'some() works on strings, every() works on arrays', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Does sort() mutate the original array or return a new one?', 'MCQ', 'Unlike map() and filter(), sort() mutates the original array directly and also returns a reference to that same sorted array.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It returns a new array, leaving the original unchanged', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It mutates (sorts) the original array in place', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It creates a copy only if a comparator is provided', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It throws an error if called on a mutable array', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In [1,2,3,4,5,6].filter(n => n % 2 === 0).map(n => n * 10), what is the final result?', 'MCQ', 'filter first keeps the even numbers [2, 4, 6], then map multiplies each by 10, producing [20, 40, 60].', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '[10, 20, 30, 40, 50, 60]', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '[20, 40, 60]', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '[2, 4, 6]', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '60', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 8;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which array method could be used to implement both map() and filter() from scratch, because it is the most general?', 'MCQ', 'reduce() is the most flexible array method — since it can build up any kind of result (arrays, objects, numbers), both map() and filter() can be implemented in terms of reduce().', 9
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'forEach()', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'sort()', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'reduce()', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 9;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'find()', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 11 AND q.order_index = 9;

-- ============ Level 12: Strings and Numbers ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Template Literals

Template literals use backticks (`) instead of quotes, and allow embedded expressions using ${}. They also support multi-line strings without special characters.

Template literals are the preferred way to build strings that include variables — far cleaner than string concatenation with +.

#### Common String Methods

slice() and substring() extract a portion of a string. toUpperCase() and toLowerCase() change case. trim() removes whitespace from both ends. includes() checks if a substring is present. split() breaks a string into an array.

#### replace() and replaceAll()

replace() replaces the FIRST match of a substring or pattern. replaceAll() replaces EVERY match. Both return a new string — the original is never mutated, because strings are immutable in JavaScript.

#### String Immutability

Strings in JavaScript can never be changed in place. Every string method that appears to ''modify'' a string actually returns a brand new string, leaving the original untouched.

#### Numbers — parsing and precision

parseInt() converts a string to a whole number. parseFloat() converts to a decimal number. Number() converts more strictly, returning NaN for non-numeric strings.

A famous JavaScript quirk: because numbers are stored in floating-point format, some decimal arithmetic is imprecise.

For money or precise decimals, round the result or use integer-based math (e.g. store cents instead of dollars).

#### Math Object

The built-in Math object provides common numeric operations:'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the main advantage of template literals over string concatenation with +?', 'MCQ', 'Template literals (backticks) let you embed variables and expressions inline with ${} syntax and write multi-line strings without special characters, making code far more readable than + concatenation.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They run faster in all browsers', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They allow embedding expressions directly with ${} and support multi-line strings cleanly', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They automatically convert numbers to strings, which + cannot do', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are required for all string operations in modern JS', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does ''hello''[0] = ''H'' do, given strings are immutable?', 'MCQ', 'Strings are immutable in JavaScript. Attempting to assign to an index has no effect (in non-strict mode) — the original string is unchanged.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Changes the string to ''Hello''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Throws a TypeError', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Silently does nothing — the string remains unchanged', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Creates a new variable', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between replace() and replaceAll()?', 'MCQ', 'replace() stops after replacing the first occurrence of the match. replaceAll() replaces every occurrence in the string.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'replace() replaces only the first match, replaceAll() replaces every match', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'replaceAll() is deprecated in favor of replace()', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'replace() works on arrays, replaceAll() works on strings', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They behave identically', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does parseInt(''42px'') return?', 'MCQ', 'parseInt() reads digits from the start of the string until it hits a non-digit character, then stops and returns what it parsed so far — 42.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'NaN', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '''42px''', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '42', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '0', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why does 0.1 + 0.2 not exactly equal 0.3 in JavaScript?', 'MCQ', 'Floating-point arithmetic (used by nearly all programming languages) cannot represent every decimal fraction exactly in binary, leading to tiny rounding errors like 0.30000000000000004.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It is a bug that will be fixed in a future version', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Numbers are stored in floating-point format, which cannot represent some decimals exactly, causing small precision errors', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'JavaScript does not support decimal numbers', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Addition does not work correctly on numbers under 1', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does Math.floor(4.9) return?', 'MCQ', 'Math.floor() always rounds down to the nearest whole number, regardless of the decimal portion.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '5', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '4', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '4.9', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '0', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does Number(''42px'') return, compared to parseInt(''42px'')?', 'MCQ', 'Number() is strict — if any part of the string is non-numeric, it returns NaN. parseInt() parses leading digits and stops at the first non-digit character.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Both return 42', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Number() returns NaN because it requires the entire string to be numeric, while parseInt() returns 42 by parsing what it can', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Number() returns 42, parseInt() returns NaN', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Both return NaN', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What range of values does Math.random() produce?', 'MCQ', 'Math.random() returns a floating-point number that is always greater than or equal to 0, and always strictly less than 1.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '0 to 1, inclusive of both', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '1 to 10', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A random number between 0 (inclusive) and 1 (exclusive)', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '-1 to 1', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 12 AND q.order_index = 8;

-- ============ Level 13: Error Handling ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Why Handle Errors?

Things go wrong — a network request fails, a user enters bad data, a variable is undefined when you expected an object. Without error handling, one unexpected error crashes your entire script. Proper error handling lets your program respond gracefully instead of breaking.

#### try / catch / finally

The try block contains code that might throw an error. If it does, execution jumps immediately to the catch block, which receives the error object. The finally block, if present, always runs — whether an error occurred or not.

finally is commonly used for cleanup — closing a connection, hiding a loading spinner, or resetting state — that must happen regardless of success or failure.

#### The Error Object

When an error occurs, JavaScript creates an Error object with useful properties: message (a human-readable description) and name (the error type, e.g. ''TypeError'', ''ReferenceError'', ''SyntaxError'').

#### throw — Creating Your Own Errors

You can deliberately trigger an error using throw. This is useful for validating input and stopping execution when something is invalid.

#### Custom Error Classes

For larger applications, you can create custom error types by extending the built-in Error class. This lets you distinguish between different kinds of failures using instanceof.

#### Common Built-in Error Types

TypeError — occurs when a value is not of the expected type (e.g. calling a non-function, or reading a property of null). ReferenceError — occurs when referencing a variable that does not exist. SyntaxError — occurs when code is not valid JavaScript, usually caught before the code even runs.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of the finally block?', 'MCQ', 'finally executes unconditionally after try/catch completes, making it ideal for cleanup code that must run either way.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It only runs if an error occurs', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It only runs if no error occurs', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It always runs, regardless of whether an error occurred in the try block', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the need for a catch block', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the catch block receive as its parameter?', 'MCQ', 'catch receives the thrown Error (or other thrown value) as its parameter, giving access to properties like message and name.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The line number where the error occurred', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The Error object describing what went wrong', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A boolean indicating success or failure', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Nothing — catch takes no parameters', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the throw statement do?', 'MCQ', 'throw creates and raises an error (or any value) manually, halting the current execution flow until it''s caught by a surrounding try/catch.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Logs an error to the console without stopping execution', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Deliberately raises an error, immediately stopping normal execution and jumping to the nearest catch block', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Restarts the current function', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only works inside a catch block', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the benefit of creating a custom error class like ValidationError?', 'MCQ', 'Custom error classes let calling code check the specific type of error with instanceof and respond differently depending on what went wrong.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It makes the code run faster', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It lets you distinguish between different kinds of errors using instanceof, enabling more specific handling', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is required for try/catch to work at all', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It automatically fixes the error', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What type of error occurs when you try to call a variable that is not a function?', 'MCQ', 'TypeError occurs when an operation is performed on a value of an unexpected type — such as calling something that isn''t a function.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'SyntaxError', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'ReferenceError', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'TypeError', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'RangeError', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'If code inside a try block throws an error but there is no catch block, what happens?', 'MCQ', 'Without a catch, the error continues propagating up the call stack. If nothing catches it anywhere, it becomes an unhandled exception.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The error is silently ignored', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The error propagates up and, if unhandled, crashes the script (or is caught further up the call stack)', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'JavaScript automatically retries the code', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The finally block prevents the crash', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does error.message typically contain?', 'MCQ', 'error.message is a descriptive string explaining the error, useful for logging or displaying to developers.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The exact line number of the error', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A human-readable description of what went wrong', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The stack trace only', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The name of the file where the error occurred', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which error type occurs when referencing a variable that was never declared?', 'MCQ', 'ReferenceError is thrown when code tries to access a variable or function that does not exist in any accessible scope.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'TypeError', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'ReferenceError', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'SyntaxError', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'UndefinedError', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 13 AND q.order_index = 8;

-- ============ Level 14: Asynchronous JavaScript ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### JavaScript is Single-Threaded

JavaScript runs on a single thread — it can only do one thing at a time. If a task takes a long time (like a network request), synchronous code would freeze the entire page while waiting. Asynchronous JavaScript solves this by letting slow tasks run in the background while the rest of the code keeps executing.

#### The Call Stack

The call stack tracks which function is currently running. Function calls are pushed onto the stack and popped off when they return. Because JavaScript is single-threaded, only one function runs at a time — the one on top of the stack.

#### setTimeout and the Event Loop

setTimeout() schedules a function to run after a minimum delay, without blocking the rest of the code. It does not pause the program — the code after setTimeout keeps running immediately.

The event loop is the mechanism that makes this possible. JavaScript maintains a call stack, a queue of pending callbacks (the task queue), and the event loop constantly checks: is the call stack empty? If so, take the next callback from the queue and run it. This is why setTimeout callbacks only run after all synchronous code has finished.

#### Callbacks

A callback is a function passed into another function, to be called later — often when an asynchronous operation finishes. Before Promises existed, callbacks were the primary way to handle async code.

#### Callback Hell

When multiple asynchronous operations depend on each other, nesting callbacks inside callbacks creates deeply indented, hard-to-read code known as ''callback hell'' or the ''pyramid of doom''.

This nesting problem is exactly what Promises (covered next) were designed to solve, by flattening chains of asynchronous operations into readable, linear code.

#### Microtasks vs Macrotasks

Not all queued callbacks are treated equally. Promise callbacks (microtasks) run before setTimeout callbacks (macrotasks), even if the setTimeout delay is 0. The event loop always empties the microtask queue completely before picking the next macrotask.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why does JavaScript need asynchronous mechanisms at all?', 'MCQ', 'Since JavaScript can only execute one thing at a time on its single thread, async mechanisms let slow operations happen in the background without blocking the rest of the program.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Because JavaScript files are too large to run synchronously', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Because JavaScript is single-threaded, and blocking on slow tasks like network requests would freeze the entire page', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Because browsers do not support synchronous code', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'To make code run faster in every case', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the output order of: console.log(''A''); setTimeout(() => console.log(''B''), 0); console.log(''C'');?', 'MCQ', 'Even with a 0ms delay, setTimeout''s callback is queued and only runs after all synchronous code finishes. So A and C log immediately, then B logs after.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A, B, C', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'B, A, C', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A, C, B', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'C, B, A', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the event loop responsible for?', 'MCQ', 'The event loop is the coordination mechanism between the call stack and the task queues, enabling non-blocking asynchronous behavior in a single-threaded language.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Compiling JavaScript into machine code', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Continuously checking if the call stack is empty, and if so, moving the next queued callback onto the stack to run', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Rendering the visual page layout', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Managing memory allocation for variables', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is a callback function?', 'MCQ', 'A callback is any function handed to another function so it can be called later, often once an asynchronous task like a timer or network request completes.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A function that calls itself recursively', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A function passed as an argument to another function, to be invoked later', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A function that always returns a Promise', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The first function defined in a file', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is ''callback hell''?', 'MCQ', 'Callback hell describes the pyramid-shaped, deeply indented code that results from chaining multiple dependent asynchronous callbacks, which becomes difficult to follow.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A syntax error caused by too many callbacks', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Deeply nested callbacks inside callbacks, making code hard to read and maintain', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A performance issue caused by slow callbacks', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The technical term for the event loop', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Between a Promise''s .then() callback (microtask) and a setTimeout callback (macrotask) scheduled at the same time, which runs first?', 'MCQ', 'The event loop always fully drains the microtask queue (Promises) before moving on to process the next macrotask (setTimeout), regardless of delay value.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The setTimeout callback always runs first', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The Promise''s .then() callback runs first, because microtasks are processed before the next macrotask', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They run in the order they appear in the code, with no distinction', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is random and unpredictable', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the call stack track?', 'MCQ', 'The call stack keeps track of function calls in progress — each call is pushed on entry and popped when it returns, showing the current execution path.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'All variables declared in the program', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The currently executing function and the chain of functions that called it', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'All pending network requests', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The order in which CSS rules are applied', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why were Promises introduced as an alternative to plain callbacks?', 'MCQ', 'Promises were designed specifically to solve callback hell by allowing async operations to be chained with .then() in a flat, readable sequence instead of nested indentation.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Promises run faster than callbacks', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Promises flatten chains of dependent async operations into more readable, linear code, avoiding deep nesting', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Callbacks were removed from the JavaScript language', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Promises do not require the event loop', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 14 AND q.order_index = 8;

-- ============ Level 15: Promises and Fetch ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is a Promise?

A Promise is an object representing the eventual result of an asynchronous operation. It exists in one of three states: pending (still working), fulfilled (succeeded, has a value), or rejected (failed, has a reason). Promises give asynchronous code a standard, chainable shape.

#### then, catch, finally

You consume a Promise''s result using .then() (runs on success), .catch() (runs on failure), and .finally() (always runs).

#### Chaining Promises

Because .then() itself returns a new Promise, you can chain multiple asynchronous steps in a flat, readable sequence instead of nesting callbacks.

A single .catch() at the end catches an error from ANY step in the chain — you do not need error handling at every level.

#### Promise.all and Promise.race

Promise.all() takes an array of Promises and resolves when ALL of them resolve, returning an array of results in the same order. If ANY promise rejects, the whole thing rejects immediately.

Promise.race() resolves or rejects as soon as the FIRST promise in the array settles, ignoring the rest.

#### The Fetch API

fetch() is the modern browser API for making HTTP requests. It returns a Promise that resolves to a Response object once the headers arrive — you then call .json() (also returning a Promise) to parse the body.

Important: fetch() only rejects on network failure. A 404 or 500 response is still a ''successful'' fetch — you must check response.ok or response.status manually.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What are the three possible states of a Promise?', 'MCQ', 'A Promise starts as pending, and settles into either fulfilled (success, with a value) or rejected (failure, with a reason).', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'true, false, null', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'started, running, finished', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'pending, fulfilled, rejected', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'loading, success, error', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is a single .catch() at the end of a Promise chain useful?', 'MCQ', 'An error anywhere in a Promise chain skips ahead to the nearest .catch(), so placing one catch at the end handles failures from any preceding step.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It only catches errors from the last .then() in the chain', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It catches an error from any step in the chain, avoiding repetitive error handling at every level', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is required syntax and has no functional purpose', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It prevents the chain from running at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does Promise.all() do if one of the promises in the array rejects?', 'MCQ', 'Promise.all() is all-or-nothing — if any single promise rejects, the combined promise rejects immediately with that reason, even if others are still pending.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It ignores the rejected promise and returns results from the others', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It waits for all promises regardless, then reports which one failed', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The entire Promise.all() immediately rejects with that error', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It retries the failed promise automatically', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between Promise.all() and Promise.race()?', 'MCQ', 'Promise.all() resolves only once every promise has resolved (or rejects on the first rejection). Promise.race() settles based on whichever promise finishes first, ignoring the rest.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Promise.all() waits for every promise to settle, Promise.race() settles as soon as the first one does', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Promise.race() is faster at runtime', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Promise.all() only works with two promises', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are functionally identical', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Does fetch() reject its Promise when the server responds with a 404 status?', 'MCQ', 'fetch()''s promise resolves as long as a response was received, regardless of status code. You must explicitly check response.ok or response.status to detect HTTP errors like 404.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes — any non-200 status causes a rejection', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No — fetch() only rejects on network failure; a 404 is still treated as a ''successful'' response you must check manually via response.ok', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only for 500-level errors', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fetch() cannot detect status codes at all', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does response.json() return when handling a fetch response?', 'MCQ', 'response.json() reads and parses the response body as JSON, but this itself is asynchronous, so it returns a Promise that must be awaited or chained with .then().', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The raw response body as text', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A Promise that resolves to the parsed JSON data', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'The HTTP status code', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'A synchronous JavaScript object', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does .finally() on a Promise chain guarantee?', 'MCQ', 'Like try/finally, .finally() on a Promise always executes after the chain settles, making it ideal for cleanup tasks like hiding a loading spinner.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It only runs if the promise is rejected', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It only runs if the promise is fulfilled', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It runs regardless of whether the promise was fulfilled or rejected', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It cancels the promise chain', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In new Promise((resolve, reject) => {...}), what do resolve and reject do?', 'MCQ', 'Calling resolve(value) fulfills the promise with that value; calling reject(reason) rejects it. Whichever is called first determines the promise''s final state.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They are optional and have no functional effect', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'resolve() transitions the promise to fulfilled with a value, reject() transitions it to rejected with a reason', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They both do the same thing — settle the promise successfully', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'resolve() cancels the promise, reject() completes it', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 15 AND q.order_index = 8;

-- ============ Level 16: Async / Await ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### What is async/await?

async/await is syntax sugar built on top of Promises. It lets you write asynchronous code that looks and reads like synchronous code, without chains of .then(). Under the hood, it is still Promises — async/await just changes how you write and read them.

#### The async keyword

Adding async before a function declaration makes that function always return a Promise, even if you just return a plain value inside it.

#### The await keyword

await can only be used inside an async function. It pauses execution of that function until the Promise on its right settles, then unwraps the resolved value directly — no .then() needed.

Important: await only pauses the async function itself, not the entire program. Other code outside the function continues to run normally while it waits.

#### Error Handling with try/catch

Since await unwraps Promise values directly, you handle rejected Promises with ordinary try/catch — the same mechanism used for synchronous errors.

#### Sequential vs Parallel Awaits

Awaiting one call after another runs them SEQUENTIALLY — each waits for the previous to finish, even if they are unrelated. This wastes time when the calls don''t depend on each other.

To run independent async calls in PARALLEL, start them all first (without awaiting immediately), then await Promise.all():

#### async/await vs raw Promises

async/await and .then() chains are functionally equivalent — async/await simply compiles down to Promises under the hood. Use async/await for most code because it reads top-to-bottom like normal code, especially when steps depend on each other''s results.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does adding async to a function do to its return value?', 'MCQ', 'async functions automatically wrap their return value in a Promise. Returning ''Hello'' from an async function actually returns a Promise that resolves to ''Hello''.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It has no effect on the return value', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'The function always returns a Promise, even if a plain value is returned inside it', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It forces the function to return undefined', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It converts the return value to a string', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Where can the await keyword be used?', 'MCQ', 'await is only valid inside functions declared with async (with a narrow exception for top-level await in ES modules). Using it elsewhere is a syntax error.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Anywhere in any JavaScript file', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Only inside an async function (or at the top level of a module)', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only inside a .then() callback', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Only inside a for loop', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'When an async function hits an await, what is paused?', 'MCQ', 'await pauses execution only within the async function it''s in. Other code outside that function keeps running on the single thread while the awaited Promise settles.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'The entire browser, including all other JavaScript', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Only that async function — the rest of the program continues running normally', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Nothing is paused; execution continues immediately regardless', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The call stack is cleared entirely', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How do you handle a rejected Promise when using await?', 'MCQ', 'When an awaited Promise rejects, it throws inside the async function, which can be caught with a standard try/catch block, just like a synchronous error.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'await cannot handle rejections — you must use .catch() separately', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Wrap the await call in a try/catch block', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Rejections are silently ignored with await', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Use a finally block instead of catch', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is wrong with this code for independent requests: const a = await fetchA(); const b = await fetchB();?', 'MCQ', 'Each await blocks until that specific Promise resolves before moving to the next line, so unrelated requests run one after another instead of concurrently — slower than necessary.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Nothing — this is the fastest way to run them', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It runs the requests sequentially, wasting time waiting for fetchA to finish before starting fetchB, even though they don''t depend on each other', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It will throw a syntax error', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'fetchB will run before fetchA', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How do you run two independent async operations in parallel and wait for both?', 'MCQ', 'Promise.all() starts all the given promises immediately and resolves once all have completed, letting independent operations run concurrently rather than one after another.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'await fetchA(); await fetchB();', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'const [a, b] = await Promise.all([fetchA(), fetchB()]);', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is impossible to run async operations in parallel in JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'await fetchA() && await fetchB();', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Is async/await a completely different mechanism from Promises, or built on top of them?', 'MCQ', 'async/await compiles to the same underlying Promise mechanics as .then() chains; it''s simply an alternative, more readable syntax for working with Promises.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It''s a completely separate mechanism with no relation to Promises', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It is syntax sugar built on top of Promises — functionally equivalent to .then() chains', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It replaces Promises entirely, and Promises are now deprecated', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It only works with the Fetch API, not general Promises', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the main readability advantage of async/await over chained .then() calls?', 'MCQ', 'async/await avoids the visual nesting and callback-style structure of chained .then() calls, making multi-step dependent async logic easier to read and reason about.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'async/await runs faster than .then() chains', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'async/await lets asynchronous code read top-to-bottom like ordinary synchronous code, especially useful when steps depend on each other', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '.then() chains cannot handle errors at all', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'async/await eliminates the need for the event loop', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 16 AND q.order_index = 8;

-- ============ Level 17: Modern JavaScript — ES6+ ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Destructuring

Destructuring lets you unpack values from arrays or properties from objects into distinct variables in one concise statement.

#### Spread and Rest Operators

The spread operator (...) expands an array or object into individual elements. It is commonly used to copy or merge arrays/objects without mutating the originals.

The rest operator uses the same ... syntax but in the opposite direction — it collects multiple remaining values into a single array, typically in function parameters.

#### Optional Chaining (?.)

Optional chaining safely accesses deeply nested properties without throwing an error if an intermediate property is null or undefined. If any link in the chain is missing, the whole expression short-circuits to undefined instead of crashing.

#### Nullish Coalescing (??)

The ?? operator returns the right-hand value only if the left-hand value is null or undefined — unlike ||, which also treats 0, '''', and false as ''missing''.

#### Template Literals and Tagged Templates

Beyond basic interpolation (covered in Level 12), template literals support tagged templates — a function that processes the literal''s pieces before producing the final string. This is used in libraries for safe HTML/SQL escaping and CSS-in-JS.

#### let/const, Arrow Functions, and Classes

Many ES6+ features covered earlier — let/const, arrow functions, default parameters, template literals — work together to make modern JavaScript far more concise and predictable than the pre-2015 language. ES6 (2015) was the biggest single update in JavaScript''s history, and nearly all modern code is written in this style.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does const { name, age } = user do?', 'MCQ', 'Object destructuring pulls named properties out of an object and assigns them to variables of the same name in a single concise statement.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Creates a new object called user', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Extracts the name and age properties from user into standalone variables', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Deletes the name and age properties from user', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Checks if user has name and age properties', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does [...arr1, 4, 5] do if arr1 = [1, 2, 3]?', 'MCQ', 'The spread operator expands arr1''s elements individually into the new array literal, producing a new, separate array without mutating the original.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Modifies arr1 to add 4 and 5', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Creates a new array [1, 2, 3, 4, 5], leaving arr1 unchanged', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Throws a syntax error', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Creates a nested array [[1,2,3], 4, 5]', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between the spread operator and the rest operator, given they use the same ... syntax?', 'MCQ', 'Spread ''unpacks'' an iterable into individual elements. Rest does the opposite — it gathers multiple individual arguments or elements into one array.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'There is no difference — they are the same operator with two names', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Spread expands values out (e.g. into an array literal or function call), rest collects multiple values into a single array (e.g. in function parameters)', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Rest is used only in objects, spread only in arrays', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Spread is deprecated in favor of rest', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does user.address?.city return if user.address is null?', 'MCQ', 'Optional chaining stops evaluating and returns undefined as soon as it hits a null or undefined value in the chain, avoiding a TypeError.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Throws a TypeError', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'undefined — the expression short-circuits safely', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'null', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'An empty string', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Given let count = 0, what does count || 10 return, and why is this often a bug?', 'MCQ', '|| falls back to the right-hand side for ANY falsy left value, including 0, '''', and false — which is often wrong when 0 is a legitimate value you want to keep.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '0 — because 0 is truthy', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '10 — because 0 is falsy, so || treats it as ''missing'' even though 0 is a valid value', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'undefined', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'This throws an error', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How does ?? (nullish coalescing) differ from || in the case of count = 0?', 'MCQ', '?? specifically checks for null/undefined, not general falsiness, so valid falsy values like 0 or '''' are preserved instead of being replaced.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They behave identically in every case', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '?? only falls back if the left side is null or undefined, so count ?? 10 correctly returns 0', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '?? always returns the right-hand side', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '?? is only usable with strings', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does function sum(...numbers) { ... } allow you to do?', 'MCQ', 'The rest parameter syntax gathers all arguments passed to the function into one array, letting the function accept a variable number of inputs.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Accept exactly three arguments only', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Accept any number of arguments, collected into a single array called numbers', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Spread an existing array into individual arguments', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Force all arguments to be numbers', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does const { name: userName, city = ''Unknown'' } = { name: ''Riya'' } produce?', 'MCQ', 'Destructuring can rename a property (name becomes userName) and, in the same statement, supply a default value used when the source property is missing (city).', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'userName is ''Riya'', city is undefined', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'userName is ''Riya'', city is ''Unknown'' — using the default since city was missing', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A syntax error, since renaming and defaults cannot be combined', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'name is ''Riya'', userName is undefined', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 17 AND q.order_index = 8;

-- ============ Level 18: OOP and Prototypes ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Objects and Prototypes

Every JavaScript object has an internal link to another object called its prototype, forming what''s known as the prototype chain. When you access a property that doesn''t exist directly on an object, JavaScript automatically looks it up on the prototype, then the prototype''s prototype, and so on.

#### Constructor Functions

Before ES6 classes, objects with shared behavior were created using constructor functions combined with the new keyword and the prototype object.

#### class Syntax

ES6 classes are syntax sugar over the same prototype system — they don''t introduce a new inheritance model, just a cleaner syntax for it.

#### Inheritance with extends and super

A class can inherit from another using extends. super() calls the parent class''s constructor, and must be called before using this inside a subclass constructor.

#### this — the Trickiest Part

The value of this depends on HOW a function is called, not where it''s defined. Regular functions get this based on their calling context, which can be lost when passed as a callback. Arrow functions do not have their own this — they inherit it from the surrounding (lexical) scope, which is why they''re often preferred for callbacks inside methods.

#### Getters, Setters, and Static Methods

Getters and setters let you define computed properties that look like normal property access. static methods belong to the class itself, not to instances.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the prototype chain?', 'MCQ', 'When a property lookup fails on an object, JavaScript automatically checks that object''s prototype, then its prototype, continuing up the chain until found or reaching null.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A sequence of function calls in the call stack', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A linked series of objects that JavaScript searches through when a property isn''t found directly on an object', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A list of all classes defined in a program', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The order in which CSS classes are applied', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Do ES6 classes introduce a fundamentally new inheritance model in JavaScript?', 'MCQ', 'Under the hood, class syntax still uses prototypes — it''s a cleaner, more familiar syntax for the same mechanism constructor functions used before ES6.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes — classes are entirely separate from the prototype system', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No — classes are syntax sugar over the same existing prototype-based inheritance', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Classes replace prototypes entirely as of ES6', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Classes only work for built-in objects, not custom ones', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does the super() call do inside a subclass constructor?', 'MCQ', 'super() invokes the parent (superclass) constructor to properly initialize inherited properties. JavaScript requires this to happen before ''this'' can be used in the subclass.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Creates a new instance of the subclass', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Calls the parent class''s constructor, and must be called before using ''this'' in the subclass constructor', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Deletes the parent class', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Is optional and has no real effect', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What determines the value of this in a regular (non-arrow) function?', 'MCQ', 'Unlike lexically scoped variables, ''this'' in a regular function is dynamic — determined by how the function is invoked (as a method, standalone, with call/apply, etc), not where it''s written.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Where the function is physically defined in the file', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'How the function is called — its calling context', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'this is always the global window object', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'this is always undefined in JavaScript', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why are arrow functions often preferred inside class methods for callbacks like setInterval?', 'MCQ', 'A regular function passed to setInterval would get a different ''this'' when called later. Arrow functions capture ''this'' lexically from where they''re defined, correctly keeping the class instance.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Arrow functions run faster than regular functions', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Arrow functions don''t have their own ''this'' — they inherit it from the surrounding scope, avoiding the common bug of losing the class instance context', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Arrow functions are required inside all classes', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Arrow functions automatically become static methods', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of a getter defined with the get keyword in a class?', 'MCQ', 'Getters let you compute a value on access using normal property syntax (c.area) instead of a method call (c.area()), keeping the API clean.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It lets you access a computed value as if it were a plain property, without calling it as a function', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It makes the property write-only', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is required for every class property', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the constructor', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'How do you call a static method defined on a class?', 'MCQ', 'Static methods belong to the class itself, not to any particular instance, so they''re invoked directly on the class name.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'On an instance of the class, e.g. instance.methodName()', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Directly on the class itself, e.g. ClassName.methodName()', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Static methods cannot be called directly — only from inside the constructor', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Using the new keyword: new ClassName.methodName()', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'In class Student extends Person, what does Student inherit?', 'MCQ', 'extends sets up prototype-based inheritance, so instances of Student can use methods and properties defined on Person, while also being able to override them (like the overridden greet() method).', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Nothing — extends only affects the constructor', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Student instances get access to Person''s properties and methods through the prototype chain, and can override or extend them', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Only static methods are inherited, not instance methods', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Student and Person become the same class', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 18 AND q.order_index = 8;

-- ============ Level 19: Modules and Tooling ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### Why Modules?

As applications grow, keeping all code in one file becomes unmanageable. Modules let you split code into separate files, each with its own scope, and explicitly control what is shared between them using export and import. This avoids polluting the global scope and makes dependencies clear.

#### ES Modules — export and import

A named export shares specific values from a file. A default export marks one main value as the file''s primary export. You can mix both in a single file.

To use ES modules in the browser, the script tag needs type=''module'', which also automatically applies defer-like loading behavior.

#### CommonJS (Node.js)

Node.js traditionally used a different module system called CommonJS, with require() and module.exports. Modern Node.js also supports ES modules, but CommonJS remains extremely common in existing codebases.

#### npm and package.json

npm (Node Package Manager) is the standard tool for installing and managing JavaScript libraries. package.json describes a project: its dependencies, scripts, and metadata.

node_modules is the folder where installed packages live — it is never committed to version control (it''s listed in .gitignore) because it can be regenerated from package.json.

#### Bundlers and Transpilers

Bundlers (like Vite, Webpack, or esbuild) combine many separate module files into fewer optimized files for production, and can bundle CSS, images, and other assets alongside JavaScript. Transpilers (like Babel) convert modern JavaScript syntax into an older, more widely-supported version so it runs on older browsers.

A typical modern frontend workflow: write code using ES modules and the newest JS syntax → a bundler resolves all imports and combines them → a transpiler ensures compatibility with target browsers → the final optimized files are deployed.

#### Linters and Formatters

ESLint analyzes code for potential bugs, unused variables, and style issues before it ever runs. Prettier automatically formats code to a consistent style. Using both together is standard practice on professional teams to keep large codebases consistent and catch mistakes early.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the main problem that JavaScript modules solve?', 'MCQ', 'Before modules, all script files shared one global scope, risking naming collisions. Modules give each file its own scope and require explicit export/import to share anything.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They make code run faster in the browser', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They let code be split across files with explicit, controlled sharing of values, avoiding global scope pollution', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They eliminate the need for functions', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are required for any JavaScript file to run', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between a named export and a default export?', 'MCQ', 'A module can export multiple named values (imported with curly braces matching the exact name) but designates at most one default export (imported under any chosen name without braces).', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A file can have many named exports but only one default export', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'A file can have only one named export and many default exports', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They are identical — ''default'' is just a naming convention', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Named exports can only export functions, default exports can only export values', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What attribute must a <script> tag have to use ES module import/export syntax in the browser?', 'MCQ', 'Browsers only recognize import/export syntax inside scripts explicitly marked as ES modules with type=''module'', which also changes loading behavior to be deferred by default.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'type=''javascript''', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'async=''true''', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'type=''module''', true, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'No special attribute is needed', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is CommonJS, and where is it primarily used?', 'MCQ', 'CommonJS predates widespread ES module support and is still common in existing Node.js code, using require() to import and module.exports to export, rather than import/export keywords.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'A CSS framework used in Node.js projects', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Node.js''s traditional module system, using require() and module.exports, distinct from ES modules', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'A testing framework for JavaScript', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'The same thing as ES modules, just an older name', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of package.json?', 'MCQ', 'package.json is the manifest file npm reads to know what packages a project depends on, what scripts can be run, and general project information like name and version.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It stores the compiled output of a JavaScript project', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It describes a project''s dependencies, scripts, and metadata for npm to use', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It is a required file for every individual JavaScript file', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It replaces the need for a bundler', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why is node_modules typically excluded from version control (e.g. via .gitignore)?', 'MCQ', 'Since node_modules is fully reproducible from the dependencies listed in package.json, teams exclude it from version control to keep repositories smaller and avoid platform-specific build artifacts.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It contains sensitive information that must never be shared', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It can be entirely regenerated by running npm install based on package.json, so committing it is unnecessary and bloats the repository', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Git cannot track folders with that name', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'node_modules is automatically deleted on every commit', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the role of a bundler like Vite or Webpack?', 'MCQ', 'Bundlers resolve the web of import/export statements across a project and package everything into a smaller number of production-ready files, often optimizing and minifying along the way.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It runs automated tests on the codebase', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It combines many separate module files (and often other assets) into fewer optimized files for production', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It replaces the need for a web server', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It converts JavaScript into a different programming language', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does a transpiler like Babel do?', 'MCQ', 'Transpilers rewrite newer JS syntax into equivalent code that older JavaScript engines can understand, extending compatibility to browsers that don''t support the latest features natively.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'It compiles JavaScript into machine code', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'It converts modern JavaScript syntax into an older, more widely-supported version so it works on older browsers', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'It formats code according to a style guide', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It bundles CSS files together', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 19 AND q.order_index = 8;

-- ============ Level 20: JavaScript Meets the Real World ============
INSERT INTO lessons (level_id, content_markdown)
SELECT l.id, '#### JavaScript Beyond the Browser

JavaScript is no longer confined to browsers. Node.js runs JavaScript on servers, powering backend APIs, command-line tools, and even desktop apps (via frameworks like Electron). The same language you use to build a webpage''s interactivity can also build the server that page talks to.

#### Building a Simple API with Node.js

Using Node''s built-in http module, or more commonly a framework like Express, you can respond to web requests with JavaScript code running on a server rather than in a browser.

#### Local Storage — Persisting Data in the Browser

localStorage lets you store key-value string data in the browser that persists even after the page is closed and reopened. sessionStorage behaves similarly but clears when the browser tab closes.

Both storage APIs only store strings — objects and arrays must be serialized with JSON.stringify() before storing and parsed back with JSON.parse() when read.

#### JSON — The Universal Data Format

JSON (JavaScript Object Notation) is the standard format for exchanging data between a browser and a server. Despite the name, it''s used across virtually every programming language, not just JavaScript. It looks like a JavaScript object literal but with stricter rules — keys must be double-quoted strings, and it cannot contain functions.

#### Testing JavaScript Code

Automated tests verify that code behaves as expected and catch regressions before they reach users. Testing frameworks like Vitest or Jest let you write assertions that run automatically.

Unit tests check individual functions in isolation. Integration tests check that multiple pieces work correctly together. A well-tested codebase gives developers confidence to change code without accidentally breaking existing features.

#### Where to Go From Here

With the fundamentals, DOM manipulation, asynchronous patterns, and modern syntax covered across these 20 levels, the natural next steps are: build small real projects (a to-do app, a weather dashboard using a public API), learn a frontend framework (React, Vue, or Svelte) that builds on everything covered here, and get comfortable with browser DevTools, Git version control, and reading official documentation — the core habits of a professional JavaScript developer.'
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does Node.js allow JavaScript to do that it couldn''t do originally?', 'MCQ', 'Node.js provides a JavaScript runtime independent of any browser, enabling JavaScript to power backend servers, CLI tools, and more — not just interactive webpages.', 1
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Run animations more smoothly', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Run outside the browser — on servers, in command-line tools, and in desktop apps', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Access the DOM faster', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 1;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Compile into a different language', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 1;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the key difference between localStorage and sessionStorage?', 'MCQ', 'localStorage data survives across browser sessions until explicitly cleared. sessionStorage data is tied to a single tab''s session and disappears once that tab is closed.', 2
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'localStorage only stores numbers, sessionStorage stores any type', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'localStorage persists after the browser tab is closed and reopened, sessionStorage clears when the tab closes', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'sessionStorage is faster than localStorage', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 2;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They are identical in every way', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 2;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Why must you use JSON.stringify() before storing an object in localStorage?', 'MCQ', 'Web Storage APIs (localStorage and sessionStorage) only accept string values. Storing an object directly would store the unhelpful string ''[object Object]'', so it must be converted to a JSON string first.', 3
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'localStorage automatically converts objects, so it''s unnecessary', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'localStorage can only store strings, so objects must be serialized into a string representation first', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'JSON.stringify() encrypts the data for security', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 3;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'It is only needed for arrays, not objects', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 3;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What does JSON.parse() do?', 'MCQ', 'JSON.parse() is the inverse of JSON.stringify() — it takes a JSON-formatted string and converts it back into a live JavaScript object, array, or primitive value.', 4
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Converts a JavaScript object into a JSON string', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'Converts a JSON string back into a usable JavaScript object or value', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Validates whether a string is valid JSON without converting it', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 4;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Deletes a JSON file', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 4;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Is JSON specific to JavaScript, despite the name containing ''JavaScript''?', 'MCQ', 'Despite originating from JavaScript object syntax, JSON has become the universal standard data-interchange format, with parsers available in essentially every programming language.', 5
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Yes — only JavaScript programs can read or write JSON', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'No — JSON is a language-agnostic data format used across virtually all programming languages for data exchange', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'JSON can only be used with Node.js, not browsers', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 5;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'JSON was replaced by XML in modern applications', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 5;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the purpose of automated tests like the one using test() and expect()?', 'MCQ', 'Automated tests assert expected behavior programmatically, so if a future code change accidentally breaks something, the test fails immediately rather than the bug reaching production.', 6
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'They make the code run faster in production', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They verify code behaves as expected and catch regressions before they reach users', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'They are only used for testing user interfaces visually', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 6;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'They replace the need for writing actual application code', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 6;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'What is the difference between a unit test and an integration test?', 'MCQ', 'Unit tests target small, isolated pieces of logic (like a single function), while integration tests verify that several components or systems function correctly when combined.', 7
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', 'Unit tests check individual functions in isolation, integration tests check that multiple pieces work correctly together', true, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', 'They are the same thing with different names', false, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', 'Integration tests only check visual layout', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 7;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', 'Unit tests are always slower than integration tests', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 7;

INSERT INTO questions (level_id, question_text, question_type, explanation, order_index)
SELECT l.id, 'Which of these is NOT a JSON-valid representation of data?', 'MCQ', 'JSON requires double-quoted string keys and cannot contain functions — only strings, numbers, booleans, null, arrays, and nested objects are valid JSON values.', 8
FROM levels l
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'A', '{\"name\": \"Arjun\"}', false, 1
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'B', '{name: ''Arjun'', greet: function() {}}', true, 2
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'C', '[1, 2, 3]', false, 3
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 8;
INSERT INTO question_options (question_id, option_label, option_text, is_correct, order_index)
SELECT q.id, 'D', '{\"active\": true}', false, 4
FROM questions q
JOIN levels l ON l.id = q.level_id
JOIN subjects s ON s.id = l.subject_id
WHERE s.code = 'JS' AND l.level_number = 20 AND q.order_index = 8;

