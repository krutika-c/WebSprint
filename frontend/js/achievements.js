// ==================================================
// ACHIEVEMENTS
//
// achivements.html used to hardcode 4 badges as permanently
// "unlocked" and 4 as permanently "locked" — nothing to do
// with what the signed-in user had actually done. This
// replaces that with real unlock state computed from the
// same backend data every other page already uses:
//   GET /api/progress  (via js/progress.js -> getSubjectProgress /
//                        countCompletedLevels)
//   GET /api/me/stats  (via js/progress.js -> loadStats)
//
// Requires js/api.js and js/progress.js to be loaded first.
// ==================================================

// Every achievement the level/XP/streak data can actually prove.
// `check(ctx)` returns true once it's genuinely earned; `progress(ctx)`
// is an optional short "x / y" style hint shown under the description
// while it's still locked.
const ACHIEVEMENTS = [
    {
        id: "first-lesson",
        icon: "🥇",
        title: "First Lesson",
        description: "Complete your first lesson",
        check: ctx => ctx.completedLevels >= 1
    },
    {
        id: "html-explorer",
        icon: "📘",
        title: "HTML Explorer",
        description: "Complete 5 HTML levels",
        check: ctx => ctx.subjects.HTML.completed >= 5,
        progress: ctx => `${Math.min(ctx.subjects.HTML.completed, 5)} / 5`
    },
    {
        id: "css-stylist",
        icon: "🎨",
        title: "CSS Stylist",
        description: "Complete 5 CSS levels",
        check: ctx => ctx.subjects.CSS.completed >= 5,
        progress: ctx => `${Math.min(ctx.subjects.CSS.completed, 5)} / 5`
    },
    {
        id: "js-beginner",
        icon: "⚙️",
        title: "JS Beginner",
        description: "Complete 5 JS levels",
        check: ctx => ctx.subjects.JS.completed >= 5,
        progress: ctx => `${Math.min(ctx.subjects.JS.completed, 5)} / 5`
    },
    {
        id: "full-stack-hero",
        icon: "🦸",
        title: "Full Stack Hero",
        description: "Complete all courses",
        check: ctx => ["HTML", "CSS", "JS"].every(code => {
            const s = ctx.subjects[code];
            return s.total > 0 && s.completed === s.total;
        })
    },
    {
        id: "xp-club",
        icon: "💯",
        title: "1000 XP Club",
        description: "Earn 1000 XP",
        check: ctx => ctx.stats.totalXp >= 1000,
        progress: ctx => `${Math.min(ctx.stats.totalXp, 1000)} / 1000 XP`
    },
    {
        id: "consistency-king",
        icon: "🔥",
        title: "Consistency King",
        description: "Maintain a 7-day streak",
        // Longest streak, not current — once earned it should stay
        // earned even after the user's active streak later resets.
        check: ctx => ctx.stats.longestStreak >= 7,
        progress: ctx => `${Math.min(ctx.stats.longestStreak, 7)} / 7 days`
    },
    {
        id: "project-master",
        icon: "🏗️",
        title: "Project Master",
        description: "Complete 3 projects",
        // There's no "projects" feature in WebSprint yet (only
        // lesson/level quizzes) — nothing to check against, so this
        // stays locked until that's built. Not faked as unlockable.
        check: () => false
    }
];


async function buildAchievementContext() {

    const [stats, completedLevels, htmlLevels, cssLevels, jsLevels] =
        await Promise.all([
            loadStats(),
            countCompletedLevels(),
            getLevels("HTML").catch(() => []),
            getLevels("CSS").catch(() => []),
            getLevels("JS").catch(() => [])
        ]);

    const [htmlProgress, cssProgress, jsProgress] = await Promise.all([
        getSubjectProgress(htmlLevels),
        getSubjectProgress(cssLevels),
        getSubjectProgress(jsLevels)
    ]);

    return {
        stats,
        completedLevels,
        subjects: {
            HTML: htmlProgress,
            CSS: cssProgress,
            JS: jsProgress
        }
    };

}


function renderAchievementCard(achievement, unlocked, ctx) {

    const card = document.createElement("div");
    card.className = `card ach ${unlocked ? "is-unlocked" : "is-locked"}`;
    card.dataset.state = unlocked ? "unlocked" : "locked";

    const icon = document.createElement("div");
    icon.className = "ach__icon";
    icon.textContent = unlocked ? achievement.icon : "🔒";
    card.appendChild(icon);

    const title = document.createElement("h4");
    title.textContent = achievement.title;
    card.appendChild(title);

    const desc = document.createElement("p");
    desc.textContent = achievement.description;
    card.appendChild(desc);

    if (!unlocked && typeof achievement.progress === "function") {
        const progressEl = document.createElement("p");
        progressEl.className = "ach__progress";
        progressEl.textContent = achievement.progress(ctx);
        card.appendChild(progressEl);
    }

    return card;

}


async function loadAchievements() {

    const grid = document.querySelector(".ach-grid");
    if (!grid) {
        return;
    }

    try {

        const ctx = await buildAchievementContext();

        grid.innerHTML = "";

        ACHIEVEMENTS.forEach(achievement => {
            const unlocked = achievement.check(ctx);
            grid.appendChild(renderAchievementCard(achievement, unlocked, ctx));
        });

    } catch (error) {

        console.error("Could not load achievements:", error);

        // Leave whatever was already in the grid rather than showing
        // every badge as locked, which would look like "you've lost
        // your progress" rather than "we couldn't reach the server".

    }

}


document.addEventListener("DOMContentLoaded", loadAchievements);
