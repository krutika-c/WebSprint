// ==================================================
// PLACEMENT TEST ("genre test") — drives genre-test.html
//
// Loads every question (all 3 subjects at once) via
// getPlacementQuestions(), shows them one at a time reusing
// the existing .card.quiz / .option markup, then on the last
// question calls submitPlacementTest(). The result is stashed
// in sessionStorage and the user is sent to test-result.html,
// which reads it back and renders it (no second network call).
//
// Requires js/config.js + js/api.js to be loaded first.
// ==================================================

(function () {

    let questions = [];
    let currentIndex = 0;

    // questionId -> optionId
    const answers = {};

    const questionNumEl = document.querySelector(".question-num");
    const questionEl = document.querySelector(".question");
    const optionsEl = document.querySelector(".options");
    const nextBtn = document.querySelector(".editor-actions .btn");
    const cardEl = document.querySelector(".card.quiz");

    async function init() {
        // One-time only: if this user has already taken it (e.g. they came
        // back to this URL directly, or hit Back after finishing), bounce
        // them to the main app instead of letting them retake it. The real
        // enforcement is server-side (PlacementService.submitPlacement) —
        // this is just so they don't sit through 9 questions to be told no.
        try {
            const status = await getPlacementStatus();
            if (status.taken) {
                window.location.href = "choose-topic.html";
                return;
            }
        } catch (err) {
            // Couldn't check (e.g. not logged in) — fall through and let
            // the questions load; submit will still be rejected server-side
            // if it turns out they'd already taken it.
            console.error(err);
        }

        try {
            questions = await getPlacementQuestions();
        } catch (err) {
            if (cardEl) {
                cardEl.innerHTML = "<p>Couldn't load the placement test right now. Please try again in a moment.</p>";
            }
            return;
        }

        if (!questions.length) {
            if (cardEl) {
                cardEl.innerHTML = "<p>The placement test isn't set up yet — ask an admin to add questions.</p>";
            }
            return;
        }

        renderCurrentQuestion();
    }

    function renderCurrentQuestion() {
        const q = questions[currentIndex];

        questionNumEl.textContent = `Question ${currentIndex + 1} of ${questions.length}`;
        questionEl.textContent = q.questionText;

        optionsEl.innerHTML = "";
        q.options.forEach((opt, i) => {
            const btn = document.createElement("button");
            btn.className = "option";
            btn.dataset.optionId = opt.id;

            const key = document.createElement("span");
            key.className = "option__key";
            key.textContent = String.fromCharCode(65 + i); // A, B, C...

            btn.appendChild(key);
            btn.appendChild(document.createTextNode(" " + opt.optionText));

            if (answers[q.id] === opt.id) {
                btn.classList.add("is-selected");
            }

            btn.addEventListener("click", () => selectOption(q.id, opt.id));
            optionsEl.appendChild(btn);
        });

        nextBtn.textContent = currentIndex === questions.length - 1 ? "Finish →" : "Next →";
        updateNextButtonState();
    }

    function selectOption(questionId, optionId) {
        answers[questionId] = optionId;

        optionsEl.querySelectorAll(".option").forEach(btn => {
            btn.classList.toggle("is-selected", Number(btn.dataset.optionId) === optionId);
        });

        updateNextButtonState();
    }

    function updateNextButtonState() {
        const q = questions[currentIndex];
        const answered = answers[q.id] !== undefined;
        setButtonEnabled(answered);
    }

    // No ".is-disabled" style exists in the current CSS, so the disabled
    // look is applied inline here rather than depending on a class that
    // might not be defined.
    function setButtonEnabled(enabled) {
        nextBtn.style.opacity = enabled ? "1" : "0.5";
        nextBtn.style.pointerEvents = enabled ? "auto" : "none";
    }

    async function goNext() {
        const q = questions[currentIndex];
        if (answers[q.id] === undefined) {
            return; // must pick an option before moving on
        }

        if (currentIndex < questions.length - 1) {
            currentIndex++;
            renderCurrentQuestion();
            return;
        }

        // Last question answered — submit everything.
        const payload = Object.entries(answers).map(([questionId, optionId]) => ({
            questionId: Number(questionId),
            optionId: Number(optionId)
        }));

        nextBtn.textContent = "Scoring…";
        setButtonEnabled(false);

        try {
            const result = await submitPlacementTest(payload);
            sessionStorage.setItem("placementResult", JSON.stringify(result));
            window.location.href = "test-result.html";
        } catch (err) {
            nextBtn.textContent = "Finish →";
            setButtonEnabled(true);

            // Already taken (server-side guard) -> just send them on, don't
            // show this as an error.
            if (err.status === 409) {
                window.location.href = "choose-topic.html";
                return;
            }

            // Surface the server's actual message instead of a useless
            // generic one — GlobalExceptionHandler always sends one back
            // (e.g. "Authentication required" for a 401, or the real
            // exception for a 500). Falls back to err.message if the
            // response body wasn't JSON at all (e.g. a network failure).
            const detail = (err.body && err.body.message) || err.message || "Unknown error";
            console.error("Placement submit failed:", err.status, err.body || err);
            alert(`Something went wrong submitting the test (${err.status || "network"}): ${detail}`);
        }
    }

    if (nextBtn) {
        nextBtn.addEventListener("click", (e) => {
            e.preventDefault();
            goNext();
        });
    }

    init();

})();