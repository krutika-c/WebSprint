// ==================================================
// PROFILE SETTINGS
//
// Loads the logged-in user's profile (display name and
// username), lets them edit either one via an explicit
// edit toggle, checks username availability as they type,
// saves changes back to the backend, and lets them pick
// a preset avatar (stored locally — there's no image
// upload backend for this yet).
// ==================================================

document.addEventListener("DOMContentLoaded", () => {
    initProfileSettings();
    initAvatarPicker();
    initPasswordChange();
    loadProfileStats();
});


// ==================================================
// STATS PANEL (Total XP / Lessons Completed / Streaks)
//
// Independent of initProfileSettings above — runs even if this
// page doesn't have the username/name editing markup, and vice
// versa a login failure there shouldn't blank out stats that
// did load successfully.
// ==================================================

async function loadProfileStats() {

    const xpEl = document.getElementById("profile-stat-xp");
    const lessonsEl = document.getElementById("profile-stat-lessons");
    const badgesEl = document.getElementById("profile-stat-badges");
    const streakEl = document.getElementById("profile-stat-streak");
    const longestEl = document.getElementById("profile-stat-longest-streak");
    const headXpEl = document.getElementById("profile-head-xp");

    if (!xpEl && !lessonsEl && !badgesEl && !streakEl && !longestEl && !headXpEl) {
        // Not on a page with this markup — nothing to do.
        return;
    }

    try {

        const [stats, completed, badgesEarned] = await Promise.all([
            getMyStats(),
            countCompletedLevels(),
            typeof window.WEBSPRINT_COUNT_EARNED_ACHIEVEMENTS === "function"
                ? window.WEBSPRINT_COUNT_EARNED_ACHIEVEMENTS().catch(() => null)
                : Promise.resolve(null)
        ]);

        if (xpEl) {
            xpEl.textContent = `${(stats.totalXp || 0).toLocaleString()} XP`;
        }

        // Small line under the name/avatar in the Profile tab header.
        // There's no separate "account level" in the backend, so this
        // shows the person's real XP total rather than a made-up number.
        if (headXpEl) {
            headXpEl.textContent = `${(stats.totalXp || 0).toLocaleString()} XP`;
        }

        if (lessonsEl) {
            lessonsEl.textContent = String(completed);
        }

        // Only overwrite the "0" placeholder once we actually have a
        // real count — js/achievements.js failing to load (or its
        // own fetches failing) shouldn't make this look like 0 badges.
        if (badgesEl && badgesEarned !== null) {
            badgesEl.textContent = String(badgesEarned);
        }

        if (streakEl) {
            const days = stats.currentStreak || 0;
            streakEl.textContent = `${days} Day${days === 1 ? "" : "s"}`;
        }

        if (longestEl) {
            const days = stats.longestStreak || 0;
            longestEl.textContent = `${days} Day${days === 1 ? "" : "s"}`;
        }

    } catch (error) {

        console.error("Could not load profile stats:", error);

    }

}


let originalUsername = "";
let originalFullName = "";

let availabilityCheckToken = 0;

const AVATAR_STORAGE_KEY = "websprint.avatar";
const INITIALS_STORAGE_KEY = "websprint.initials";

// Preset avatars live in js/avatar-sync.js (loaded before this file
// on every page) so every page — not just this one — agrees on what
// each preset id looks like. Falls back to a single default if that
// script somehow isn't loaded.
const AVATAR_PRESETS = window.WEBSPRINT_AVATAR_PRESETS || [
    { id: "default", bg: "linear-gradient(135deg, #8bffb0, #264de4)" }
];


