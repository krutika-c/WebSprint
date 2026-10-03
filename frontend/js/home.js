async function loadSubjects() {
    try {
        const subjects = await apiFetch("/api/subjects");

        console.log(subjects);

    } catch (error) {
        console.error(error);
    }
}

loadSubjects();

// ==================================================
// START GAME flow on h1.html
//
// 1. Returning users who already took the placement test never see
//    this landing page: they're redirected straight to choose-topic.html
//    (it's one-time only; PlacementService.hasTaken is the source of truth).
// 2. Everyone else sees a single START GAME button. Clicking it swaps
//    in two choices: TAKE QUIZ (genre-test.html) or SKIP QUIZ (choose-topic.html).
// ==================================================

(function () {

    const startBtn = document.getElementById("start-game-btn");
    const startWrap = document.getElementById("start-buttons");
    const choices = document.getElementById("start-choices");

    if (startBtn && startWrap && choices) {
        startBtn.addEventListener("click", function () {
            startWrap.hidden = true;
            startWrap.style.display = "none";
            choices.hidden = false;
        });
    }

    function revealPage() {
        document.documentElement.classList.remove("checking");
    }

    async function redirectIfPlacementTaken() {
        // Not logged in — nothing to check.
        if (!localStorage.getItem("token")) {
            revealPage();
            return;
        }

        try {
            const status = await getPlacementStatus();
            if (status && status.taken) {
                window.location.replace("choose-topic.html");
                return; // keep page hidden while navigating
            }
        } catch (error) {
            // If we can't tell, don't block play.
            console.error(error);
        }

        revealPage();
    }

    redirectIfPlacementTaken();

})();