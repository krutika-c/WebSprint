// Each level already carries a real `difficulty` ("Beginner" /
// "Intermediate" / "Advanced") from the backend — the roadmap pages
// show it per-step already. This picks the difficulty of whichever
// level the user hasn't completed yet (i.e. what they're currently
// on), so the Topics card badge reflects that instead of always
// saying "Beginner". Once every level in the subject is completed,
// it falls back to the highest level's difficulty.
async function getCurrentTier(subjectLevels) {

    if (!subjectLevels.length) {
        return "Beginner";
    }

    const sorted = [...subjectLevels].sort((a, b) => a.levelNumber - b.levelNumber);
    const map = await getProgressMap();

    const nextLevel = sorted.find(level => {
        const row = map.get(Number(level.id));
        return !row || row.status !== "completed";
    });

    if (nextLevel) {
        return nextLevel.difficulty || "Beginner";
    }

    // Every level in the subject is completed — show the top tier
    // rather than reverting to "Beginner".
    return sorted[sorted.length - 1].difficulty || "Beginner";

}


async function loadSubjects() {

    const container = document.getElementById("subjects-container");

    if (!container) {
        console.error("subjects-container not found");
        return;
    }

    try {

        const subjects = await apiFetch("/api/subjects");

        console.log("Subjects received:", subjects);

        container.innerHTML = "";

        for (const subject of subjects) {

            let className = "";
            let icon = "";
            let description = "";
            let buttonClass = "";
            let page = "";

            if (subject.code === "HTML") {

                className = "is-html";
                icon = "&lt;/&gt;";
                description =
                    "Learn the structure of the web and build the foundation of every website.";
                buttonClass = "btn--html";
                page = "html-roadmap.html";

            } else if (subject.code === "CSS") {

                className = "is-css";
                icon = "#";
                description =
                    "Style your webpages with colors, fonts and make them beautiful.";
                buttonClass = "btn--css";
                page = "css-roadmap.html";

            } else if (subject.code === "JS") {

                className = "is-js";
                icon = "JS";
                description =
                    "Add interactivity and bring your websites to life with JavaScript.";
                buttonClass = "btn--js";
                page = "js-roadmap.html";
            }

            // Real per-subject completion, if the progress module and
            // an active session are available — falls back to 0% for
            // a logged-out visitor or if either call fails.
            let percent = 0;
            let tier = "Beginner";

            try {

                if (typeof getLevels === "function" && typeof getSubjectProgress === "function") {
                    const subjectLevels = await getLevels(subject.code);
                    const subjectProgress = await getSubjectProgress(subjectLevels);
                    percent = subjectProgress.percent;
                    tier = await getCurrentTier(subjectLevels);
                }

            } catch (error) {
                console.error(`Could not load progress for ${subject.code}:`, error);
            }

            const tierIcon =
                tier === "Advanced" ? "🔥" :
                tier === "Intermediate" ? "🚀" :
                "⚡";

            const card = document.createElement("div");

            card.className = `card topic-card ${className}`;

            card.innerHTML = `
                <div class="topic-icon ${className}">
                    ${icon}
                </div>

                <h3>${subject.name}</h3>

                <p>${description}</p>

                <span class="badge badge--beginner">
                    ${tierIcon} ${tier}
                </span>

                <div class="progress">
                    <div class="progress__fill" style="width: ${percent}%"></div>
                </div>

                <div class="progress__meta">
                    <span>Progress</span>
                    <span>${percent}%</span>
                </div>

                <a href="${page}"
                   class="btn ${buttonClass} btn--block">
                    Start Learning →
                </a>
            `;

            container.appendChild(card);
        }

    } catch (error) {

        console.error("Failed to load subjects:", error);

        container.innerHTML = `
            <p>Unable to load subjects. Please try again.</p>
        `;
    }
}

document.addEventListener("DOMContentLoaded", loadSubjects);