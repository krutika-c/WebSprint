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
        // SETUP QUIZ BUTTON
        // ---------------------------------------

        setupQuizButton(
            levelId,
            subject
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

        return marked.parse(markdown);

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
// QUIZ BUTTON
// ==================================================

function setupQuizButton(
    levelId,
    subject
) {

    const quizButton =
        document.getElementById("start-quiz");


    if (!quizButton) {

        console.error(
            "START QUIZ button not found"
        );

        return;
    }


    // ---------------------------------------
    // SET CORRECT QUIZ URL
    // ---------------------------------------

    quizButton.href =
        `questions.html?levelId=${levelId}&subject=${encodeURIComponent(subject)}`;


    console.log(
        "Quiz URL:",
        quizButton.href
    );


    // ---------------------------------------
    // CLICK HANDLER
    // ---------------------------------------

    quizButton.onclick = () => {

        window.location.href =
            `questions.html?levelId=${levelId}&subject=${encodeURIComponent(subject)}`;

    };

}



// ==================================================
// LESSON NAVIGATION
// ==================================================

function setupLessonNavigation(
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


        nextButton.textContent =
            "NEXT LESSON →";


        nextButton.onclick =
            (event) => {

                event.preventDefault();

                window.location.href =
                    `lesson.html?levelId=${nextLevel.id}&subject=${encodeURIComponent(subject)}`;

            };

    }

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