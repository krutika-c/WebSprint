// ==================================================
// PROGRESS / XP / STREAK — shared module
//
// Single source of truth for a page's view of the logged-in
// user's level progress (GET /api/progress) and stats
// (GET /api/me/stats). Both are cached per page load so
// multiple widgets on the same page (roadmap steps, sidebar
// ring, nav stat chips) don't each fire their own request.
//
// Requires js/api.js (getMyProgress, getMyStats) to be loaded
// first.
// ==================================================

let _progressPromise = null;
let _statsPromise = null;

// Whether the LAST attempt to load progress/stats failed. A failed fetch
// falls back to an empty list / zeroed stats so the rest of the page
// doesn't crash — but that fallback looks IDENTICAL to "you genuinely
// have zero progress" unless callers check these flags too. Rendering
// code (js/levels.js, js/dashboard.js) uses these to tell "you haven't
// completed anything yet" apart from "we couldn't reach the server",
// which otherwise both render as an all-locked, 0%, 0 XP page.
let _progressLoadFailed = false;
let _statsLoadFailed = false;


function loadProgress(force = false) {

    // Previously: once loadProgress() failed once, the failed (fallback)
    // promise was cached in _progressPromise and reused for the rest of
    // the page's life — so a transient failure never got a chance to
    // quietly retry on the next call. Retrying automatically after a
    // failure (not just when the caller explicitly passes force=true)
    // fixes that.
    if (!_progressPromise || force || _progressLoadFailed) {

        _progressPromise =
            getMyProgress()
                .then(rows => {
                    _progressLoadFailed = false;
                    return rows;
                })
                .catch(error => {

                    console.error(
                        "Could not load progress:",
                        error
                    );

                    _progressLoadFailed = true;

                    return [];

                });

    }

    return _progressPromise;

}


function loadStats(force = false) {

    if (!_statsPromise || force || _statsLoadFailed) {

        _statsPromise =
            getMyStats()
                .then(stats => {
                    _statsLoadFailed = false;
                    return stats;
                })
                .catch(error => {

                    console.error(
                        "Could not load stats:",
                        error
                    );

                    _statsLoadFailed = true;

                    return { totalXp: 0, currentStreak: 0, longestStreak: 0 };

                });

    }

    return _statsPromise;

}


// True once loadProgress() has actually resolved (success or failure) and
// the most recent attempt failed. Check this AFTER awaiting loadProgress()
// / getProgressMap() — it's meaningless before that.
function didProgressFailToLoad() {
    return _progressLoadFailed;
}


// Same idea for GET /api/me/stats.
function didStatsFailToLoad() {
    return _statsLoadFailed;
}


// Re-fetches both from the server. Call this right after a
// level attempt is submitted so the next page (or the same
// page, if it re-renders) doesn't show stale numbers.
function refreshProgressAndStats() {

    return Promise.all([
        loadProgress(true),
        loadStats(true)
    ]);

}


// levelId (number) -> LevelProgressResponse { levelId, status, score, attempts, completedAt }
async function getProgressMap() {

    const rows = await loadProgress();

    const map = new Map();

    rows.forEach(row => {
        map.set(Number(row.levelId), row);
    });

    return map;

}


async function isLevelCompleted(levelId) {

    const map = await getProgressMap();

    const row = map.get(Number(levelId));

    return !!row && row.status === "completed";

}


async function isLevelLocked(levelId) {

    const map = await getProgressMap();

    const row = map.get(Number(levelId));

    // No row at all means the backend never opened it for this
    // user (see ProgressService.getProgress) — locked, same as
    // an explicit "locked" status.
    return !row || row.status === "locked";

}


async function countCompletedLevels() {

    const map = await getProgressMap();

    let completed = 0;

    map.forEach(row => {
        if (row.status === "completed") {
            completed++;
        }
    });

    return completed;

}


// Completed-count and percentage for one subject's levels, given
// that subject's level list from getLevels(subjectCode).
async function getSubjectProgress(subjectLevels) {

    const map = await getProgressMap();

    let completed = 0;

    subjectLevels.forEach(level => {
        const row = map.get(Number(level.id));
        if (row && row.status === "completed") {
            completed++;
        }
    });

    const total = subjectLevels.length;

    const percent =
        total > 0
            ? Math.round((completed / total) * 100)
            : 0;

    return { completed, total, percent };

}


/* =====================================================
   STAT CHIP RENDERING

   Any element on the page with one of these attributes gets
   filled in automatically once stats/progress load:

     data-stat="xp"                -> "1,450 XP"
     data-stat="streak"            -> "7 Days"
     data-stat="longest-streak"    -> "12 Days"
     data-stat="levels-completed"  -> "22"

   Safe to include on every page — pages with none of these
   attributes simply do nothing.
===================================================== */

async function renderStatChips() {

    const xpEls = document.querySelectorAll('[data-stat="xp"]');
    const streakEls = document.querySelectorAll('[data-stat="streak"]');
    const longestEls = document.querySelectorAll('[data-stat="longest-streak"]');
    const completedEls = document.querySelectorAll('[data-stat="levels-completed"]');

    if (
        !xpEls.length &&
        !streakEls.length &&
        !longestEls.length &&
        !completedEls.length
    ) {
        return;
    }

    try {

        const stats = await loadStats();

        // If the fetch actually failed, `stats` here is just the zeroed
        // fallback — don't paint it into the chips as if it were the
        // person's real total. Leave whatever the chip already showed
        // (the page's static/default markup) instead of overwriting it
        // with a wrong "0".
        if (didStatsFailToLoad()) {
            return;
        }

        xpEls.forEach(el => {
            el.textContent = `${stats.totalXp.toLocaleString()} XP`;
        });

        streakEls.forEach(el => {
            el.textContent =
                `${stats.currentStreak} Day${stats.currentStreak === 1 ? "" : "s"}`;
        });

        longestEls.forEach(el => {
            el.textContent =
                `${stats.longestStreak} Day${stats.longestStreak === 1 ? "" : "s"}`;
        });

        if (completedEls.length) {

            const completed = await countCompletedLevels();

            completedEls.forEach(el => {
                el.textContent = String(completed);
            });

        }

    }

    catch (error) {

        console.error(
            "Could not render stat chips:",
            error
        );

    }

}


document.addEventListener("DOMContentLoaded", renderStatChips);