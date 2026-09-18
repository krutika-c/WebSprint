(function () {
    "use strict";

    const savedTheme = localStorage.getItem("theme") || "dark";
    const savedFontSize = localStorage.getItem("fontSize") || "medium";

    document.documentElement.setAttribute("data-theme", savedTheme);
    document.documentElement.setAttribute("data-fontsize", savedFontSize);

    document.addEventListener("DOMContentLoaded", function () {



        document.querySelectorAll("[data-theme]").forEach(function (button) {

            button.addEventListener("click", function () {

                const theme = button.getAttribute("data-theme");

                document.documentElement.setAttribute(
                    "data-theme",
                    theme
                );

                localStorage.setItem("theme", theme);

                updateActiveButtons();
            });
        });



        document.querySelectorAll("[data-fontsize]").forEach(function (button) {

            button.addEventListener("click", function () {

                const fontSize = button.getAttribute("data-fontsize");

                document.documentElement.setAttribute(
                    "data-fontsize",
                    fontSize
                );

                localStorage.setItem("fontSize", fontSize);

                updateActiveButtons();
            });
        });


        updateActiveButtons();
    });




    function updateActiveButtons() {

        const currentTheme =
            localStorage.getItem("theme") || "dark";

        const currentFontSize =
            localStorage.getItem("fontSize") || "medium";


        document.querySelectorAll("[data-theme]").forEach(function (button) {

            button.classList.toggle(
                "is-active",
                button.getAttribute("data-theme") === currentTheme
            );

        });


        document.querySelectorAll("[data-fontsize]").forEach(function (button) {

            button.classList.toggle(
                "is-active",
                button.getAttribute("data-fontsize") === currentFontSize
            );

        });
    }

})();