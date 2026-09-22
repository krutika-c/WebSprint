// ==================================================
// LEVEL COMPLETE PAGE
//
// Reached from any subject's quiz once lesson.js submits the
// attempt (POST /api/levels/{id}/attempts). That call's full
// response — real score, XP gained, streak, unlock info — is
// handed over via sessionStorage under "websprint_last_result"
// (query params alone can't carry it, and re-fetching it here
// would mean submitting the attempt twice).
//
// If that key isn't there — someone reloaded this page, or
// opened it directly — there's no per-attempt result to show,
// so this falls back to a generic "level complete" message
// built from the levelId/subject query params, same as before.
// ==================================================

const RESULT_STORAGE_KEY = "websprint_last_result";

document.addEventListener("DOMContentLoaded", () => {

    const params =
        new URLSearchParams(window.location.search);

    const levelId =
        Number(params.get("levelId")) || 1;

    const subjectFromUrl =
        params.get("subject") || "HTML";

    let result = null;

    try {

        const raw =
            sessionStorage.getItem(RESULT_STORAGE_KEY);

        if (raw) {
            result = JSON.parse(raw);
        }

    } catch (error) {

        console.error(
            "Could not read stored attempt result:",
            error
        );

    }

    // One-shot: don't let a refresh replay the same result.
    sessionStorage.removeItem(RESULT_STORAGE_KEY);

    const subject =
        (result && result.subject) || subjectFromUrl;

    if (result) {
        renderRealResult(result, subject, levelId);
    } else {
        renderFallback(subject, levelId);
    }

});



// ==================================================
// REAL RESULT (normal path — came straight from the quiz)
// ==================================================

function renderRealResult(result, subject, levelId) {

    const els = getElements();

    const passed = !!result.passed;

    if (els.card) {
        els.card.classList.toggle("is-not-passed", !passed);
    }

    // ---------------------------------------
    // TITLE / BADGE
    // ---------------------------------------

    if (els.badge) {
        els.badge.textContent = `ATTEMPT ${result.attempts || ""}`.trim();
    }

    if (els.title) {
        els.title.textContent = passed ? "Level Complete!" : "Not Quite There";
    }

    if (els.celebrateTitle) {
        els.celebrateTitle.textContent = passed ? "Level Complete!" : "Not Quite There";
    }

    // ---------------------------------------
    // DESCRIPTION / SUBTITLE — always show the real score
    // ---------------------------------------

    const scoreLine = passed
        ? `You scored ${result.score}% on ${subject} — nice work!`
        : `You scored ${result.score}% on ${subject}. You need ${60}% to pass — give it another go.`;

    if (els.heroDesc) els.heroDesc.textContent = scoreLine;
    if (els.subtitle) els.subtitle.textContent = scoreLine;

    // ---------------------------------------
    // REWARDS — only meaningful when the attempt passed
    // ---------------------------------------

    if (els.rewardRow) {
        els.rewardRow.style.display = passed ? "" : "none";
    }

    if (passed) {

        if (els.rewardXpText) {
            els.rewardXpText.textContent = `+${result.xpGained} XP`;
        }

        if (els.rewardStreakText) {
            const days = result.currentStreak || 0;
            els.rewardStreakText.textContent =
                `${days}-Day Streak`;
        }

        if (els.rewardTotalXpText) {
            els.rewardTotalXpText.textContent =
                `${(result.totalXp || 0).toLocaleString()} Total XP`;
        }

    }

    // ---------------------------------------
    // UNLOCK NOTE / CONTINUE LINK
    // ---------------------------------------

    if (els.unlockNote) {

        if (!passed) {
            els.unlockNote.style.display = "none";
        } else if (result.unlockedLevelId) {
            els.unlockNote.style.display = "";
            els.unlockNote.textContent =
                `🔓 The next ${subject} level is unlocked`;
        } else {
            els.unlockNote.style.display = "";
            els.unlockNote.textContent =
                result.bestScore != null
                    ? `Best score so far: ${result.bestScore}%`
                    : "";
        }

    }

    if (els.continueLink) {

        if (passed) {
            els.continueLink.href = `${subject.toLowerCase()}-roadmap.html`;
            els.continueLink.textContent = "Continue Learning →";
        } else {
            els.continueLink.href =
                `lesson.html?levelId=${levelId}&subject=${encodeURIComponent(subject)}`;
            els.continueLink.textContent = "Try Again →";
        }

    }

    // ---------------------------------------
    // Per-subject level number is cosmetic only (badge already
    // shows the attempt count) — resolve it quietly in the
    // background for the description text.
    // ---------------------------------------

    getLevels(subject)
        .then(levels => {

            const levelNumber =
                (levels.find(l => Number(l.id) === levelId) || {}).levelNumber;

            if (levelNumber == null) return;

            const line = passed
                ? `Amazing work! You scored ${result.score}% on ${subject} Level ${levelNumber}.`
                : `You scored ${result.score}% on ${subject} Level ${levelNumber}. You need 60% to pass — give it another go.`;

            if (els.heroDesc) els.heroDesc.textContent = line;
            if (els.subtitle) els.subtitle.textContent = line;

            if (els.badge) {
                els.badge.textContent = `LEVEL ${levelNumber}`;
            }

        })
        .catch(error => {
            console.error("Could not resolve level number:", error);
        });

}



// ==================================================
// FALLBACK (no stored result — refresh or direct link)
// ==================================================

function renderFallback(subject, levelId) {

    const els = getElements();

    if (els.rewardRow) {
        els.rewardRow.style.display = "none";
    }

    function render(levelNumber, nextLevelNumber) {

        if (els.badge) {
            els.badge.textContent = `LEVEL ${levelNumber}`;
        }

        const line =
            `You have completed ${subject} Level ${levelNumber}.`;

        if (els.heroDesc) els.heroDesc.textContent = line;
        if (els.subtitle) els.subtitle.textContent = line;

        if (els.unlockNote) {
            els.unlockNote.style.display = "";
            els.unlockNote.textContent =
                `🔓 ${subject} Level ${nextLevelNumber} is unlocked`;
        }

    }

    render(levelId, levelId + 1);

    if (els.continueLink) {
        els.continueLink.href = `${subject.toLowerCase()}-roadmap.html`;
    }

    getLevels(subject)
        .then(levels => {

            const currentIndex =
                levels.findIndex(level => Number(level.id) === levelId);

            if (currentIndex === -1) return;

            const levelNumber = levels[currentIndex].levelNumber;

            const nextLevel = levels[currentIndex + 1];

            const nextLevelNumber =
                nextLevel ? nextLevel.levelNumber : levelNumber + 1;

            render(levelNumber, nextLevelNumber);

        })
        .catch(error => {
            console.error(
                "Could not resolve exact level number for level-complete page:",
                error
            );
        });

}



function getElements() {

    return {
        card: document.querySelector(".celebrate"),
        badge: document.getElementById("complete-level-badge"),
        title: document.querySelector(".course-hero__title"),
        celebrateTitle: document.querySelector(".celebrate__title"),
        heroDesc: document.getElementById("complete-hero-desc"),
        subtitle: document.getElementById("complete-subtitle"),
        rewardRow: document.getElementById("reward-row"),
        rewardXpText: document.getElementById("reward-xp-text"),
        rewardStreakText: document.getElementById("reward-streak-text"),
        rewardTotalXpText: document.getElementById("reward-total-xp-text"),
        unlockNote: document.getElementById("complete-unlock-note"),
        continueLink: document.getElementById("continue-learning-link")
    };

}