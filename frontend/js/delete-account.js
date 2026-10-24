/* =====================================================
   DELETE ACCOUNT (frontend)

   Works on any page that has a button with
   id="delete-account-btn" (profile.html, settings.html).

   Flow:
     1. Click "Delete Account" -> confirmation modal opens
     2. User must type DELETE (exact, case-sensitive — the
        backend enforces the same rule)
     3. POST /api/account/delete  { confirmation: "DELETE" }
        -> 204 No Content on success
     4. Clear all local data, show a short goodbye, redirect

   Needs js/config.js (API_BASE_URL) loaded on the page.
   Doesn't use apiFetch() because that helper always calls
   response.json(), which fails on the endpoint's empty 204.
===================================================== */

(function () {
    "use strict";

    var CONFIRM_WORD = "DELETE";
    var REDIRECT_AFTER_SUCCESS = "index.html";
    var REDIRECT_AFTER_EXPIRED = "login.html";

    var trigger = null;
    var overlay = null;
    var input = null;
    var confirmBtn = null;
    var cancelBtn = null;
    var statusEl = null;
    var dialogEl = null;
    var isBusy = false;
    var lastFocused = null;

    function apiBase() {
        return (typeof API_BASE_URL !== "undefined" && API_BASE_URL)
            ? API_BASE_URL
            : "http://localhost:8080";
    }

    /* ───────── Build modal (once) ───────── */

    function buildModal() {
        overlay = document.createElement("div");
        overlay.className = "da-overlay";
        overlay.hidden = true;

        overlay.innerHTML =
            '<div class="da-dialog" role="dialog" aria-modal="true" ' +
            'aria-labelledby="da-title" aria-describedby="da-desc" tabindex="-1">' +
                '<div class="da-form" id="da-form-view">' +
                    '<div class="da-icon" aria-hidden="true">⚠️</div>' +
                    '<h2 class="da-title" id="da-title">Delete your account?</h2>' +
                    '<p class="da-desc" id="da-desc">' +
                        "This permanently deletes your WebSprint account and " +
                        "everything attached to it. This can't be undone." +
                    "</p>" +
                    '<ul class="da-list">' +
                        "<li>Level progress and placement test results</li>" +
                        "<li>XP, streaks and achievements</li>" +
                        "<li>Your profile, username and login</li>" +
                    "</ul>" +
                    '<label class="da-label" for="da-input">' +
                        "Type <strong>" + CONFIRM_WORD + "</strong> to confirm" +
                    "</label>" +
                    '<input type="text" id="da-input" class="da-input" ' +
                        'autocomplete="off" autocapitalize="characters" ' +
                        'spellcheck="false" placeholder="' + CONFIRM_WORD + '" />' +
                    '<p class="da-status" id="da-status" role="alert" aria-live="polite" hidden></p>' +
                    '<div class="da-actions">' +
                        '<button type="button" class="btn btn--ghost" id="da-cancel">Cancel</button>' +
                        '<button type="button" class="da-confirm" id="da-confirm" disabled>' +
                            "Delete my account" +
                        "</button>" +
                    "</div>" +
                "</div>" +
                '<div class="da-success" id="da-success-view" hidden>' +
                    '<div class="da-icon" aria-hidden="true">👋</div>' +
                    '<h2 class="da-title">Account deleted</h2>' +
                    '<p class="da-desc">Your account and data have been removed. ' +
                    "Taking you back to the home page…</p>" +
                "</div>" +
            "</div>";

        document.body.appendChild(overlay);

        dialogEl = overlay.querySelector(".da-dialog");
        input = overlay.querySelector("#da-input");
        confirmBtn = overlay.querySelector("#da-confirm");
        cancelBtn = overlay.querySelector("#da-cancel");
        statusEl = overlay.querySelector("#da-status");

        input.addEventListener("input", syncConfirmState);
        input.addEventListener("keydown", function (e) {
            if (e.key === "Enter" && !confirmBtn.disabled) {
                e.preventDefault();
                submitDeletion();
            }
        });

        cancelBtn.addEventListener("click", closeModal);
        confirmBtn.addEventListener("click", submitDeletion);

        // Click on the dark backdrop (not the dialog) closes it.
        overlay.addEventListener("mousedown", function (e) {
            if (e.target === overlay) closeModal();
        });

        overlay.addEventListener("keydown", handleKeydown);
    }

    /* ───────── Open / close ───────── */

    function openModal() {
        if (!overlay) buildModal();

        lastFocused = document.activeElement;

        resetState();
        overlay.hidden = false;
        document.body.classList.add("da-lock");

        // Next frame so the transition runs and focus lands reliably.
        requestAnimationFrame(function () {
            overlay.classList.add("is-open");
            input.focus();
        });
    }

    function closeModal() {
        if (isBusy || !overlay) return;

        overlay.classList.remove("is-open");
        document.body.classList.remove("da-lock");
        overlay.hidden = true;

        if (lastFocused && typeof lastFocused.focus === "function") {
            lastFocused.focus();
        }
    }

    function resetState() {
        input.value = "";
        input.disabled = false;
        cancelBtn.disabled = false;
        setStatus("");
        setBusy(false);
        syncConfirmState();
        overlay.querySelector("#da-form-view").hidden = false;
        overlay.querySelector("#da-success-view").hidden = true;
    }

    /* ───────── Keyboard: Esc + focus trap ───────── */

    function handleKeydown(e) {
        if (e.key === "Escape") {
            e.preventDefault();
            closeModal();
            return;
        }

        if (e.key !== "Tab") return;

        var focusable = Array.prototype.filter.call(
            dialogEl.querySelectorAll("button, input"),
            function (el) { return !el.disabled && el.offsetParent !== null; }
        );

        if (!focusable.length) {
            e.preventDefault();
            dialogEl.focus();
            return;
        }

        var first = focusable[0];
        var last = focusable[focusable.length - 1];

        if (e.shiftKey && document.activeElement === first) {
            e.preventDefault();
            last.focus();
        } else if (!e.shiftKey && document.activeElement === last) {
            e.preventDefault();
            first.focus();
        }
    }

    /* ───────── UI helpers ───────── */

    function syncConfirmState() {
        // Exact, case-sensitive match — mirrors the backend check.
        confirmBtn.disabled = isBusy || input.value !== CONFIRM_WORD;
    }

    function setStatus(message) {
        if (!message) {
            statusEl.hidden = true;
            statusEl.textContent = "";
            return;
        }
        statusEl.textContent = message;
        statusEl.hidden = false;
    }

    function setBusy(busy) {
        isBusy = busy;
        confirmBtn.classList.toggle("is-loading", busy);
        confirmBtn.textContent = busy ? "Deleting…" : "Delete my account";
        input.disabled = busy;
        cancelBtn.disabled = busy;
        dialogEl.setAttribute("aria-busy", busy ? "true" : "false");
        syncConfirmState();
    }

    /* ───────── Local cleanup ───────── */

    function clearLocalSession() {
        try {
            // Everything account-specific. Device preferences
            // (theme, fontSize) are deliberately kept.
            var toRemove = [];
            for (var i = 0; i < localStorage.length; i++) {
                var key = localStorage.key(i);
                if (key === "token" || key.indexOf("websprint") === 0) {
                    toRemove.push(key);
                }
            }
            toRemove.forEach(function (k) { localStorage.removeItem(k); });
        } catch (e) { /* storage unavailable — nothing to clear */ }

        try { sessionStorage.clear(); } catch (e) { /* ignore */ }
    }

    /* ───────── The actual request ───────── */

    async function submitDeletion() {
        if (isBusy || input.value !== CONFIRM_WORD) return;

        setStatus("");
        setBusy(true);

        var token = null;
        try { token = localStorage.getItem("token"); } catch (e) { /* ignore */ }

        if (!token) {
            clearLocalSession();
            window.location.replace(REDIRECT_AFTER_EXPIRED);
            return;
        }

        var response;

        try {
            response = await fetch(apiBase() + "/api/account/delete", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer " + token
                },
                body: JSON.stringify({ confirmation: CONFIRM_WORD })
            });
        } catch (networkError) {
            setBusy(false);
            setStatus("Couldn't reach the server. Check your connection and try again.");
            return;
        }

        // Success is 204 No Content — don't try to parse a body.
        if (response.ok) {
            onDeleted();
            return;
        }

        if (response.status === 401 || response.status === 403) {
            // Session expired / token no longer valid.
            setStatus("Your session has expired. Please log in again.");
            clearLocalSession();
            setTimeout(function () {
                window.location.replace(REDIRECT_AFTER_EXPIRED);
            }, 1800);
            return;
        }

        setBusy(false);

        if (response.status === 400) {
            setStatus('Please type "' + CONFIRM_WORD + '" exactly as shown.');
        } else {
            setStatus("Something went wrong on our side. Your account was not deleted — please try again.");
        }
    }

    function onDeleted() {
        clearLocalSession();

        overlay.querySelector("#da-form-view").hidden = true;
        overlay.querySelector("#da-success-view").hidden = false;
        dialogEl.focus();

        setTimeout(function () {
            window.location.replace(REDIRECT_AFTER_SUCCESS);
        }, 2200);
    }

    /* ───────── Init ───────── */

    document.addEventListener("DOMContentLoaded", function () {
        trigger = document.getElementById("delete-account-btn");
        if (!trigger) return;

        trigger.addEventListener("click", function (e) {
            e.preventDefault();
            openModal();
        });
    });
})();