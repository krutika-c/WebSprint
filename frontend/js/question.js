document.addEventListener("DOMContentLoaded", () => {
    loadQuestions();
});


let questions = [];
let currentQuestionIndex = 0;
let levelId = null;


// ==================================================
// LOAD QUESTIONS
// ==================================================

async function loadQuestions() {

    try {

        // Get levelId from URL
        // Example:
        // question.html?levelId=1

        const params =
            new URLSearchParams(window.location.search);

        levelId =
            Number(params.get("levelId")) || 1;


        console.log("Loading questions for level:", levelId);


        // Get questions from backend

        questions =
            await getQuestions(levelId);


        console.log("Questions received:", questions);


        // No questions

        if (!questions || questions.length === 0) {

            document.getElementById("question-text").textContent =
                "No questions available.";

            return;
        }


        // Show first question

        showQuestion();

    } catch (error) {

        console.error(
            "Question loading error:",
            error
        );

        document.getElementById("question-text").textContent =
            "Unable to load questions.";

    }

}


// ==================================================
// DISPLAY CURRENT QUESTION
// ==================================================

function showQuestion() {

    const question =
        questions[currentQuestionIndex];


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


    // Question text

    questionText.textContent =
        question.questionText;


    // Question number

    progress.textContent =
        `QUESTION ${currentQuestionIndex + 1} / ${questions.length}`;


    // Level number

    level.textContent =
        levelId;


    // Clear previous options

    optionsContainer.innerHTML = "";


    // Clear feedback

    feedback.innerHTML = "";


    // Hide next button

    nextButton.style.display = "none";


    // Reset progress bar

    const progressFill =
        document.getElementById("quiz-progress-fill");

    if (progressFill) {

        const percentage =
            ((currentQuestionIndex + 1) / questions.length) * 100;

        progressFill.style.width =
            `${percentage}%`;
    }


    // Create options

    question.options.forEach(option => {

        const button =
            document.createElement("button");


        button.type = "button";

        button.className =
            "quiz-option";


        button.innerHTML = `

            <span class="option-label">
                ${option.optionLabel}
            </span>

            <span class="option-text">
                ${option.optionText}
            </span>

        `;


        // When option is clicked

        button.addEventListener("click", () => {

            submitAnswer(
                question,
                option
            );

        });


        optionsContainer.appendChild(button);

    });

}


// ==================================================
// SUBMIT ANSWER
// ==================================================

async function submitAnswer(question, option) {

    const optionsContainer =
        document.getElementById("options-container");

    const feedback =
        document.getElementById("answer-feedback");

    const nextButton =
        document.getElementById("next-question");


    // Disable all options

    const buttons =
        optionsContainer.querySelectorAll(".quiz-option");

    buttons.forEach(button => {

        button.disabled = true;

    });


    try {

        const result =
            await apiFetch(
                `/api/levels/${levelId}/questions/${question.id}/answer`,
                {
                    method: "POST",

                    body: JSON.stringify({
                        optionId: option.id
                    })
                }
            );


        console.log("Answer result:", result);


        // Correct

        if (result.correct) {

            feedback.innerHTML = `
                <div class="answer-correct">
                    ✓ Correct!
                    <p>${result.explanation || ""}</p>
                </div>
            `;

        }

        // Wrong

        else {

            feedback.innerHTML = `
                <div class="answer-wrong">
                    ✕ Incorrect
                    <p>${result.explanation || ""}</p>
                </div>
            `;

        }


        // Show next button

        nextButton.style.display = "inline-flex";


        // If last question

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

        buttons.forEach(button => {

            button.disabled = false;

        });

    }

}


// ==================================================
// NEXT QUESTION
// ==================================================

document.addEventListener("click", (event) => {

    if (
        event.target.id !==
        "next-question"
    ) {
        return;
    }


    // More questions

    if (
        currentQuestionIndex <
        questions.length - 1
    ) {

        currentQuestionIndex++;

        showQuestion();

    }

    // Quiz finished

    else {

        window.location.href =
            `level-complete.html?levelId=${levelId}`;

    }

});