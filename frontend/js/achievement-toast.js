// ==================================================
// ACHIEVEMENT UNLOCK TOASTS
//
// achievements.html already shows real unlock state (see
// js/achievements.js), but the person only sees that if they go
// look. This adds the other half: the moment something actually
// gets unlocked, show it, without repeating the same toast on
// every later page load.
//
// "New" is tracked in localStorage as the set of achievement ids
// already shown ("seen"). On first ever run (nothing stored yet)
// we just record whatever's already unlocked as a baseline and
// show nothing — otherwise everyone who already has earned badges
// before this feature shipped would get flooded with toasts for
// old news the first time they load a page.
//
// Requires js/achievements.js (ACHIEVEMENTS, buildAchievementContext)
// to be loaded first. Safe to include anywhere — does nothing if
// achievements.js isn't present, or if nothing new unlocked.
// ==================================================

const ACHIEVEMENT_SEEN_KEY = "websprint.achievements.seen";


function getSeenAchievementIds() {

    try {

        const raw = localStorage.getItem(ACHIEVEMENT_SEEN_KEY);

        // null (key never set) is distinct from "[]" (explicitly
        // recorded as none earned yet) — callers need to tell them
        // apart to decide whether this is the first-ever run.
        if (raw === null) {
            return null;
        }

        return new Set(JSON.parse(raw));

    } catch (error) {
        console.error("Could not read seen achievements:", error);
        return null;
    }

}


function saveSeenAchievementIds(idSet) {

    try {
        localStorage.setItem(ACHIEVEMENT_SEEN_KEY, JSON.stringify([...idSet]));
    } catch (error) {
        console.error("Could not save seen achievements:", error);
    }

}


async function checkForNewAchievements() {

    if (typeof ACHIEVEMENTS === "undefined" || typeof buildAchievementContext !== "function") {
        // js/achievements.js isn't loaded on this page.
        return;
    }

    try {

        const ctx = await buildAchievementContext();
        const unlockedNow = ACHIEVEMENTS.filter(achievement => achievement.check(ctx));
        const unlockedIds = unlockedNow.map(achievement => achievement.id);

        const seen = getSeenAchievementIds();

        if (seen === null) {
            // First time this has ever run on this browser — set the
            // baseline quietly rather than announcing every badge the
            // person already had.
            saveSeenAchievementIds(new Set(unlockedIds));
            return;
        }

        const newlyUnlocked = unlockedNow.filter(achievement => !seen.has(achievement.id));

        if (!newlyUnlocked.length) {
            return;
        }

        saveSeenAchievementIds(new Set([...seen, ...unlockedIds]));

        // Stagger multiple unlocks so they don't all slam in at once.
        newlyUnlocked.forEach((achievement, index) => {
            setTimeout(() => showAchievementToast(achievement), index * 650);
        });

    } catch (error) {
        console.error("Could not check for new achievements:", error);
    }

}

window.WEBSPRINT_CHECK_NEW_ACHIEVEMENTS = checkForNewAchievements;


function getToastContainer() {

    let container = document.getElementById("achievement-toast-container");

    if (!container) {
        container = document.createElement("div");
        container.id = "achievement-toast-container";
        document.body.appendChild(container);
    }

    return container;

}


function showAchievementToast(achievement) {

    const container = getToastContainer();

    const toast = document.createElement("div");
    toast.className = "achievement-toast";
    toast.setAttribute("role", "status");

    toast.innerHTML = `
        <div class="achievement-toast__icon">${achievement.icon}</div>
        <div class="achievement-toast__body">
            <p class="achievement-toast__eyebrow">🏆 Achievement Unlocked</p>
            <p class="achievement-toast__title">${achievement.title}</p>
            <p class="achievement-toast__desc">${achievement.description}</p>
        </div>
        <button type="button" class="achievement-toast__close" aria-label="Dismiss">✕</button>
    `;

    container.appendChild(toast);

    // Let the element mount with its starting (off-screen) styles
    // before adding the class that animates it in.
    requestAnimationFrame(() => {
        requestAnimationFrame(() => toast.classList.add("is-visible"));
    });

    let dismissTimer = setTimeout(() => dismiss(), 6000);

    function dismiss() {
        clearTimeout(dismissTimer);
        toast.classList.remove("is-visible");
        toast.addEventListener("transitionend", () => toast.remove(), { once: true });
    }

    toast.querySelector(".achievement-toast__close").addEventListener("click", dismiss);

    toast.addEventListener("mouseenter", () => clearTimeout(dismissTimer));
    toast.addEventListener("mouseleave", () => {
        dismissTimer = setTimeout(() => dismiss(), 2000);
    });

}