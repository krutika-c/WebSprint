// ==================================================
// LESSON PAGE
// ==================================================

document.addEventListener("DOMContentLoaded", () => {
    loadLesson();
});


// ==================================================
// LOAD LESSON
// ==================================================

async function loadLesson() {

    try {

        // ---------------------------------------
        // GET URL PARAMETERS
        // ---------------------------------------

        const params =
            new URLSearchParams(window.location.search);

        const levelId =
            Number(params.get("levelId"));

        const subject =
            params.get("subject") ||
            document.body.dataset.subject ||
            "HTML";

        console.log("Current subject:", subject);
        console.log("Current level ID:", levelId);


        // ---------------------------------------
        // CHECK LEVEL ID
        // ---------------------------------------

        if (!levelId) {

            console.error("Level ID not found");

            showLessonError(
                "No lesson was selected."
            );

            return;
        }


        // ---------------------------------------
        // GET HTML ELEMENTS
        // ---------------------------------------

        const lessonNumber =
            document.getElementById("lesson-number");

        const lessonPager =
            document.getElementById("lesson-pager");

        const lessonTitle =
            document.getElementById("lesson-title");

        const lessonDescription =
    document.getElementById("lesson-description");

const lessonContent =
    document.getElementById("lesson-content");

const lessonSubject =
    document.getElementById("lesson-subject");


        // ---------------------------------------
        // GET LEVELS
        // ---------------------------------------

        const levels =
            await getLevels(subject);

        console.log(
            `${subject} levels:`,
            levels
        );


        // ---------------------------------------
        // FIND CURRENT LEVEL
        // ---------------------------------------

        const currentLevel =
            levels.find(
                level =>
                    Number(level.id) === levelId
            );


        if (!currentLevel) {

            console.error(
                "Current level not found:",
                levelId
            );

            showLessonError(
                "The requested lesson could not be found."
            );

            return;
        }


        console.log(
            "Current level:",
            currentLevel
        );


        // ---------------------------------------
        // LOCK CHECK
        //
        // A lesson stays locked until the quiz for
        // the lesson right before it has been
        // completed. Level 1 is always open.
        // ---------------------------------------

        const currentIndex =
            levels.findIndex(
                level =>
                    Number(level.id) === levelId
            );

        const previousLevel =
            currentIndex > 0
                ? levels[currentIndex - 1]
                : null;

        if (
            previousLevel &&
            !(await isLevelCompleted(previousLevel.id))
        ) {

            console.warn(
                "Lesson is locked, previous level not completed:",
                previousLevel
            );

            showLessonLocked(
                previousLevel,
                subject
            );

            return;

        }


        // ---------------------------------------
        // CURRENT LEVEL NUMBER
        // ---------------------------------------

        const currentNumber =
            Number(currentLevel.levelNumber);


        // ---------------------------------------
        // LESSON NUMBER
        // ---------------------------------------

        if (lessonNumber) {

            lessonNumber.textContent =
                `LESSON ${String(currentNumber).padStart(2, "0")}`;

        }


        // ---------------------------------------
        // LESSON PAGER
        // ---------------------------------------

        if (lessonPager) {

            lessonPager.textContent =
                `${String(currentNumber).padStart(2, "0")} / ${levels.length}`;

        }


        // ---------------------------------------
        // LESSON TITLE
        // ---------------------------------------

        if (lessonTitle) {

            lessonTitle.textContent =
                currentLevel.title;

        }


        // ---------------------------------------
        // LESSON DESCRIPTION
        // ---------------------------------------

        if (lessonDescription) {

            lessonDescription.textContent =
                `${currentLevel.difficulty} · ${subject}`;

        }
        if (lessonSubject) {

    lessonSubject.textContent =
        subject;

}


        // ---------------------------------------
        // GET LESSON
        // ---------------------------------------

        const lessonId =
            currentLevel.lessonId ||
            currentLevel.id;

        console.log(
            "Loading lesson:",
            lessonId
        );


        const lesson =
            await getLesson(lessonId);


        console.log(
            "Lesson received:",
            lesson
        );


        // ---------------------------------------
        // DISPLAY LESSON
        // ---------------------------------------

        if (
            lesson &&
            lesson.contentMarkdown
        ) {

            lessonContent.innerHTML =
                markdownToHTML(
                    lesson.contentMarkdown
                );

        } else {

            lessonContent.innerHTML = `
                <p class="pixel-loading">
                    No lesson content available.
                </p>
            `;

        }


        // ---------------------------------------
        // SETUP NAVIGATION
        // ---------------------------------------

        setupLessonNavigation(
            levels,
            currentLevel,
            subject
        );


        // ---------------------------------------
        // LOAD EMBEDDED QUIZ
        // ---------------------------------------

        loadEmbeddedQuiz(
            levelId,
            subject,
            currentNumber
        );

    }

    catch (error) {

        console.error(
            "Lesson loading error:",
            error
        );

        showLessonError(
            "Something went wrong while loading this lesson."
        );

    }

}



