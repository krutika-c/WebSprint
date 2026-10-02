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
        loadUsername(),
        loadStatGrid(),
        loadCourseCards(),
        loadRecentAchievement()
    ]);

    // Catches unlocks that don't happen mid-quiz. Note the streak only
    // moves when a level attempt is submitted (not on login), and the
    // backend reports the current streak as 0 once a day was missed.
    if (typeof window.WEBSPRINT_CHECK_NEW_ACHIEVEMENTS === "function") {
        window.WEBSPRINT_CHECK_NEW_ACHIEVEMENTS();
    }

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
            streakEl.title = days === 0
                ? "Complete a level attempt today to start a streak."
                : "Keep it going — attempt a level every day.";
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


// ==================================================
// WELCOME NAME — real username from GET /api/users/me
// (read-only; falls back to the greeting's default text on error)
// ==================================================
async function loadUsername() {

    const el = document.getElementById("dash-username");
    if (!el) {
        return;
    }

    try {
        const profile = await apiFetch("/api/users/me");
        const name = profile.username || profile.fullName;
        if (name) {
            el.textContent = name;
        }
    } catch (error) {
        console.error("Could not load username:", error);
    }

}


// ==================================================
// RECENT ACHIEVEMENT — the earned achievement with the most
// recent unlock time, with a real relative time ("2h ago").
//
// Unlock times are derived from level completedAt timestamps
// (GET /api/progress): e.g. "HTML Explorer" unlocked when the
// 5th HTML level was completed. XP/streak achievements have no
// stored timestamp, so they're shown without a time.
// ==================================================
function formatTimeAgo(date) {

    const seconds = Math.max(0, Math.floor((Date.now() - date.getTime()) / 1000));

    if (seconds < 60) return "just now";

    const minutes = Math.floor(seconds / 60);
    if (minutes < 60) return `${minutes}m ago`;

    const hours = Math.floor(minutes / 60);
    if (hours < 24) return `${hours}h ago`;

    const days = Math.floor(hours / 24);
    if (days < 30) return `${days}d ago`;

    const months = Math.floor(days / 30);
    if (months < 12) return `${months}mo ago`;

    return `${Math.floor(days / 365)}y ago`;

}


async function loadRecentAchievement() {

    const iconEl = document.getElementById("recent-ach-icon");
    const titleEl = document.getElementById("recent-ach-title");
    const descEl = document.getElementById("recent-ach-desc");

    if (!titleEl || typeof ACHIEVEMENTS === "undefined" ||
        typeof buildAchievementContext !== "function") {
        return;
    }

    try {

        const [ctx, progressMap, htmlLevels, cssLevels, jsLevels] =
            await Promise.all([
                buildAchievementContext(),
                getProgressMap(),
                getLevels("HTML").catch(() => []),
                getLevels("CSS").catch(() => []),
                getLevels("JS").catch(() => [])
            ]);

        // Sorted completion times (ms) for a list of levels.
        const completionTimes = levels =>
            levels
                .map(l => progressMap.get(Number(l.id)))
                .filter(r => r && r.status === "completed" && r.completedAt)
                .map(r => new Date(r.completedAt).getTime())
                .sort((a, b) => a - b);

        const html = completionTimes(htmlLevels);
        const css = completionTimes(cssLevels);
        const js = completionTimes(jsLevels);
        const all = [...html, ...css, ...js].sort((a, b) => a - b);

        const nth = (arr, n) => (arr.length >= n ? arr[n - 1] : null);

        const unlockTimes = {
            "first-lesson": nth(all, 1),
            "html-explorer": nth(html, 5),
            "css-stylist": nth(css, 5),
            "js-beginner": nth(js, 5),
            "full-stack-hero": (htmlLevels.length && cssLevels.length && jsLevels.length)
                ? Math.max(
                    nth(html, htmlLevels.length) || 0,
                    nth(css, cssLevels.length) || 0,
                    nth(js, jsLevels.length) || 0
                  ) || null
                : null
        };

        const earned = ACHIEVEMENTS.filter(a => a.check(ctx));

        if (earned.length === 0) {
            if (iconEl) iconEl.textContent = "🔒";
            titleEl.textContent = "No achievements yet";
            if (descEl) descEl.textContent = "Complete a level to earn your first badge";
            return;
        }

        // Latest known unlock time wins; achievements with no
        // timestamp only get picked if nothing has one.
        let best = null;
        earned.forEach(a => {
            const t = unlockTimes[a.id] || null;
            if (!best || (t || 0) > (best.t || 0)) {
                best = { a, t };
            }
        });

        if (iconEl) iconEl.textContent = best.a.icon;
        titleEl.textContent = best.a.title;
        if (descEl) {
            descEl.textContent = best.t
                ? `${best.a.description} · ${formatTimeAgo(new Date(best.t))}`
                : best.a.description;
        }

    } catch (error) {

        console.error("Could not load recent achievement:", error);

        if (titleEl) titleEl.textContent = "Couldn't load achievements";
        if (descEl) descEl.textContent = "Try refreshing the page.";

    }

}