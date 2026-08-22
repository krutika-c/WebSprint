(function () {
  "use strict";

  /* ----------------------------------------------------------
     authFetch. Reusable helper for any future call to a
     protected endpoint (lessons, quizzes, progress). Attaches
     the JWT automatically.
  ---------------------------------------------------------- */
  window.authFetch = function (url, options) {
    options = options || {};
    options.headers = Object.assign({}, options.headers, {
      Authorization: "Bearer " + (localStorage.getItem("token") || ""),
    });
    return fetch(url, options);
  };

  /* ----------------------------------------------------------
     1. Shared page wiring — tabs, options, code runner, filters.
     UNCHANGED.
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

  /* ----------------------------------------------------------
     2. Inline error helpers.
     These render the message INSIDE the field's own container
     (a red-bordered box with red text right under the input) —
     never a browser alert()/confirm() popup.
  ---------------------------------------------------------- */
  function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    if (!field) return;
    field.classList.add("has-error");
    let err = field.querySelector(".field__error");
    if (!err) {
      // Create the error element on the fly if the HTML doesn't already
      // have one, so this always works even on pages you haven't added
      // <p class="field__error"> to yet.
      err = document.createElement("p");
      err.className = "field__error";
      field.appendChild(err);
    }
    err.textContent = message;
  }

  function clearError(fieldId) {
    const field = document.getElementById(fieldId);
    if (!field) return;
    field.classList.remove("has-error");
    const err = field.querySelector(".field__error");
    if (err) err.textContent = "";
  }

  function clearErrors(form) {
    form.querySelectorAll(".field").forEach(function (f) {
      f.classList.remove("has-error");
      const err = f.querySelector(".field__error");
      if (err) err.textContent = ""; // FIXED: previously left stale text behind
    });
  }

  function wireLiveClear(inputEl, fieldId) {
    if (!inputEl) return;
    inputEl.addEventListener("input", function () { clearError(fieldId); });
  }

  function isEmail(value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }

  function isValidName(value) {
    return /^[A-Za-z][A-Za-z\s'-]{1,}$/.test(value);
  }

  // Full strength rule: 6+ chars, at least one letter, one number,
  // one symbol. Returns null when the password passes.
  function validatePasswordStrength(password) {
    if (!password) return "Password is required.";
    if (password.length < 6) return "Password must be at least 6 characters long.";
    if (!/[A-Za-z]/.test(password)) return "Password must contain at least one letter.";
    if (!/\d/.test(password)) return "Password must contain at least one number.";
    if (!/[!@#$%^&*(),.?":{}|<>_]/.test(password)) return "Password must contain at least one special symbol.";
    return null;
  }

  /* ----------------------------------------------------------
     3. Login — real field name is "username" (Spring Security's
     default), even though it holds an email address.
  ---------------------------------------------------------- */
  const loginForm = document.getElementById("loginForm");
if (loginForm) {
  loginForm.addEventListener("submit", async function (e) {
    e.preventDefault();
    clearErrors(loginForm);
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
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

const signupForm = document.getElementById("signupForm");
if (signupForm) {
  signupForm.addEventListener("submit", async function (e) {
    e.preventDefault();
    clearErrors(signupForm);
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("confirm").value;
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