(function () {
  "use strict";

  /* ----------------------------------------------------------
     NEW — authFetch. Reusable helper for any future call to a
     protected endpoint (lessons, quizzes, progress). Attaches
     the JWT automatically. Nothing else in this file uses it
     yet, but it's here so later pages don't repeat this by hand.
  ---------------------------------------------------------- */
  window.authFetch = function (url, options) {
    options = options || {};
    options.headers = Object.assign({}, options.headers, {
      Authorization: "Bearer " + (localStorage.getItem("token") || ""),
    });
    return fetch(url, options);
  };

  /* ----------------------------------------------------------
     1. Inject the shared topbar + sidebar
     Any page with <div id="shell" data-active="dashboard"></div>
     gets the navigation rendered automatically.
     UNCHANGED — left exactly as pasted.
  ---------------------------------------------------------- */

  document.querySelectorAll("[data-tabs]").forEach(function (group) {
    const tabs = group.querySelectorAll(".tab");
    tabs.forEach(function (tab) {
      tab.addEventListener("click", function () {
        tabs.forEach(function (t) { t.classList.remove("is-active"); });
        tab.classList.add("is-active");
      });
    });
  });

  document.querySelectorAll(".options").forEach(function (group) {
    group.querySelectorAll(".option").forEach(function (opt) {
      opt.addEventListener("click", function () {
        group.querySelectorAll(".option").forEach(function (o) {
          o.classList.remove("is-selected");
        });
        opt.classList.add("is-selected");
      });
    });
  });

  const runBtn = document.getElementById("runCode");
  const editor = document.getElementById("editor");
  const output = document.getElementById("output");
  if (runBtn && editor && output) {
    runBtn.addEventListener("click", function () {
      output.innerHTML = editor.value;
    });
    const resetBtn = document.getElementById("resetCode");
    if (resetBtn) {
      resetBtn.addEventListener("click", function () {
        editor.value = "";
        output.innerHTML = "";
      });
    }
    const submitBtn = document.getElementById("submitCode");
    if (submitBtn) {
      submitBtn.addEventListener("click", function () {
        output.innerHTML = editor.value;
        window.location.href = "level-complete";
      });
    }
  }

  const filterTabs = document.querySelectorAll(".filter-tab");
  if (filterTabs.length) {
    filterTabs.forEach(function (tab) {
      tab.addEventListener("click", function () {
        filterTabs.forEach(function (t) { t.classList.remove("is-active"); });
        tab.classList.add("is-active");
        const filter = tab.getAttribute("data-filter");
        document.querySelectorAll(".ach").forEach(function (card) {
          const state = card.getAttribute("data-state");
          const show = filter === "all" || filter === state;
          card.style.display = show ? "" : "none";
        });
      });
    });
  }

  function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    if (!field) return;
    field.classList.add("has-error");
    const err = field.querySelector(".field__error");
    if (err) err.textContent = message;
  }
  function clearErrors(form) {
    form.querySelectorAll(".field").forEach(function (f) {
      f.classList.remove("has-error");
    });
  }
  function isEmail(value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }

  /* ----------------------------------------------------------
     CHANGED — login now calls /api/login instead of just
     redirecting. Validation rules above the fetch() call are
     untouched from the pasted version.
  ---------------------------------------------------------- */
  const loginForm = document.getElementById("loginForm");
  if (loginForm) {
    loginForm.addEventListener("submit", async function (e) {
      e.preventDefault();
      clearErrors(loginForm);
      const email = loginForm.email.value.trim();
      const password = loginForm.password.value;
      let ok = true;
      if (!isEmail(email)) {
        showError("f-email", "Enter a valid email address.");
        ok = false;
      }
      if (password.length < 6) {
        showError("f-password", "Password must be at least 6 characters.");
        ok = false;
      }
      if (!ok) return;

      try {
        const res = await fetch("/api/login", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ email: email, password: password }),
        });
        const data = await res.json();

        if (res.ok) {
          localStorage.setItem("token", data.token);
          window.location.href = "dashboard";
        } else {
          showError("f-password", data.error || "Login failed. Try again.");
        }
      } catch (err) {
        showError("f-password", "Could not reach the server. Try again.");
      }
    });
  }

  /* ----------------------------------------------------------
     CHANGED — signup now calls /api/signup instead of just
     redirecting. Validation rules above the fetch() call are
     untouched from the pasted version.
  ---------------------------------------------------------- */
  const signupForm = document.getElementById("signupForm");
  if (signupForm) {
    signupForm.addEventListener("submit", async function (e) {
      e.preventDefault();
      clearErrors(signupForm);
      const name = signupForm.name.value.trim();
      const email = signupForm.email.value.trim();
      const password = signupForm.password.value;
      const confirm = signupForm.confirm.value;
      let ok = true;
      if (name.length < 2) {
        showError("f-name", "Please enter your name.");
        ok = false;
      }
      if (!isEmail(email)) {
        showError("f-email", "Enter a valid email address.");
        ok = false;
      }
      if (password.length < 6) {
        showError("f-password", "Password must be at least 6 characters.");
        ok = false;
      }
      if (confirm !== password) {
        showError("f-confirm", "Passwords do not match.");
        ok = false;
      }
      if (!ok) return;

      try {
        // field names match SignupRequest.java: fullName, email, password, confirmPassword
        const res = await fetch("/api/signup", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            fullName: name,
            email: email,
            password: password,
            confirmPassword: confirm,
          }),
        });
        const data = await res.json();

        if (res.ok) {
          localStorage.setItem("token", data.token);
          window.location.href = "choose-topic";
        } else {
          showError("f-email", data.error || "Could not create account.");
        }
      } catch (err) {
        showError("f-email", "Could not reach the server. Try again.");
      }
    });
  }
})();