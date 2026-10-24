/* =====================================================
   QUIZ FOCUS MODE (lesson.html)

   Flow:
     1. lesson.js finishes loading the questions and fires
        "quiz:ready"  -> a "Start Quiz" screen covers the quiz panel
     2. Clicking Start (a user gesture, which browsers require for
        fullscreen) -> page goes fullscreen, the quiz panel is lifted
        into a full-window stage, everything else is made inert
     3. While active:
          - browser Back / Alt+Left / mobile back are neutralised
          - refresh / close shows the browser's "Leave site?" warning
          - leaving fullscreen pauses the quiz behind a blocking
            screen until the person returns to fullscreen
     4. lesson.js fires "quiz:finished" right before it navigates to
        level-complete.html -> everything is released

   Honest limits (browser rules, not something JS can override):
     - Esc can't be fully disabled. Where supported (Chromium) we use
       the Keyboard Lock API so Esc must be HELD ~2s to exit; either
       way, exiting just pauses the quiz and hides the questions.
     - Closing the tab/window or Alt+F4 can't be blocked, only warned.
     - iPhone Safari has no fullscreen API for pages; there the quiz
       still runs in the full-window stage with back/refresh guards.
===================================================== */

(function () {
    "use strict";

    var active = false;
    var panel = null;
    var stage = null;
    var placeholder = null;
    var startOverlay = null;
    var pauseOverlay = null;
    var toastEl = null;
    var toastTimer = null;
    var inertedEls = [];

    /* ───────── Fullscreen helpers (with Safari prefix) ───────── */

    var root = document.documentElement;

    function fsSupported() {
        return !!(root.requestFullscreen || root.webkitRequestFullscreen);
    }

    function fsElement() {
        return document.fullscreenElement || document.webkitFullscreenElement || null;
    }

    function requestFs() {
        try {
            if (root.requestFullscreen) {
                return root.requestFullscreen({ navigationUI: "hide" });
            }
            if (root.webkitRequestFullscreen) {
                root.webkitRequestFullscreen();
                return Promise.resolve();
            }
        } catch (e) {
            return Promise.reject(e);
        }
        return Promise.reject(new Error("Fullscreen not supported"));
    }

    function lockEscape() {
        // Chromium only: makes Esc require a ~2s hold to leave fullscreen.
        try {
            if (navigator.keyboard && navigator.keyboard.lock) {
                navigator.keyboard.lock(["Escape"]).catch(function () {});
            }
        } catch (e) { /* unsupported */ }
    }

    function unlockEscape() {
        try {
            if (navigator.keyboard && navigator.keyboard.unlock) {
                navigator.keyboard.unlock();
            }
        } catch (e) { /* unsupported */ }
    }

    /* ───────── Small UI helpers ───────── */

    function el(tag, className, html) {
        var node = document.createElement(tag);
        if (className) node.className = className;
        if (html) node.innerHTML = html;
        return node;
    }

    function toast(message) {
        if (!toastEl) {
            toastEl = el("div", "qf-toast");
            toastEl.setAttribute("role", "status");
            toastEl.setAttribute("aria-live", "polite");
            document.body.appendChild(toastEl);
        }
        toastEl.textContent = message;
        toastEl.classList.add("is-visible");
        clearTimeout(toastTimer);
        toastTimer = setTimeout(function () {
            toastEl.classList.remove("is-visible");
        }, 2600);
    }

    /* ───────── Start screen ───────── */

    function showStartScreen() {
        var quizBody = document.getElementById("lesson-quiz");
        panel = quizBody ? quizBody.closest(".pixel-preview-window") : null;
        if (!quizBody || !panel) return;

        quizBody.classList.add("qf-host");

        startOverlay = el("div", "qf-start");
        startOverlay.innerHTML =
            '<div class="qf-start__inner">' +
                '<div class="qf-start__icon" aria-hidden="true">🎯</div>' +
                '<h3 class="qf-start__title">Ready for the quiz?</h3>' +
                '<p class="qf-start__text">The quiz runs in <strong>focus mode</strong>:</p>' +
                '<ul class="qf-start__list">' +
                    "<li>Your screen goes fullscreen</li>" +
                    "<li>The back button is disabled</li>" +
                    "<li>You can't leave until you finish</li>" +
                "</ul>" +
                '<p class="qf-start__hint" id="qf-start-hint" role="alert" hidden></p>' +
                '<button type="button" class="btn btn--primary qf-start__btn" id="qf-start-btn">' +
                    "Start Quiz →" +
                "</button>" +
            "</div>";

        quizBody.appendChild(startOverlay);

        startOverlay.querySelector("#qf-start-btn")
            .addEventListener("click", startFocusMode);
    }

    function setStartHint(message) {
        var hint = document.getElementById("qf-start-hint");
        if (!hint) return;
        hint.textContent = message || "";
        hint.hidden = !message;
    }

    /* ───────── Enter focus mode ───────── */

    async function startFocusMode() {
        if (active) return;

        var btn = document.getElementById("qf-start-btn");
        if (btn) btn.disabled = true;
        setStartHint("");

        if (fsSupported()) {
            try {
                await requestFs();
            } catch (e) {
                if (btn) btn.disabled = false;
                setStartHint(
                    "Your browser blocked fullscreen. Allow it for this site and try again."
                );
                return;
            }
            lockEscape();
        }

        active = true;

        // Lift the quiz panel into a full-window stage.
        stage = el("div", "qf-stage");
        stage.id = "focus-stage";
        placeholder = document.createComment("quiz panel moved to focus stage");
        panel.parentNode.insertBefore(placeholder, panel);
        stage.appendChild(panel);
        document.body.appendChild(stage);

        if (startOverlay && startOverlay.parentNode) {
            startOverlay.parentNode.removeChild(startOverlay);
        }

        // Badge in the panel's title bar.
        var bar = panel.querySelector(".pixel-window-bar");
        if (bar && !bar.querySelector(".qf-badge")) {
            bar.appendChild(el("span", "qf-badge", "🔒 FOCUS MODE"));
        }

        // Nothing behind the stage can be reached by keyboard / screen reader.
        inertedEls = [];
        Array.prototype.forEach.call(document.body.children, function (child) {
            if (child === stage || child.tagName === "SCRIPT" ||
                child.classList.contains("qf-toast") ||
                child.classList.contains("qf-pause")) return;
            child.inert = true;
            inertedEls.push(child);
        });

        document.body.classList.add("quiz-focus");

        installGuards();

        // If fullscreen is lost right now for some reason, pause immediately.
        syncFullscreenState();

        var firstOption = panel.querySelector(".quiz-option");
        if (firstOption) firstOption.focus({ preventScroll: true });
    }

    /* ───────── Guards (back button, refresh, fullscreen exit) ───────── */

    function installGuards() {
        // Back button: park one extra history entry on this URL, and every
        // time the person pops it, push it again.
        history.pushState({ quizFocus: true }, "", window.location.href);
        window.addEventListener("popstate", onPopState);

        window.addEventListener("beforeunload", onBeforeUnload);
        document.addEventListener("keydown", onKeyDown, true);
        document.addEventListener("fullscreenchange", syncFullscreenState);
        document.addEventListener("webkitfullscreenchange", syncFullscreenState);
    }

    function removeGuards() {
        window.removeEventListener("popstate", onPopState);
        window.removeEventListener("beforeunload", onBeforeUnload);
        document.removeEventListener("keydown", onKeyDown, true);
        document.removeEventListener("fullscreenchange", syncFullscreenState);
        document.removeEventListener("webkitfullscreenchange", syncFullscreenState);
    }

    function onPopState() {
        if (!active) return;
        history.pushState({ quizFocus: true }, "", window.location.href);
        toast("Back is disabled during the quiz. Finish it to continue.");
    }

    function onBeforeUnload(e) {
        if (!active) return;
        e.preventDefault();
        e.returnValue = "";   // required by some browsers to show the prompt
        return "";
    }

    function onKeyDown(e) {
        if (!active) return;

        var key = (e.key || "").toLowerCase();
        var mod = e.ctrlKey || e.metaKey;

        var isReload = key === "f5" || (mod && key === "r");
        var isHistoryNav = e.altKey && (key === "arrowleft" || key === "arrowright");
        var isBackspaceNav = false; // modern browsers no longer go back on Backspace

        if (isReload || isHistoryNav || isBackspaceNav) {
            e.preventDefault();
            e.stopPropagation();
            toast("Navigation is disabled during the quiz.");
        }
    }

    /* ───────── Fullscreen lost -> pause screen ───────── */

    function syncFullscreenState() {
        if (!active || !fsSupported()) return;

        if (fsElement()) {
            hidePause();
            lockEscape();
        } else {
            showPause();
        }
    }

    function showPause() {
        if (!pauseOverlay) {
            pauseOverlay = el("div", "qf-pause");
            pauseOverlay.setAttribute("role", "alertdialog");
            pauseOverlay.setAttribute("aria-modal", "true");
            pauseOverlay.setAttribute("aria-labelledby", "qf-pause-title");
            pauseOverlay.innerHTML =
                '<div class="qf-pause__inner">' +
                    '<div class="qf-start__icon" aria-hidden="true">⏸️</div>' +
                    '<h3 class="qf-start__title" id="qf-pause-title">Quiz paused</h3>' +
                    '<p class="qf-start__text">Focus mode needs fullscreen. ' +
                    "Your answers so far are kept — return to fullscreen to continue.</p>" +
                    '<p class="qf-start__hint" id="qf-pause-hint" role="alert" hidden></p>' +
                    '<button type="button" class="btn btn--primary qf-start__btn" id="qf-resume-btn">' +
                        "Return to fullscreen" +
                    "</button>" +
                "</div>";
            document.body.appendChild(pauseOverlay);

            pauseOverlay.querySelector("#qf-resume-btn").addEventListener("click", function () {
                requestFs().then(lockEscape).catch(function () {
                    var hint = document.getElementById("qf-pause-hint");
                    hint.textContent = "Couldn't enter fullscreen. Allow it for this site and try again.";
                    hint.hidden = false;
                });
            });
        }

        pauseOverlay.classList.add("is-visible");
        if (stage) stage.inert = true;

        var resumeBtn = pauseOverlay.querySelector("#qf-resume-btn");
        if (resumeBtn) resumeBtn.focus();
    }

    function hidePause() {
        if (pauseOverlay) pauseOverlay.classList.remove("is-visible");
        if (stage) stage.inert = false;

        var firstOption = panel && panel.querySelector(".quiz-option:not([disabled])");
        var nextBtn = panel && panel.querySelector("#next-question");
        var target = (nextBtn && nextBtn.offsetParent !== null) ? nextBtn : firstOption;
        if (target) target.focus({ preventScroll: true });
    }

    /* ───────── Release when the quiz is submitted ───────── */

    function endFocusMode() {
        if (!active) return;
        active = false;
        removeGuards();
        unlockEscape();
        hidePause();
        // lesson.js navigates to level-complete.html right after this
        // event, which also leaves fullscreen for the next page.
    }

    /* ───────── Wire up ───────── */

    document.addEventListener("quiz:ready", function () {
        if (!startOverlay) showStartScreen();
    });

    document.addEventListener("quiz:finished", endFocusMode);
})();