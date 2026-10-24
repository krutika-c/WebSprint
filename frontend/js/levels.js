// ==================================================
// SUBJECT ROADMAP (HTML / CSS / JS)
//
// Loads the level list for the current subject and renders
// each step's lock/done state from the real backend progress
// (GET /api/progress, via js/progress.js) instead of the old
// localStorage-only tracker. Also fills in the sidebar: percent
// complete, XP earned and the next locked level.
// ==================================================

document.addEventListener(
    "DOMContentLoaded",
    loadLevels
);


async function loadLevels() {

    const container =
        document.getElementById("levels-container");

    if (!container) {
        console.error("levels-container not found");
        return;
    }

    // Get subject from roadmap page
    const subject =
        document.body.dataset.subject;

    if (!subject) {
        console.error(
            "Subject not specified in body data-subject"
        );
        return;
    }

    console.log("Roadmap subject:", subject);

    try {

        // Get levels for current subject
        const levels =
            await getLevels(subject);

        console.log(
            `${subject} Levels received:`,
            levels
        );

        // Real per-user status for every level, keyed by id.
        const progressMap =
            typeof getProgressMap === "function"
                ? await getProgressMap()
                : new Map();

        // Did GET /api/progress actually fail (vs. genuinely coming
        // back with nothing completed)? Those two cases used to be
        // indistinguishable here, which is what caused a real
        // completed Level 1 to render as "🔒 Locked" the moment the
        // fetch had a hiccup — see js/progress.js.
        const progressUnavailable =
            typeof didProgressFailToLoad === "function" &&
            didProgressFailToLoad();

        // Clear old levels
        container.innerHTML = "";

        renderProgressWarning(container, progressUnavailable);

        let completedCount = 0;
        let nextLevel = null; // first not-completed level, for the sidebar

        // Create each level
        levels.forEach((level, index) => {

            const row =
                progressMap.get(Number(level.id));

            const isFirstOfSubject =
                index === 0;

            let status;

            if (row) {

                status = row.status;

            } else if (isFirstOfSubject) {

                // Matches the backend's real default (see
                // ProgressService.getProgress): the first level of a
                // subject is always open, row or no row. This holds
                // whether there's no row because the user genuinely
                // hasn't started yet, OR because the progress fetch
                // failed — either way, Level 1 is never locked.
                status = "unlocked";

            } else if (progressUnavailable) {

                // We don't actually know this level's real status —
                // the request that would tell us failed. Rendering it
                // as "locked" would be a guess dressed up as fact, so
                // treat it as unknown instead of asserting a status we
                // can't back up.
                status = "unknown";

            } else {

                status = "locked";

            }

            const completed =
                status === "completed";

            const locked =
                status === "locked";

            const unknown =
                status === "unknown";

            if (completed) {
                completedCount++;
            } else if (!nextLevel && !unknown) {
                nextLevel = level;
            }

            const step =
                document.createElement("a");

            step.className =
                "step" +
                (completed ? " is-done" : "") +
                (locked ? " is-locked" : "") +
                (unknown ? " is-unknown" : "");


            // IMPORTANT:
            // Pass both levelId and subject
            const lessonUrl =
                `lesson.html?levelId=${level.id}&subject=${subject}`;

            if (locked) {

                // Locked steps aren't real links —
                // clicking should do nothing.

                step.href = "#";

                step.addEventListener(
                    "click",
                    event => {
                        event.preventDefault();
                    }
                );

                step.setAttribute(
                    "aria-disabled",
                    "true"
                );

            }

            else {

                // Includes the "unknown" case: since we can't confirm
                // it's locked, let the person try — lesson.html does
                // its own real check against the backend and will show
                // its own lock screen if it turns out to actually be
                // locked. Blocking it here on a guess would risk
                // hiding a level the person genuinely unlocked.
                step.href = lessonUrl;

            }

            console.log(
                "Creating step:",
                lessonUrl,
                "status:",
                status
            );


            // NOTE: built with createElement + textContent
            // (not innerHTML) so level titles/difficulty
            // text is always shown as plain text, never
            // parsed as markup.

            const numSpan =
                document.createElement("span");

            numSpan.className = "step__num";

            numSpan.textContent =
                level.levelNumber;


            const body =
                document.createElement("div");

            body.className = "step__body";

            const bodyTitle =
                document.createElement("h4");

            bodyTitle.textContent =
                level.title;

            const bodyDifficulty =
                document.createElement("p");

            bodyDifficulty.textContent =
                row && row.score != null
                    ? `${level.difficulty} · Best score ${row.score}%`
                    : level.difficulty;

            body.appendChild(bodyTitle);
            body.appendChild(bodyDifficulty);


            const statusEl =
                document.createElement("span");

            statusEl.className =
                "step__status" +
                (completed ? " is-done" : "") +
                (locked ? " is-locked" : "") +
                (unknown ? " is-unknown" : "");

            statusEl.textContent =
                locked
                    ? "🔒 Locked"
                    : completed
                        ? "✓ Done"
                        : unknown
                            ? "⚠ Unknown"
                            : "Start";


            step.appendChild(numSpan);
            step.appendChild(body);
            step.appendChild(statusEl);

            container.appendChild(step);

        });

        renderProgressSidebar(
            subject,
            levels.length,
            completedCount,
            nextLevel,
            progressUnavailable
        );

    } catch (error) {

        console.error(
            "Failed to load levels:",
            error
        );

        container.innerHTML = `
            <p>
                Unable to load ${subject} levels.
                Please try again.
            </p>
        `;
    }
}