// ==================================================
// MARKDOWN → HTML
// ==================================================

function markdownToHTML(markdown) {

    if (!markdown) {
        return "";
    }


    // ---------------------------------------
    // USE MARKED
    // ---------------------------------------

    if (
        typeof marked !== "undefined" &&
        typeof marked.parse === "function"
    ) {

        // Lesson content sometimes mentions real tags
        // (e.g. "This rule changes every <h1> heading")
        // without wrapping them in backticks. By default
        // marked passes raw HTML straight through, so an
        // unescaped block tag like <h1> or <div> gets
        // inserted into the page as a REAL element —
        // the browser then auto-closes the surrounding
        // <p> early and swallows the rest of the lesson
        // text into that stray heading/div. Overriding
        // the html renderer to escape instead of pass
        // through fixes this without touching the seed
        // content, and backtick code spans (e.g. `<p>`)
        // are unaffected since those go through a
        // different renderer method.

        const renderer = new marked.Renderer();

        renderer.html = (html) => {

            const text =
                (html && typeof html === "object")
                    ? html.text
                    : html;

            return String(text)
                .replace(/&/g, "&amp;")
                .replace(/</g, "&lt;")
                .replace(/>/g, "&gt;");

        };

        return marked.parse(
            markdown,
            { renderer }
        );

    }


    // ---------------------------------------
    // FALLBACK
    // ---------------------------------------

    let html = markdown;


    // Escape HTML
    html =
        html
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;");


    // Headings
    html =
        html.replace(
            /^#### (.*)$/gm,
            "<h4>$1</h4>"
        );

    html =
        html.replace(
            /^### (.*)$/gm,
            "<h3>$1</h3>"
        );

    html =
        html.replace(
            /^## (.*)$/gm,
            "<h2>$1</h2>"
        );

    html =
        html.replace(
            /^# (.*)$/gm,
            "<h1>$1</h1>"
        );


    // Bold
    html =
        html.replace(
            /\*\*(.*?)\*\*/g,
            "<strong>$1</strong>"
        );


    // Italic
    html =
        html.replace(
            /\*(.*?)\*/g,
            "<em>$1</em>"
        );


    // Inline code
    html =
        html.replace(
            /`([^`]+)`/g,
            "<code>$1</code>"
        );


    // New lines
    html =
        html.replace(
            /\r?\n/g,
            "<br>"
        );


    return html;
}



// ==================================================
// EMBEDDED QUIZ (replaces the old live preview panel)
// ==================================================

let quizLevelId = null;

// The DB primary key (quizLevelId) is what the API needs for
// fetching/submitting; it is NOT the same as the level's position
// within its subject (e.g. CSS level 1 can have a DB id like 41
// once HTML/JS levels come before it). quizLevelNumber holds the
// per-subject number (1, 2, 3...) that should be shown to the user.
let quizLevelNumber = null;

let quizSubject = "HTML";

let quizQuestions = [];

let quizCurrentIndex = 0;

// questionId -> optionId, one entry per answered question. Sent to
// POST /api/levels/{levelId}/attempts when the quiz finishes — that
// call is the one that actually grades the level, awards XP and
// extends the streak (the per-question /answer call above is just
// instant right/wrong feedback while the person is answering).
let quizAnswers = new Map();


// ==================================================
// LOAD QUIZ
// ==================================================

async function loadEmbeddedQuiz(
    levelId,
    subject,
    levelNumber
) {

    quizLevelId = levelId;

    quizLevelNumber = levelNumber;

    quizSubject = subject;

    quizCurrentIndex = 0;

    quizAnswers = new Map();


    const questionText =
        document.getElementById("question-text");


    try {

        // ---------------------------------------
        // GET QUESTIONS FOR THIS LESSON
        // ---------------------------------------

        quizQuestions =
            await getQuestions(levelId);

        console.log(
            "Lesson quiz questions:",
            quizQuestions
        );


        // ---------------------------------------
        // NO QUESTIONS
        // ---------------------------------------

        if (
            !quizQuestions ||
            quizQuestions.length === 0
        ) {

            if (questionText) {

                questionText.textContent =
                    "No quiz available for this lesson yet.";

            }

            return;
        }


        // ---------------------------------------
        // SHOW FIRST QUESTION
        // ---------------------------------------

        showQuizQuestion();

    }

    catch (error) {

        console.error(
            "Embedded quiz loading error:",
            error
        );

        if (questionText) {

            questionText.textContent =
                "Unable to load the quiz for this lesson.";

        }

    }

}



// ==================================================
// DISPLAY QUIZ QUESTION
// ==================================================

function showQuizQuestion() {

    const question =
        quizQuestions[quizCurrentIndex];

    const questionText =
        document.getElementById("question-text");

    const optionsContainer =
        document.getElementById("options-container");

    const progress =
        document.getElementById("question-progress");

    const level =
        document.getElementById("quiz-level");

    const feedback =
        document.getElementById("answer-feedback");

    const nextButton =
        document.getElementById("next-question");


    if (
        !questionText ||
        !optionsContainer ||
        !progress ||
        !level ||
        !feedback ||
        !nextButton
    ) {

        console.error(
            "Embedded quiz elements not found"
        );

        return;
    }


    // ---------------------------------------
    // QUESTION TEXT
    // ---------------------------------------

    questionText.textContent =
        question.questionText;


    // ---------------------------------------
    // PROGRESS
    // ---------------------------------------

    progress.textContent =
        `QUESTION ${quizCurrentIndex + 1} / ${quizQuestions.length}`;


    // ---------------------------------------
    // LEVEL
    // (show the per-subject level number, not
    // the raw database id)
    // ---------------------------------------

    level.textContent =
        quizLevelNumber != null
            ? quizLevelNumber
            : quizLevelId;


    // ---------------------------------------
    // RESET OPTIONS / FEEDBACK / NEXT BUTTON
    // ---------------------------------------

    optionsContainer.innerHTML = "";

    feedback.innerHTML = "";

    nextButton.style.display = "none";


    // ---------------------------------------
    // PROGRESS BAR
    // ---------------------------------------

    const progressFill =
        document.getElementById("quiz-progress-fill");

    if (progressFill) {

        const percentage =
            ((quizCurrentIndex + 1) / quizQuestions.length) * 100;

        progressFill.style.width =
            `${percentage}%`;

    }


    // ---------------------------------------
    // CREATE OPTIONS
    // ---------------------------------------

    question.options.forEach(
        option => {

            const button =
                document.createElement("button");

            button.type = "button";

            button.className = "quiz-option";

            button.dataset.optionId = option.id;


            // NOTE: built with createElement + textContent
            // (not innerHTML) because option text often
            // contains raw HTML/CSS/JS snippets like
            // "<br>" or "<!DOCTYPE html>" — inserting those
            // via innerHTML makes the browser treat them as
            // real tags instead of visible text, so the
            // option silently goes blank or breaks layout.

            const labelSpan =
                document.createElement("span");

            labelSpan.className = "option-label";

            labelSpan.textContent =
                option.optionLabel;


            const textSpan =
                document.createElement("span");

            textSpan.className = "option-text";

            textSpan.textContent =
                option.optionText;


            button.appendChild(labelSpan);

            button.appendChild(textSpan);

            button.addEventListener(
                "click",
                () => {

                    submitQuizAnswer(
                        question,
                        option
                    );

                }
            );

            optionsContainer.appendChild(button);

        }
    );

}



// ==================================================
// SUBMIT QUIZ ANSWER
// ==================================================

async function submitQuizAnswer(
    question,
    option
) {

    const optionsContainer =
        document.getElementById("options-container");

    const feedback =
        document.getElementById("answer-feedback");

    const nextButton =
        document.getElementById("next-question");


    const buttons =
        optionsContainer.querySelectorAll(".quiz-option");

    buttons.forEach(
        button => {
            button.disabled = true;
        }
    );


    try {

        // ---------------------------------------
        // SUBMIT ANSWER
        // ---------------------------------------

        const result =
            await submitAnswer(
                quizLevelId,
                question.id,
                option.id
            );

        console.log(
            "Embedded quiz answer result:",
            result
        );


        // Record the choice for the real, server-graded
        // submission when the quiz finishes.
        quizAnswers.set(question.id, option.id);


        // ---------------------------------------
        // CORRECT / WRONG FEEDBACK
        // (built with createElement + textContent —
        // explanations also contain raw "<tag>" text
        // that innerHTML would silently swallow)
        // ---------------------------------------

        markAnswerOptions(optionsContainer, option.id, result);

        feedback.innerHTML = "";

        const feedbackBox =
            document.createElement("div");

        feedbackBox.className =
            result.correct ? "answer-correct" : "answer-wrong";

        const feedbackHeading =
            document.createElement("span");

        feedbackHeading.textContent =
            result.correct ? "✓ Correct!" : "✕ Incorrect";

        const feedbackExplanation =
            document.createElement("p");

        feedbackExplanation.textContent =
            result.explanation || "";

        feedbackBox.appendChild(feedbackHeading);

        feedbackBox.appendChild(feedbackExplanation);

        feedback.appendChild(feedbackBox);


        // ---------------------------------------
        // SHOW NEXT BUTTON
        // ---------------------------------------

        nextButton.style.display = "inline-flex";

        nextButton.onclick = () => {

            if (quizCurrentIndex < quizQuestions.length - 1) {

                quizCurrentIndex++;

                showQuizQuestion();

            }

            else {

                // Quiz finished — send every answer to the
                // server so it can grade the attempt, update
                // progress, award XP and extend the streak.
                finishQuiz();

            }

        };


        if (quizCurrentIndex === quizQuestions.length - 1) {

            nextButton.textContent =
                "Complete Quiz ✓";

        }

    }

    catch (error) {

        console.error(
            "Embedded quiz answer submission error:",
            error
        );

        feedback.innerHTML = `
            <div class="answer-wrong">
                Unable to submit answer. Please try again.
            </div>
        `;

        buttons.forEach(
            button => {
                button.disabled = false;
            }
        );

    }

}



// ==================================================
// FINISH QUIZ
//
// Submits every recorded answer to the server in one
// call. The server re-grades everything itself (the
// per-question /answer calls above are display-only),
// so this is the only place XP, streaks and unlocks
// actually happen. The full result is handed to
// level-complete.html via sessionStorage — it can't
// come through the URL cleanly and re-fetching it
// there would just repeat the submission.
// ==================================================

async function finishQuiz() {

    const nextButton =
        document.getElementById("next-question");

    const feedback =
        document.getElementById("answer-feedback");

    if (nextButton) {
        nextButton.disabled = true;
        nextButton.textContent = "Submitting…";
    }

    const answers =
        Array.from(quizAnswers.entries()).map(
            ([questionId, optionId]) => ({ questionId, optionId })
        );

    try {

        const result =
            await submitLevelAttempt(quizLevelId, answers);

        console.log(
            "Level attempt result:",
            result
        );

        // Progress/stats are cached per page load — make sure
        // the roadmap and stat chips on the next page fetch
        // fresh numbers instead of what was true before this
        // attempt.
        if (typeof refreshProgressAndStats === "function") {
            await refreshProgressAndStats();
        }

        sessionStorage.setItem(
            "websprint_last_result",
            JSON.stringify({ ...result, subject: quizSubject })
        );

        window.location.href =
            `level-complete.html?levelId=${quizLevelId}&subject=${encodeURIComponent(quizSubject)}`;

    }

    catch (error) {

        console.error(
            "Level attempt submission error:",
            error
        );

        if (feedback) {

            feedback.innerHTML = "";

            const errorBox =
                document.createElement("div");

            errorBox.className = "answer-wrong";

            errorBox.textContent =
                "Couldn't save your results. Check your connection and try again.";

            feedback.appendChild(errorBox);

        }

        if (nextButton) {
            nextButton.disabled = false;
            nextButton.textContent = "Complete Quiz ✓";
        }

    }

}



// ==================================================
// LESSON NAVIGATION
// ==================================================

async function setupLessonNavigation(
    levels,
    currentLevel,
    subject
) {

    const prevButton =
        document.getElementById("prev-lesson");

    const nextButton =
        document.getElementById("next-lesson");


    if (!prevButton || !nextButton) {

        console.error(
            "Lesson navigation buttons not found"
        );

        return;
    }


    // ---------------------------------------
    // CURRENT INDEX
    // ---------------------------------------

    const currentIndex =
        levels.findIndex(
            level =>
                Number(level.id) ===
                Number(currentLevel.id)
        );


    if (currentIndex === -1) {

        console.error(
            "Current lesson not found"
        );

        return;
    }


    console.log(
        `${subject} navigation index:`,
        currentIndex
    );


    // ==================================================
    // PREVIOUS
    // ==================================================

    if (currentIndex === 0) {

        prevButton.disabled = true;

        prevButton.style.opacity = "0.3";

        prevButton.style.cursor =
            "not-allowed";

    }

    else {

        const previousLevel =
            levels[currentIndex - 1];


        prevButton.disabled = false;

        prevButton.style.opacity = "1";

        prevButton.style.cursor =
            "pointer";


        prevButton.onclick = () => {

            window.location.href =
                `lesson.html?levelId=${previousLevel.id}&subject=${encodeURIComponent(subject)}`;

        };

    }



    // ==================================================
    // NEXT
    // ==================================================

    if (
        currentIndex ===
        levels.length - 1
    ) {

        nextButton.textContent =
            "COURSE COMPLETE ✓";


        nextButton.onclick =
            (event) => {

                event.preventDefault();

                window.location.href =
                    `${subject.toLowerCase()}-roadmap.html`;

            };

    }

    else {

        const nextLevel =
            levels[currentIndex + 1];


        // The lesson-to-lesson button skips straight
        // past the embedded quiz, so it should only
        // work once this lesson's quiz is done —
        // otherwise it just walks the person into the
        // lock screen on the next page.

        const thisLevelDone =
            await isLevelCompleted(currentLevel.id);


        if (!thisLevelDone) {

            nextButton.textContent =
                "🔒 FINISH QUIZ TO CONTINUE";

            nextButton.style.opacity = "0.5";

            nextButton.style.cursor = "not-allowed";

            nextButton.onclick =
                (event) => {

                    event.preventDefault();

                };

        }

        else {

            nextButton.textContent =
                "NEXT LESSON →";

            nextButton.style.opacity = "1";

            nextButton.style.cursor = "pointer";

            nextButton.onclick =
                (event) => {

                    event.preventDefault();

                    window.location.href =
                        `lesson.html?levelId=${nextLevel.id}&subject=${encodeURIComponent(subject)}`;

                };

        }

    }

}



// ==================================================
// LOCKED LESSON
// ==================================================

function showLessonLocked(
    previousLevel,
    subject
) {

    const title =
        document.getElementById("lesson-title");

    const description =
        document.getElementById("lesson-description");

    const content =
        document.getElementById("lesson-content");

    const quizPanel =
        document.getElementById("lesson-quiz");

    const prevButton =
        document.getElementById("prev-lesson");

    const nextButton =
        document.getElementById("next-lesson");


    if (title) {

        title.textContent =
            "🔒 LESSON LOCKED";

    }


    if (description) {

        description.textContent =
            `Finish the "${previousLevel.title}" quiz to unlock this lesson.`;

    }


    if (content) {

        content.innerHTML = "";

        const wrapper =
            document.createElement("div");

        wrapper.className = "lesson-error";

        const message =
            document.createElement("p");

        message.textContent =
            `Complete the quiz for "${previousLevel.title}" first to unlock this lesson.`;

        const backLink =
            document.createElement("a");

        backLink.className = "btn btn--primary";

        backLink.href =
            `lesson.html?levelId=${previousLevel.id}&subject=${encodeURIComponent(subject)}`;

        backLink.textContent =
            `Go to "${previousLevel.title}" →`;

        wrapper.appendChild(message);
        wrapper.appendChild(backLink);

        content.appendChild(wrapper);

    }


    // Hide the embedded quiz panel entirely —
    // there's nothing to quiz on a locked lesson.

    if (quizPanel) {

        quizPanel.closest(".pixel-preview-window").style.display =
            "none";

    }


    // Disable lesson-to-lesson navigation buttons
    // so the person can't route around the lock.

    [prevButton, nextButton].forEach(
        button => {

            if (button) {

                button.style.opacity = "0.3";

                button.style.pointerEvents = "none";

            }

        }
    );

}



// ==================================================
// ERROR
// ==================================================

function showLessonError(message) {

    const title =
        document.getElementById("lesson-title");

    const description =
        document.getElementById("lesson-description");

    const content =
        document.getElementById("lesson-content");


    if (title) {

        title.textContent =
            "LESSON NOT FOUND";

    }


    if (description) {

        description.textContent =
            "Unable to load this lesson.";

    }


    if (content) {

        content.innerHTML = `
            <div class="lesson-error">
                <p>${message}</p>
            </div>
        `;

    }

}