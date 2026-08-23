document.addEventListener("DOMContentLoaded", () => {
    loadLesson();
});


async function loadLesson() {

    try {

        // ---------------------------------------
        // Get level ID from URL
        // Example:
        // lesson.html?levelId=1
        // ---------------------------------------

        const params = new URLSearchParams(window.location.search);

        const levelId =
            parseInt(params.get("levelId")) || 1;


        // ---------------------------------------
        // Get elements
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

        const nextLesson =
            document.getElementById("next-lesson");


        // ---------------------------------------
        // Get all levels
        // ---------------------------------------

        const levels = await getLevels("HTML");


        // ---------------------------------------
        // Find current level by ID
        // ---------------------------------------

        const currentLevel = levels.find(
            level => Number(level.id) === levelId
        );


        if (!currentLevel) {

            lessonTitle.textContent =
                "Lesson Not Found";

            lessonDescription.textContent =
                "The requested lesson could not be found.";

            lessonContent.innerHTML =
                "<p>Lesson not available.</p>";

            nextLesson.style.display = "none";

            return;
        }


        // ---------------------------------------
        // Display lesson number
        // ---------------------------------------

        const currentNumber =
            Number(currentLevel.levelNumber);

        lessonNumber.textContent =
            `LESSON ${currentNumber}/20`;

        lessonPager.textContent =
            `${currentNumber} / 20`;


        // ---------------------------------------
        // Display title
        // ---------------------------------------

        lessonTitle.textContent =
            currentLevel.title;


        // ---------------------------------------
        // Get lesson
        // ---------------------------------------

        const lessonId =
            currentLevel.lessonId || currentLevel.id;

        const lesson =
            await getLesson(lessonId);


        // ---------------------------------------
        // Display lesson content
        // ---------------------------------------

        if (lesson.contentMarkdown) {

            lessonContent.innerHTML =
                markdownToHTML(lesson.contentMarkdown);

        } else {

            lessonContent.innerHTML =
                "<p>No lesson content available.</p>";

        }


        // ---------------------------------------
        // Next Lesson
        // ---------------------------------------

        if (currentNumber < 20) {

            const nextLevel =
                levels.find(
                    level =>
                        Number(level.levelNumber) ===
                        currentNumber + 1
                );

            nextLesson.style.display = "flex";

            nextLesson.textContent =
                "Next Lesson →";

            if (nextLevel) {

                nextLesson.href =
                    `lesson.html?levelId=${nextLevel.id}`;

            }

        } else {

            nextLesson.textContent =
                "Complete Course ✓";

            nextLesson.href =
                "html-roadmap.html";
        }


    } catch (error) {

        console.error("Lesson loading error:", error);

        document.getElementById("lesson-title").textContent =
            "Unable to Load Lesson";

        document.getElementById("lesson-description").textContent =
            "Something went wrong while loading this lesson.";

        document.getElementById("lesson-content").innerHTML =
            `
            <p style="color:#ff7a7a;">
                Failed to load lesson.
            </p>
            `;
    }
}


// ==================================================
// SIMPLE MARKDOWN → HTML
// ==================================================

function markdownToHTML(markdown) {

    let html = markdown;

    html = html
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;");


    // Headings
    html = html.replace(
        /^#### (.*)$/gm,
        "<h4>$1</h4>"
    );

    html = html.replace(
        /^### (.*)$/gm,
        "<h3>$1</h3>"
    );

    html = html.replace(
        /^## (.*)$/gm,
        "<h2>$1</h2>"
    );

    html = html.replace(
        /^# (.*)$/gm,
        "<h1>$1</h1>"
    );


    // Bold
    html = html.replace(
        /\*\*(.*?)\*\*/g,
        "<strong>$1</strong>"
    );


    // Italic
    html = html.replace(
        /\*(.*?)\*/g,
        "<em>$1</em>"
    );


    // Paragraphs
    html = html.replace(
        /\r?\n\r?\n/g,
        "</p><p>"
    );

    html = "<p>" + html + "</p>";


    return html;
}
const params = new URLSearchParams(window.location.search);
const currentLevelId = Number(params.get("levelId"));

const prevButton = document.getElementById("prev-lesson");
const nextButton = document.getElementById("next-lesson");

async function setupLessonNavigation() {

    try {

        // Get all HTML levels
        const levels = await getLevels("HTML");

        // Find current lesson
        const currentIndex = levels.findIndex(
            level => Number(level.id) === currentLevelId
        );

        if (currentIndex === -1) {
            console.error("Current lesson not found");
            return;
        }


        // =========================
        // PREVIOUS
        // =========================

        if (currentIndex === 0) {

            prevButton.disabled = true;
            prevButton.style.opacity = "0.3";
            prevButton.style.cursor = "not-allowed";

        } else {

            const previousLevel = levels[currentIndex - 1];

            prevButton.disabled = false;

            prevButton.onclick = () => {

                window.location.href =
                    `lesson.html?levelId=${previousLevel.id}`;

            };

        }


        // =========================
        // NEXT
        // =========================

        if (currentIndex === levels.length - 1) {

            nextButton.textContent = "COURSE COMPLETE ✓";
            nextButton.removeAttribute("href");

            nextButton.onclick = () => {
                window.location.href = "html-roadmap.html";
            };

        } else {

            const nextLevel = levels[currentIndex + 1];

            nextButton.onclick = (event) => {

                event.preventDefault();

                window.location.href =
                    `lesson.html?levelId=${nextLevel.id}`;

            };

        }

    } catch (error) {

        console.error(
            "Could not setup lesson navigation:",
            error
        );

    }

}

setupLessonNavigation();