async function initProfileSettings() {

    const usernameInput = document.getElementById("username");
    const nameInput = document.getElementById("name");
    const emailInput = document.getElementById("email");
    const saveButton = document.getElementById("save-username");
    const editNameBtn = document.getElementById("edit-name");
    const editUsernameBtn = document.getElementById("edit-username");

    if (!usernameInput || !saveButton) {
        // Not on a page with this markup — nothing to do.
        return;
    }

    // ---------------------------------------
    // LOAD CURRENT PROFILE
    // ---------------------------------------

    try {

        const profile = await apiFetch("/api/users/me");

        originalUsername = profile.username || "";
        usernameInput.value = originalUsername;

        originalFullName = profile.fullName || "";
        if (nameInput && profile.fullName) {
            nameInput.value = profile.fullName;
        }

        if (emailInput && profile.email) {
            emailInput.value = profile.email;
        }

        const joinedInput = document.getElementById("joined");
        const joinedFormatted = formatJoinedDate(profile.createdAt);
        if (joinedInput) {
            joinedInput.value = joinedFormatted;
        }

        syncIdentityDisplay();
        syncProfileViewTab(profile);

        // Password change only makes sense for accounts that have a
        // WebSprint password in the first place (not Google sign-ins).
        if (profile.hasPassword === false) {
            hidePasswordSection();
        }

    } catch (error) {

        console.error("Could not load profile:", error);

        setHint(
            "username-status",
            "Log in to set up your username.",
            "is-taken"
        );

        usernameInput.disabled = true;
        if (nameInput) nameInput.disabled = true;
        if (editNameBtn) editNameBtn.disabled = true;
        if (editUsernameBtn) editUsernameBtn.disabled = true;

        saveButton.disabled = true;

        return;
    }

    // ---------------------------------------
    // EDIT TOGGLES — fields start locked; the
    // pencil button unlocks the one it's next to.
    // ---------------------------------------

    if (editNameBtn && nameInput) {
        editNameBtn.addEventListener("click", () => {
            unlockField(nameInput, editNameBtn);
        });
    }

    if (editUsernameBtn) {
        editUsernameBtn.addEventListener("click", () => {
            unlockField(usernameInput, editUsernameBtn);
        });
    }

    // ---------------------------------------
    // LIVE FEEDBACK WHILE EDITING
    // ---------------------------------------

    usernameInput.addEventListener(
        "input",
        debounce(() => {
            checkAvailability(usernameInput.value);
        }, 400)
    );

    if (nameInput) {
        nameInput.addEventListener("input", () => {
            const value = nameInput.value.trim();
            if (value === originalFullName) {
                setHint("name-status", "", "");
            } else if (value.length === 0) {
                setHint("name-status", "Display name can't be empty.", "is-taken");
            } else if (value.length > 50) {
                setHint("name-status", "50 characters max.", "is-taken");
            } else {
                setHint("name-status", "", "");
            }
        });
    }

    // ---------------------------------------
    // SAVE (both name and username, whichever changed)
    // ---------------------------------------

    saveButton.addEventListener("click", async (event) => {

        event.preventDefault();

        await saveProfile(nameInput ? nameInput.value : null, usernameInput.value);

    });

}


function unlockField(input, editButton) {

    input.disabled = false;
    input.focus();
    input.select();

    editButton.classList.add("is-active");
    editButton.setAttribute("aria-label", editButton.getAttribute("aria-label") + " (editing)");

}


// ==================================================
// AVAILABILITY CHECK
// ==================================================

async function checkAvailability(rawValue) {

    const value = (rawValue || "").trim().toLowerCase();

    // Own current username — nothing to check, nothing to warn about.
    if (value === originalUsername) {
        setHint("username-status", "", "");
        return;
    }

    if (value.length === 0) {
        setHint("username-status", "", "");
        return;
    }

    if (!/^[a-z0-9_]{3,20}$/.test(value)) {
        setHint(
            "username-status",
            "3-20 characters: lowercase letters, numbers, underscores.",
            "is-taken"
        );
        return;
    }

    setHint("username-status", "Checking availability...", "is-checking");

    // Guard against out-of-order responses if the person keeps typing.
    const thisCheck = ++availabilityCheckToken;

    try {

        const result = await apiFetch(
            `/api/users/username-availability?username=${encodeURIComponent(value)}`
        );

        if (thisCheck !== availabilityCheckToken) {
            // A newer keystroke already started another check.
            return;
        }

        if (result.available) {
            setHint("username-status", "Username is available.", "is-available");
        } else {
            setHint(
                "username-status",
                result.reason || "That username is already taken.",
                "is-taken"
            );
        }

    } catch (error) {

        console.error("Availability check failed:", error);

        if (thisCheck === availabilityCheckToken) {
            setHint(
                "username-status",
                "Couldn't check availability right now.",
                "is-taken"
            );
        }

    }

}


// ==================================================
// SAVE PROFILE (display name + username)
// ==================================================

