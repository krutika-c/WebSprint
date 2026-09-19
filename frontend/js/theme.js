(function () {
    "use strict";

    var THEME_KEY = "theme";
    var FONT_KEY = "fontSize";

    /* Only real controls — NOT <html>, which also carries data-theme. */
    var THEME_BTNS = 'button[data-theme], a[data-theme], .btn[data-theme], [data-theme-toggle]';
    var FONT_BTNS = 'button[data-fontsize], a[data-fontsize], .btn[data-fontsize]';

    function getTheme() {
        var t = localStorage.getItem(THEME_KEY);
        return t === "light" || t === "dark" ? t : "dark";
    }

    function getFontSize() {
        return localStorage.getItem(FONT_KEY) || "medium";
    }

    function applyTheme(theme) {
        document.documentElement.setAttribute("data-theme", theme);
        localStorage.setItem(THEME_KEY, theme);
        updateActiveButtons();
    }

    function applyFontSize(size) {
        document.documentElement.setAttribute("data-fontsize", size);
        localStorage.setItem(FONT_KEY, size);
        updateActiveButtons();
    }

    /* Applied before first paint to avoid a flash of the wrong theme. */
    document.documentElement.setAttribute("data-theme", getTheme());
    document.documentElement.setAttribute("data-fontsize", getFontSize());

    document.addEventListener("DOMContentLoaded", function () {

        document.querySelectorAll(THEME_BTNS).forEach(function (button) {
            button.addEventListener("click", function (e) {
                e.preventDefault();

                var theme = button.getAttribute("data-theme");

                /* [data-theme-toggle] flips between light and dark. */
                if (!theme) {
                    theme = getTheme() === "light" ? "dark" : "light";
                }

                applyTheme(theme);
            });
        });

        document.querySelectorAll(FONT_BTNS).forEach(function (button) {
            button.addEventListener("click", function (e) {
                e.preventDefault();
                applyFontSize(button.getAttribute("data-fontsize"));
            });
        });

        updateActiveButtons();
    });

    /* Keep other open tabs in sync. */
    window.addEventListener("storage", function (e) {
        if (e.key === THEME_KEY && e.newValue) {
            document.documentElement.setAttribute("data-theme", e.newValue);
            updateActiveButtons();
        }
        if (e.key === FONT_KEY && e.newValue) {
            document.documentElement.setAttribute("data-fontsize", e.newValue);
            updateActiveButtons();
        }
    });

    function updateActiveButtons() {
        var currentTheme = getTheme();
        var currentFontSize = getFontSize();

        document.querySelectorAll(THEME_BTNS).forEach(function (button) {
            var v = button.getAttribute("data-theme");
            if (v) {
                button.classList.toggle("is-active", v === currentTheme);
            }
        });

        document.querySelectorAll(FONT_BTNS).forEach(function (button) {
            button.classList.toggle(
                "is-active",
                button.getAttribute("data-fontsize") === currentFontSize
            );
        });
    }

    window.WebSprintTheme = {
        get: getTheme,
        set: applyTheme,
        toggle: function () {
            applyTheme(getTheme() === "light" ? "dark" : "light");
        }
    };

})();