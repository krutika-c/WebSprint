console.log("password.js loaded");

document.addEventListener("DOMContentLoaded", function () {

    lucide.createIcons();

    const passwordToggles = document.querySelectorAll(".password-toggle");

    passwordToggles.forEach(function (toggle) {

        toggle.addEventListener("click", function () {

            let input;

            if (toggle.dataset.target) {
                input = document.getElementById(toggle.dataset.target);
            } else {
                input = document.getElementById("password");
            }

            if (!input) return;

            if (input.type === "password") {

                input.type = "text";

                toggle.innerHTML = '<i data-lucide="eye-off"></i>';
                toggle.setAttribute("aria-label", "Hide password");

            } else {

                input.type = "password";

                toggle.innerHTML = '<i data-lucide="eye"></i>';
                toggle.setAttribute("aria-label", "Show password");
            }

            lucide.createIcons();
        });

    });

});