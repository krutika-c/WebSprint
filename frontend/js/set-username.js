// ==================================================
// SET USERNAME (onboarding step)
//
// Shown right after a brand-new Google sign-up (see
// OAuth2LoginSuccessHandler + oauth-success.html), so the person
// picks their username as part of onboarding instead of getting one
// auto-generated and changing it later. Reuses the same availability
// and save endpoints as the Settings/profile page.
// ==================================================

document.addEventListener("DOMContentLoaded", () => {
    initSetUsername();
});

let availabilityCheckToken = 0;

async function initSetUsername() {

    const usernameInput = document.getElementById("username");
    const form = document.getElementById("usernameForm");
    const continueBtn = document.getElementById("continueBtn");

    if (!usernameInput || !form) {
        return;
    }

    if (!localStorage.getItem("token")) {
        // No session — nothing to onboard.
        window.location.href = "login.html";
        return;
    }

    // If this account already has a username (e.g. the person reloaded
    // this page, or navigated back here after already finishing
    // onboarding), there's nothing left to do — send them on rather
    // than making them pick another one.
    try {
        const profile = await apiFetch("/api/users/me");
        if (profile.username && profile.username.trim() !== "") {
            window.location.href = "choose-topic.html";
            return;
        }
    } catch (error) {
        console.error("Could not load profile:", error);
    }

    usernameInput.addEventListener(
        "input",
        debounce(() => {
            checkAvailability(usernameInput.value);
        }, 400)
    );

    form.addEventListener("submit", async (event) => {
        event.preventDefault();
        await saveUsername(usernameInput.value, continueBtn);
    });
}

function isValidFormat(value) {
    return /^[a-z0-9_]{3,20}$/.test(value);
}

async function checkAvailability(rawValue) {

    const value = (rawValue || "").trim().toLowerCase();

    if (value.length === 0) {
        setHint("", "");
        return;
    }

    if (!isValidFormat(value)) {
        setHint("3-20 characters: lowercase letters, numbers, underscores.", "is-taken");
        return;
    }

    setHint("Checking availability...", "is-checking");

    const thisCheck = ++availabilityCheckToken;

    try {
        const result = await apiFetch(
            `/api/users/username-availability?username=${encodeURIComponent(value)}`
        );

        if (thisCheck !== availabilityCheckToken) {
            return;
        }

        if (result.available) {
            setHint("Username is available.", "is-available");
        } else {
            setHint(result.reason || "That username is already taken.", "is-taken");
        }
    } catch (error) {
        console.error("Availability check failed:", error);
        if (thisCheck === availabilityCheckToken) {
            setHint("Couldn't check availability right now.", "is-taken");
        }
    }
}

async function saveUsername(rawValue, continueBtn) {

    const value = (rawValue || "").trim().toLowerCase();

    if (!isValidFormat(value)) {
        setHint(
            "Choose a valid username first (3-20 chars, lowercase/numbers/underscores).",
            "is-taken"
        );
        return;
    }

    if (continueBtn) continueBtn.disabled = true;
    setHint("Saving...", "is-checking");

    try {
        await apiFetch("/api/users/username", {
            method: "PUT",
            body: JSON.stringify({ username: value })
        });

        window.location.href = "choose-topic.html";

    } catch (error) {
        console.error("Could not save username:", error);
        setHint("That username couldn't be saved — it may already be taken.", "is-taken");
        if (continueBtn) continueBtn.disabled = false;
    }
}

function setHint(message, className) {
    const el = document.getElementById("username-status");
    if (!el) return;
    el.textContent = message;
    el.className = "field-hint" + (className ? ` ${className}` : "");
}

function debounce(fn, delayMs) {
    let timer = null;
    return (...args) => {
        clearTimeout(timer);
        timer = setTimeout(() => fn(...args), delayMs);
    };
}