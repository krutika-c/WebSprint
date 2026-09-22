// ==================================================
// DASHBOARD
//
// The stat grid (levels completed / XP / longest streak /
// current streak) and the per-course progress bars used to be
// hardcoded markup. This fills them from the real backend:
// GET /api/me/stats for the top stats, GET /api/subjects/{code}/levels
// + GET /api/progress for each course's completion.
// ==================================================

document.addEventListener("DOMContentLoaded", loadDashboard);


async function loadDashboard() {

    await Promise.all([
        loadStatGrid(),
        loadCourseCards()
    ]);

}


async function loadStatGrid() {

    const xpEl = document.getElementById("dash-xp");
    const streakEl = document.getElementById("dash-streak");
    const longestEl = document.getElementById("dash-longest-streak");
    const completedEl = document.getElementById("dash-levels-completed");

    try {

        const [stats, completed] = await Promise.all([
            getMyStats(),
            countCompletedLevels()
        ]);

        if (xpEl) {
            xpEl.textContent = (stats.totalXp || 0).toLocaleString();
        }

        if (streakEl) {
            const days = stats.currentStreak || 0;
            streakEl.textContent = `${days} Day${days === 1 ? "" : "s"}`;
        }

        if (longestEl) {
            const days = stats.longestStreak || 0;
            longestEl.textContent = `${days} Day${days === 1 ? "" : "s"}`;
        }

        if (completedEl) {
            completedEl.textContent = String(completed);
        }

    } catch (error) {

        console.error("Could not load dashboard stats:", error);

        // Previously this left the "0" placeholders already baked
        // into dashboard.html untouched on error — which looks the
        // same as "you really do have 0 XP / 0 day streak" rather
        // than "we couldn't reach the server". Mark each stat with a
        // neutral placeholder instead so a failed request is visibly
        // different from a genuinely fresh account.
        [xpEl, streakEl, longestEl, completedEl].forEach(el => {
            if (el) {
                el.textContent = "—";
                el.title = "Couldn't load this — try refreshing the page.";
            }
        });

    }

}


async function loadCourseCards() {

    const cards =
        document.querySelectorAll("#course-grid .course-card[data-subject]");

    for (const card of cards) {

        const subject = card.dataset.subject;

        const lessonsEl = card.querySelector("[data-course-lessons]");
        const fillEl = card.querySelector("[data-course-fill]");
        const pctEl = card.querySelector("[data-course-pct]");
        const stateEl = card.querySelector("[data-course-state]");

        try {

            const levels = await getLevels(subject);
            const { completed, total, percent } = await getSubjectProgress(levels);

            // getSubjectProgress() reads from the same shared cache as
            // the roadmap pages (js/progress.js) — if that fetch
            // failed, `completed`/`percent` here are just the zeroed
            // fallback, not a real "0 of N". Show that honestly rather
            // than a confident (and possibly wrong) "Not started".
            const progressUnavailable =
                typeof didProgressFailToLoad === "function" &&
                didProgressFailToLoad();

            if (progressUnavailable) {

                if (lessonsEl) {
                    lessonsEl.textContent = `— / ${total} Lessons`;
                }

                if (pctEl) {
                    pctEl.textContent = "—";
                }

                if (stateEl) {
                    stateEl.textContent = "Couldn't load progress";
                }

                continue;

            }

            if (lessonsEl) {
                lessonsEl.textContent = `${completed} / ${total} Lessons`;
            }

            if (fillEl) {
                fillEl.style.width = `${percent}%`;
            }

            if (pctEl) {
                pctEl.textContent = `${percent}%`;
            }

            if (stateEl) {
                stateEl.textContent =
                    total > 0 && completed === total
                        ? "Complete"
                        : completed > 0
                            ? "In progress"
                            : "Not started";
            }

        } catch (error) {

            console.error(
                `Could not load progress for ${subject}:`,
                error
            );

            if (lessonsEl) {
                lessonsEl.textContent = "Couldn't load";
            }

            if (stateEl) {
                stateEl.textContent = "Couldn't load progress";
            }

        }

    }

}