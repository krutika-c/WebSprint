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

const ONBOARDING_FLAG = "websprint.needsUsername";

let availabilityCheckToken = 0;

function initSetUsername() {

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

    // Only people sent here by a fresh Google sign-up (see
    // oauth-success.html) have something to onboard. We deliberately do
    // NOT ask the server "do I have a username?" via GET /api/users/me:
    // that endpoint generates one on the fly when it's blank, so the
    // answer was always "yes" and this page redirected away before the
    // person could type anything.
    if (!sessionStorage.getItem(ONBOARDING_FLAG)) {
        window.location.replace("h1.html");
        return;
    }

    usernameInput.focus();

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

        sessionStorage.removeItem(ONBOARDING_FLAG);
        window.location.href = "h1.html";

    } catch (error) {
        console.error("Could not save username:", error);

        if (error.status === 401 || error.status === 403) {
            window.location.href = "login.html";
            return;
        }

        const serverMessage = error.body && error.body.error;
        setHint(
            serverMessage ||
                (error.status === 409
                    ? "That username is already taken."
                    : "Couldn't save your username. Please try again."),
            "is-taken"
        );
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