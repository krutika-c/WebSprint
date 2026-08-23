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