async function saveProfile(rawName, rawUsername) {

    const name = rawName === null ? null : rawName.trim();
    const username = (rawUsername || "").trim().toLowerCase();

    const nameChanged = name !== null && name !== originalFullName;
    const usernameChanged = username !== originalUsername;

    if (!nameChanged && !usernameChanged) {
        setHint("save-status", "No changes to save.", "is-checking", 3000);
        return;
    }

    if (nameChanged && name.length === 0) {
        setHint("save-status", "Display name can't be empty.", "is-taken");
        return;
    }

    if (nameChanged && name.length > 50) {
        setHint("save-status", "Display name must be 50 characters or fewer.", "is-taken");
        return;
    }

    if (usernameChanged && !/^[a-z0-9_]{3,20}$/.test(username)) {
        setHint(
            "save-status",
            "Choose a valid username first (3-20 chars, lowercase/numbers/underscores).",
            "is-taken"
        );
        return;
    }

    setHint("save-status", "Saving...", "is-checking");

    try {

        if (nameChanged) {
            const updated = await apiFetch("/api/users/name", {
                method: "PUT",
                body: JSON.stringify({ fullName: name })
            });
            originalFullName = updated.fullName;
        }

        if (usernameChanged) {
            const updated = await apiFetch("/api/users/username", {
                method: "PUT",
                body: JSON.stringify({ username: username })
            });
            originalUsername = updated.username;
        }

        setHint("save-status", "Changes saved.", "is-available", 4000);
        setHint("username-status", "", "");
        setHint("name-status", "", "");

        syncIdentityDisplay();

        relockFields();

    } catch (error) {

        console.error("Could not save profile:", error);

        setHint(
            "save-status",
            "Couldn't save your changes — the username may already be taken.",
            "is-taken",
            6000
        );

    }

}


function relockFields() {

    [
        { input: "name", button: "edit-name" },
        { input: "username", button: "edit-username" }
    ].forEach(({ input, button }) => {

        const inputEl = document.getElementById(input);
        const buttonEl = document.getElementById(button);

        if (inputEl) inputEl.disabled = true;

        if (buttonEl) {
            buttonEl.classList.remove("is-active");
            buttonEl.setAttribute("aria-label", buttonEl.getAttribute("aria-label").replace(" (editing)", ""));
        }

    });

}


// ==================================================
// AVATAR PICKER (preset colors/emoji — no upload backend yet)
// ==================================================

function initAvatarPicker() {

    const changeBtn = document.getElementById("change-avatar-btn");
    const picker = document.getElementById("avatar-picker");
    const grid = document.getElementById("avatar-picker-grid");

    if (!changeBtn || !picker || !grid) {
        return;
    }

    // Build the swatch grid once.
    AVATAR_PRESETS.forEach((preset) => {

        const swatch = document.createElement("button");
        swatch.type = "button";
        swatch.className = "avatar-option";
        swatch.setAttribute("aria-label", preset.id === "default" ? "Default avatar" : `${preset.id} avatar`);
        swatch.dataset.avatarId = preset.id;
        window.WEBSPRINT_APPLY_PRESET_VISUAL(swatch, preset, "");

        swatch.addEventListener("click", () => {
            selectAvatar(preset.id);
            closeAvatarPicker();
        });

        grid.appendChild(swatch);

    });

    let lastFocusedBeforeOpen = null;

    changeBtn.addEventListener("click", (event) => {
        event.stopPropagation();
        const isOpen = !picker.hidden;
        if (isOpen) {
            closeAvatarPicker();
        } else {
            openAvatarPicker();
        }
    });

    document.addEventListener("click", (event) => {
        if (!picker.hidden && !picker.contains(event.target) && event.target !== changeBtn) {
            closeAvatarPicker();
        }
    });

    // Esc closes it, and Tab is trapped to the swatch grid while it's
    // open — there's nothing else in the popover to tab through.
    document.addEventListener("keydown", (event) => {

        if (picker.hidden) {
            return;
        }

        if (event.key === "Escape") {
            event.preventDefault();
            closeAvatarPicker();
            return;
        }

        if (event.key === "Tab") {
            const swatches = getSwatches();
            if (swatches.length === 0) {
                return;
            }
            const first = swatches[0];
            const last = swatches[swatches.length - 1];
            if (event.shiftKey && document.activeElement === first) {
                event.preventDefault();
                last.focus();
            } else if (!event.shiftKey && document.activeElement === last) {
                event.preventDefault();
                first.focus();
            }
        }

    });

    function getSwatches() {
        return Array.from(grid.querySelectorAll(".avatar-option"));
    }

    function openAvatarPicker() {
        picker.hidden = false;
        changeBtn.setAttribute("aria-expanded", "true");
        markSelectedSwatch();

        // Move focus into the popover — land on the currently selected
        // swatch so keyboard users start from where they are now.
        lastFocusedBeforeOpen = document.activeElement;
        const swatches = getSwatches();
        const toFocus = swatches.find((el) => el.classList.contains("is-selected")) || swatches[0];
        if (toFocus) {
            toFocus.focus();
        }
    }

    function closeAvatarPicker() {
        picker.hidden = true;
        changeBtn.setAttribute("aria-expanded", "false");

        // Give focus back to wherever it was (normally the button that
        // opened this), so closing never strands keyboard focus.
        if (lastFocusedBeforeOpen && typeof lastFocusedBeforeOpen.focus === "function") {
            lastFocusedBeforeOpen.focus();
        }
        lastFocusedBeforeOpen = null;
    }

    function markSelectedSwatch() {
        const current = getSavedAvatarId();
        grid.querySelectorAll(".avatar-option").forEach((el) => {
            el.classList.toggle("is-selected", el.dataset.avatarId === current);
        });
    }

    // Apply whatever was picked last time, on load.
    applyAvatar(getSavedAvatarId());

}


