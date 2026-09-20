document.addEventListener(
    "DOMContentLoaded",
    () => {

        loadQuestions();

    }
);


let questions = [];

let currentQuestionIndex = 0;

let levelId = null;

// The DB primary key (levelId) is not the same as the level's
// position within its subject (e.g. CSS level 1 can have a DB id
// like 41 once HTML/JS levels come before it). levelNumber holds
// the per-subject number (1, 2, 3...) that should be shown to the
// user instead of the raw id.
let levelNumber = null;

let subject = "HTML";



// ==================================================
// LOAD QUESTIONS
// ==================================================

async function loadQuestions() {

    try {

        // ---------------------------------------
        // Get URL parameters
        // ---------------------------------------

        const params =
            new URLSearchParams(
                window.location.search
            );


        levelId =
            Number(
                params.get("levelId")
            ) || 1;


        subject =
            params.get("subject") ||
            "HTML";


        console.log(
            "Current subject:",
            subject
        );


        console.log(
            "Loading questions for level:",
            levelId
        );


        // ---------------------------------------
        // Resolve the per-subject level number
        // (levelId is the DB id, not the number
        // shown to the user)
        // ---------------------------------------

        try {

            const levels =
                await getLevels(subject);

            const currentLevel =
                levels.find(
                    level =>
                        Number(level.id) === levelId
                );

            levelNumber =
                currentLevel
                    ? currentLevel.levelNumber
                    : levelId;

        } catch (levelLookupError) {

            console.error(
                "Could not resolve level number:",
                levelLookupError
            );

            levelNumber = levelId;

        }


        // ---------------------------------------
        // Get questions
        // ---------------------------------------

        questions =
            await getQuestions(
                levelId
            );


        console.log(
            "Questions received:",
            questions
        );


        // ---------------------------------------
        // No questions
        // ---------------------------------------

        if (
            !questions ||
            questions.length === 0
        ) {

            const questionText =
                document.getElementById(
                    "question-text"
                );


            if (questionText) {

                questionText.textContent =
                    "No questions available.";

            }


            return;

        }


        // ---------------------------------------
        // Show first question
        // ---------------------------------------

        showQuestion();

    } catch (error) {

        console.error(
            "Question loading error:",
            error
        );


        const questionText =
            document.getElementById(
                "question-text"
            );


        if (questionText) {

            questionText.textContent =
                "Unable to load questions.";

        }

    }

}



// ==================================================
// DISPLAY QUESTION
// ==================================================

function showQuestion() {

    const question =
        questions[
            currentQuestionIndex
        ];


    const questionText =
        document.getElementById(
            "question-text"
        );


    const optionsContainer =
        document.getElementById(
            "options-container"
        );


    const progress =
        document.getElementById(
            "question-progress"
        );


    const level =
        document.getElementById(
            "quiz-level"
        );


    const feedback =
        document.getElementById(
            "answer-feedback"
        );


    const nextButton =
        document.getElementById(
            "next-question"
        );


    // ---------------------------------------
    // Question text
    // ---------------------------------------

    questionText.textContent =
        question.questionText;


    // ---------------------------------------
    // Progress
    // ---------------------------------------

    progress.textContent =
        `QUESTION ${currentQuestionIndex + 1} / ${questions.length}`;


    // ---------------------------------------
    // Level
    // (show the per-subject level number, not
    // the raw database id)
    // ---------------------------------------

    level.textContent =
        levelNumber != null
            ? levelNumber
            : levelId;


    // ---------------------------------------
    // Clear options
    // ---------------------------------------

    optionsContainer.innerHTML =
        "";


    // ---------------------------------------
    // Clear feedback
    // ---------------------------------------

    feedback.innerHTML =
        "";


    // ---------------------------------------
    // Hide next
    // ---------------------------------------

    nextButton.style.display =
        "none";


    // ---------------------------------------
    // Progress bar
    // ---------------------------------------

    const progressFill =
        document.getElementById(
            "quiz-progress-fill"
        );


    if (progressFill) {

        const percentage =
            (
                (
                    currentQuestionIndex + 1
                )
                /
                questions.length
            )
            * 100;


        progressFill.style.width =
            `${percentage}%`;

    }


    // ---------------------------------------
    // Create options
    // ---------------------------------------

    question.options.forEach(
        option => {

            const button =
                document.createElement(
                    "button"
                );


            button.type =
                "button";


            button.className =
                "quiz-option";

            button.dataset.optionId =
                option.id;


            button.innerHTML = `
                <span class="option-label">
                    ${option.optionLabel}
                </span>

                <span class="option-text">
                    ${option.optionText}
                </span>
            `;


            // --------------------------------
            // Click answer
            // --------------------------------

            button.addEventListener(
                "click",
                () => {

                    submitAnswer(
                        question,
                        option
                    );

                }
            );


            optionsContainer.appendChild(
                button
            );

        }
    );

}



