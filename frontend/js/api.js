async function apiFetch(endpoint, options = {}) {

    const token = localStorage.getItem("token");

    const headers = {
        "Content-Type": "application/json",
        ...(options.headers || {})
    };

    if (token) {
        headers["Authorization"] = `Bearer ${token}`;
    }

    const response = await fetch(
        `${API_BASE_URL}${endpoint}`,
        {
            ...options,
            headers
        }
    );

    if (!response.ok) {
        throw new Error(`API Error: ${response.status}`);
    }

    return response.json();
}


/* =====================================================
   GET ALL LEVELS FOR A SUBJECT
===================================================== */

async function getLevels(subject = "HTML") {

    return apiFetch(
        `/api/subjects/${encodeURIComponent(subject)}/levels`
    );

}


/* =====================================================
   GET LESSON
===================================================== */

async function getLesson(levelId) {

    return apiFetch(
        `/api/levels/${levelId}/lesson`
    );

}


/* =====================================================
   GET QUESTIONS
===================================================== */

async function getQuestions(levelId) {

    return apiFetch(
        `/api/levels/${levelId}/questions`
    );

}


/* =====================================================
   SUBMIT ANSWER
===================================================== */

async function submitAnswer(levelId, questionId, optionId) {

    return apiFetch(
        `/api/levels/${levelId}/questions/${questionId}/answer`,
        {
            method: "POST",

            body: JSON.stringify({
                optionId: optionId
            })
        }
    );

}


/* =====================================================
   ANSWER REVEAL

   Marks the correct option green and (if different) the
   picked option red. Relies on button.dataset.optionId and
   result.correctOptionId from the /answer endpoint.
===================================================== */

function markAnswerOptions(container, pickedOptionId, result) {

    const correctId = Number(
        result.correct ? pickedOptionId : result.correctOptionId
    );

    container.querySelectorAll(".quiz-option").forEach(btn => {

        const id = Number(btn.dataset.optionId);

        if (id === correctId) {
            btn.classList.add("is-correct");
        }
        else if (id === Number(pickedOptionId)) {
            btn.classList.add("is-wrong");
        }

    });

}


/* =====================================================
   LESSON LOCKING (frontend-only for now)

   Tracks which lessons have had their quiz completed,
   so the roadmap and the lesson page itself can lock
   the next lesson until that happens.

   NOTE: this is stored in the browser only (localStorage),
   not on the backend yet — it will reset if the person
   clears their browser data or switches devices. This can
   be swapped for a real per-user backend endpoint later
   without changing how the rest of the app calls these
   three functions.
===================================================== */

const COMPLETED_LEVELS_KEY = "websprint_completed_levels";


function getCompletedLevelIds() {

    try {

        const raw =
            localStorage.getItem(COMPLETED_LEVELS_KEY);

        const parsed =
            raw ? JSON.parse(raw) : [];

        return Array.isArray(parsed) ? parsed : [];

    }

    catch (error) {

        console.error(
            "Could not read completed levels:",
            error
        );

        return [];

    }

}


function isLevelCompleted(levelId) {

    return getCompletedLevelIds().includes(
        Number(levelId)
    );

}


function markLevelCompleted(levelId) {

    const completed =
        getCompletedLevelIds();

    const id =
        Number(levelId);

    if (!completed.includes(id)) {

        completed.push(id);

        try {

            localStorage.setItem(
                COMPLETED_LEVELS_KEY,
                JSON.stringify(completed)
            );

        }

        catch (error) {

            console.error(
                "Could not save completed level:",
                error
            );

        }

    }

}