// ==================================================
// PROGRESS WARNING BANNER
//
// Shown above the level list whenever GET /api/progress failed and
// we had to fall back to an empty result. Without this, that fallback
// is silent and the roadmap ends up looking exactly like "you lost
// all your progress" when really the request just didn't succeed.
// ==================================================

function renderProgressWarning(container, progressUnavailable) {

    if (!progressUnavailable) {
        return;
    }

    const banner =
        document.createElement("div");

    banner.setAttribute("role", "alert");

    banner.style.cssText = [
        "display:flex",
        "align-items:center",
        "justify-content:space-between",
        "gap:12px",
        "padding:12px 16px",
        "margin-bottom:16px",
        "border-radius:8px",
        "border:1px solid #a35b00",
        "background:#3a2600",
        "color:#ffd58a",
        "font-size:14px"
    ].join(";");

    const message =
        document.createElement("span");

    message.textContent =
        "Couldn't load your saved progress from the server — the list " +
        "below may not reflect what you've actually completed.";

    const retryButton =
        document.createElement("button");

    retryButton.type = "button";

    retryButton.textContent = "Retry";

    retryButton.style.cssText = [
        "flex:none",
        "padding:6px 14px",
        "border-radius:6px",
        "border:1px solid #ffd58a",
        "background:transparent",
        "color:#ffd58a",
        "cursor:pointer",
        "font:inherit"
    ].join(";");

    retryButton.addEventListener("click", () => {

        if (typeof refreshProgressAndStats === "function") {
            refreshProgressAndStats();
        }

        loadLevels();

    });

    banner.appendChild(message);
    banner.appendChild(retryButton);

    container.appendChild(banner);

}


// ==================================================
// PROGRESS SIDEBAR
//
// Percent-complete ring, XP earned (this user's real total,
// not per-subject — the backend doesn't split XP by subject)
// and the next reward (the next level not yet completed).
// ==================================================

async function renderProgressSidebar(
    subject,
    totalLevels,
    completedCount,
    nextLevel,
    progressUnavailable
) {

    const ring =
        document.getElementById("progress-ring");

    const ringPct =
        document.getElementById("progress-ring-pct");

    const ringLabel =
        document.getElementById("progress-ring-label");

    const xpEarned =
        document.getElementById("xp-earned");

    const nextReward =
        document.getElementById("next-reward");

    // If we genuinely couldn't load progress, don't paint a confident
    // "0%" / "0 of N completed" — that reads as "your progress was
    // wiped" rather than "we couldn't check". Show a neutral
    // placeholder instead.
    if (progressUnavailable) {

        if (ringPct) {
            ringPct.textContent = "—";
        }

        if (ringLabel) {
            ringLabel.textContent = "Couldn't load progress";
        }

        if (nextReward) {
            nextReward.textContent = "—";
        }

    } else {

        const percent =
            totalLevels > 0
                ? Math.round((completedCount / totalLevels) * 100)
                : 0;

        if (ring) {
            ring.style.setProperty("--val", percent);
        }

        if (ringPct) {
            ringPct.textContent = `${percent}%`;
        }

        if (ringLabel) {
            ringLabel.textContent =
                `${completedCount} of ${totalLevels} completed`;
        }

        if (nextReward) {
            nextReward.textContent =
                nextLevel
                    ? `🏆 Level ${nextLevel.levelNumber}`
                    : "🏆 All levels done!";
        }

    }

    // Goes through the shared js/progress.js cache (loadStats) instead
    // of calling getMyStats() directly, so this doesn't fire its own
    // redundant request and participates in the same failure tracking
    // as everything else on the page.
    if (xpEarned && typeof loadStats === "function") {

        try {

            const stats = await loadStats();

            const statsUnavailable =
                typeof didStatsFailToLoad === "function" &&
                didStatsFailToLoad();

            xpEarned.textContent =
                statsUnavailable
                    ? "—"
                    : `${(stats.totalXp || 0).toLocaleString()} XP`;

        } catch (error) {

            console.error(
                "Could not load XP total:",
                error
            );

            xpEarned.textContent = "—";

        }

    }

}