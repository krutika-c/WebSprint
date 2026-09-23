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

        // Try to read the server's error body (e.g. { "error": "..." })
        // so callers that want a specific message can show one. Kept
        // optional/best-effort — existing callers that only relied on
        // the generic "API Error: <status>" message are unaffected.
        let body = null;
        try {
            body = await response.clone().json();
        } catch (parseError) {
            body = null;
        }

        const error = new Error(`API Error: ${response.status}`);
        error.status = response.status;
        error.body = body;
        throw error;
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

   Instant per-question right/wrong feedback only. Doesn't
   touch progress, XP or streaks — see submitLevelAttempt
   for that.
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
   SUBMIT LEVEL ATTEMPT

   The real scoring call. Sends every answer for the level
   at once; the server grades it, updates progress, awards
   XP (level-completed / perfect-score / streak-bonus),
   extends the streak and unlocks the next level. Returns a
   SubmitResultResponse — see js/progress.js for the shape.
===================================================== */

async function submitLevelAttempt(levelId, answers) {

    return apiFetch(
        `/api/levels/${levelId}/attempts`,
        {
            method: "POST",

            body: JSON.stringify({
                answers: answers
            })
        }
    );

}


/* =====================================================
   GET PROGRESS

   Every level, with this user's real status (locked /
   unlocked / completed), best score and attempt count.
===================================================== */

async function getMyProgress() {

    return apiFetch(`/api/progress`);

}


/* =====================================================
   GET STATS

   { totalXp, currentStreak, longestStreak } for the
   logged-in user.
===================================================== */

async function getMyStats() {

    return apiFetch(`/api/me/stats`);

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
   LESSON LOCKING

   Used to be tracked client-side in localStorage. Now that
   the backend has real per-user progress (locked/unlocked/
   completed, persisted, synced across devices), lock state
   comes from js/progress.js (isLevelCompleted/isLevelLocked
   backed by getMyProgress()) instead. Nothing here anymore —
   kept as a marker in case any old code still imports this
   file expecting these names.
===================================================== */