function getSavedAvatarId() {
    return localStorage.getItem(AVATAR_STORAGE_KEY) || "default";
}


function selectAvatar(avatarId) {
    localStorage.setItem(AVATAR_STORAGE_KEY, avatarId);
    applyAvatar(avatarId);
}


function applyAvatar(avatarId) {

    const preset = AVATAR_PRESETS.find((p) => p.id === avatarId) || AVATAR_PRESETS[0];
    const initials = getInitials();

    // Cache the initials so every other page (which only loads the
    // lightweight avatar-sync.js, not this whole file) can render the
    // right fallback text when no glyph is set for the chosen preset.
    localStorage.setItem(INITIALS_STORAGE_KEY, initials);

    const bigAvatar = document.getElementById("profile-avatar-big");
    window.WEBSPRINT_APPLY_PRESET_VISUAL(bigAvatar, preset, initials);

    // Read-only avatar shown on the Profile tab — same preset, just a
    // second element to keep in sync since the two tabs don't share DOM.
    const viewAvatar = document.getElementById("profile-avatar-view");
    window.WEBSPRINT_APPLY_PRESET_VISUAL(viewAvatar, preset, initials);

    // The nav avatar on THIS page is just another ".profile-avatar--nav"
    // element, so let the shared function (from avatar-sync.js) handle
    // it the same way it does on every other page.
    if (typeof window.WEBSPRINT_APPLY_NAV_AVATAR === "function") {
        window.WEBSPRINT_APPLY_NAV_AVATAR();
    }

}


// ==================================================
// HEADER / NAV DISPLAY SYNC
// ==================================================

function syncIdentityDisplay() {

    const displayNameEl = document.getElementById("profile-display-name");
    const label = originalFullName || originalUsername || "Learner";

    if (displayNameEl) {
        displayNameEl.textContent = label;
    }

    // Re-apply the current avatar so its initials (if no emoji is set)
    // reflect the latest name.
    applyAvatar(getSavedAvatarId());

}


// ==================================================
// PROFILE TAB (read-only overview)
//
// The Profile tab just displays what's already been loaded —
// nothing here is editable, so it's populated once and never
// needs its own save/validation logic.
// ==================================================

function syncProfileViewTab(profile) {

    const usernameEl = document.getElementById("view-username");
    const emailEl = document.getElementById("view-email");

    if (usernameEl) {
        usernameEl.textContent = profile.username ? `@${profile.username}` : "—";
    }

    if (emailEl) {
        emailEl.textContent = profile.email || "—";
    }

    const joinedEl = document.getElementById("view-joined");
    if (joinedEl) {
        joinedEl.textContent = formatJoinedDate(profile.createdAt) || "—";
    }

}