// ==================================================
// SUBMIT ANSWER
// ==================================================

async function submitAnswer(
    question,
    option
) {

    const optionsContainer =
        document.getElementById(
            "options-container"
        );


    const feedback =
        document.getElementById(
            "answer-feedback"
        );


    const nextButton =
        document.getElementById(
            "next-question"
        );


    // ---------------------------------------
    // Disable options
    // ---------------------------------------

    const buttons =
        optionsContainer.querySelectorAll(
            ".quiz-option"
        );


    buttons.forEach(
        button => {

            button.disabled =
                true;

        }
    );


    try {

        // ---------------------------------------
        // Submit answer
        // ---------------------------------------

        const result =
            await apiFetch(
                `/api/levels/${levelId}/questions/${question.id}/answer`,
                {

                    method: "POST",

                    body:
                        JSON.stringify(
                            {
                                optionId:
                                    option.id
                            }
                        )

                }
            );


        console.log(
            "Answer result:",
            result
        );


        markAnswerOptions(
            optionsContainer,
            option.id,
            result
        );


        // ---------------------------------------
        // Correct
        // ---------------------------------------

        if (result.correct) {

            feedback.innerHTML = `
                <div class="answer-correct">

                    ✓ Correct!

                    <p>
                        ${result.explanation || ""}
                    </p>

                </div>
            `;

        }


        // ---------------------------------------
        // Wrong
        // ---------------------------------------

        else {

            feedback.innerHTML = `
                <div class="answer-wrong">

                    ✕ Incorrect

                    <p>
                        ${result.explanation || ""}
                    </p>

                </div>
            `;

        }


        // ---------------------------------------
        // Show next button
        // ---------------------------------------

        nextButton.style.display =
            "inline-flex";


        // ---------------------------------------
        // Last question
        // ---------------------------------------

        if (
            currentQuestionIndex ===
            questions.length - 1
        ) {

            nextButton.textContent =
                "Complete Quiz ✓";

        }

    } catch (error) {

        console.error(
            "Answer submission error:",
            error
        );


        feedback.innerHTML = `
            <div class="answer-wrong">

                Unable to submit answer.
                Please try again.

            </div>
        `;


        // Re-enable options

        buttons.forEach(
            button => {

                button.disabled =
                    false;

            }
        );

    }

}



// ==================================================
// NEXT QUESTION
// ==================================================

document.addEventListener(
    "click",
    event => {

        if (
            event.target.id !==
            "next-question"
        ) {

            return;

        }


        // ---------------------------------------
        // More questions
        // ---------------------------------------

        if (
            currentQuestionIndex <
            questions.length - 1
        ) {

            currentQuestionIndex++;

            showQuestion();

        }


        // ---------------------------------------
        // Quiz finished
        // ---------------------------------------

        else {

            window.location.href =
                `level-complete.html?levelId=${levelId}&subject=${subject}`;

        }

    }
);