// Turns the ISO timestamp the backend sends (e.g. "2024-05-12T09:30:00Z")
// into the friendly "May 12, 2024" format the settings page shows. Real
// account-creation data — no more hardcoded placeholder date.
function formatJoinedDate(isoString) {

    if (!isoString) {
        return "";
    }

    const date = new Date(isoString);

    if (Number.isNaN(date.getTime())) {
        return "";
    }

    return date.toLocaleDateString("en-US", {
        month: "long",
        day: "numeric",
        year: "numeric"
    });

}


function getInitials() {

    const source = originalFullName || originalUsername || "Learner";

    const parts = source.trim().split(/\s+/).filter(Boolean);

    if (parts.length === 0) {
        return "?";
    }

    if (parts.length === 1) {
        return parts[0].slice(0, 2).toUpperCase();
    }

    return (parts[0][0] + parts[1][0]).toUpperCase();

}


// ==================================================
// CHANGE PASSWORD (Account tab)
// ==================================================

function hidePasswordSection() {

    const section = document.getElementById("password-section");
    const hint = document.getElementById("no-password-hint");

    if (!section) {
        return;
    }

    ["f-current-password", "f-new-password", "f-confirm-new-password"].forEach((id) => {
        const field = document.getElementById(id);
        if (field) field.hidden = true;
    });

    const changeBtn = document.getElementById("change-password-btn");
    const status = document.getElementById("password-status");
    if (changeBtn) changeBtn.hidden = true;
    if (status) status.hidden = true;

    if (hint) hint.hidden = false;

}


function initPasswordChange() {

    const currentInput = document.getElementById("current-password");
    const newInput = document.getElementById("new-password");
    const confirmInput = document.getElementById("confirm-new-password");
    const changeBtn = document.getElementById("change-password-btn");

    if (!currentInput || !newInput || !confirmInput || !changeBtn) {
        return;
    }

    changeBtn.addEventListener("click", async (event) => {

        event.preventDefault();

        const currentPassword = currentInput.value;
        const newPassword = newInput.value;
        const confirmPassword = confirmInput.value;

        if (!currentPassword) {
            setHint("password-status", "Enter your current password.", "is-taken");
            return;
        }

        if (newPassword.length < 8) {
            setHint("password-status", "New password must be at least 8 characters.", "is-taken");
            return;
        }

        if (newPassword !== confirmPassword) {
            setHint("password-status", "New passwords don't match.", "is-taken");
            return;
        }

        if (newPassword === currentPassword) {
            setHint("password-status", "New password must be different from your current password.", "is-taken");
            return;
        }

        setHint("password-status", "Updating...", "is-checking");
        changeBtn.disabled = true;

        try {

            await apiFetch("/api/users/password", {
                method: "PUT",
                body: JSON.stringify({
                    currentPassword: currentPassword,
                    newPassword: newPassword
                })
            });

            setHint("password-status", "Password updated.", "is-available", 4000);

            currentInput.value = "";
            newInput.value = "";
            confirmInput.value = "";

        } catch (error) {

            console.error("Could not update password:", error);

            const serverMessage = error && error.body && error.body.error;

            setHint(
                "password-status",
                serverMessage || "Couldn't update your password — check your current password and try again.",
                "is-taken",
                6000
            );

        } finally {
            changeBtn.disabled = false;
        }

    });

}


// ==================================================
// HELPERS
// ==================================================

const hintDismissTokens = {};

function setHint(elementId, message, className, autoDismissMs) {

    const el = document.getElementById(elementId);

    if (!el) {
        return;
    }

    el.textContent = message;

    el.className = "field-hint" + (className ? ` ${className}` : "");

    // Bump this element's token so any earlier pending auto-dismiss
    // (from a message we're now replacing) knows not to act.
    const token = (hintDismissTokens[elementId] = (hintDismissTokens[elementId] || 0) + 1);

    if (autoDismissMs && message) {
        setTimeout(() => {
            if (hintDismissTokens[elementId] === token) {
                el.textContent = "";
                el.className = "field-hint";
            }
        }, autoDismissMs);
    }

}


function debounce(fn, delayMs) {

    let timer = null;

    return (...args) => {

        clearTimeout(timer);

        timer = setTimeout(() => fn(...args), delayMs);

    };

}