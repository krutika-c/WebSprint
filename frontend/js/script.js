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

    // Optional: a tab can point at a panel (elsewhere on the page,
    // marked [data-tab-panel]) via data-tab-target="panel-id". Pages
    // that don't use this (just the visual is-active toggle) are
    // unaffected — this only runs when a matching panel exists.
    const panels = document.querySelectorAll("[data-tab-panel]");

    tabs.forEach(function (tab) {
      tab.addEventListener("click", function () {
        tabs.forEach(function (t) { t.classList.remove("is-active"); });
        tab.classList.add("is-active");

        const targetId = tab.getAttribute("data-tab-target");
        if (!targetId || panels.length === 0) {
          return;
        }

        panels.forEach(function (panel) {
          const isTarget = panel.id === targetId;
          panel.hidden = !isTarget;
          panel.classList.toggle("is-active", isTarget);
        });
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
        window.location.href = "level-complete.html";
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

  // Same rule the backend enforces (RegistrationController /
  // UserController): 3-20 chars, lowercase letters/digits/underscore.
  function isValidUsername(value) {
    return /^[a-z0-9_]{3,20}$/.test(value);
  }

  function debounce(fn, delayMs) {
    let timer = null;
    return function () {
      const args = arguments;
      clearTimeout(timer);
      timer = setTimeout(function () { fn.apply(null, args); }, delayMs);
    };
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
      const res = await fetch("http://localhost:8080/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email: email, password: password }),
      });
      const data = await res.json();

      if (res.ok) {
        localStorage.setItem("token", data.token);
        window.location.href = "h1.html";
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

  // ----------------------------------------------------------
  // Username is chosen right here at signup, so check it against
  // the backend as the person types — same endpoint the Settings
  // page uses to check a username change later.
  // ----------------------------------------------------------
  const usernameInput = document.getElementById("username");
  let usernameAvailabilityKnown = false; // becomes true once a check confirms it's free

  function setUsernameHint(message, className) {
    const el = document.getElementById("username-status");
    if (!el) return;
    el.textContent = message;
    el.className = "field-hint" + (className ? " " + className : "");
  }

  const checkUsernameAvailability = debounce(async function (rawValue) {
    const value = (rawValue || "").trim().toLowerCase();
    usernameAvailabilityKnown = false;

    if (value.length === 0) {
      setUsernameHint("", "");
      return;
    }

    if (!isValidUsername(value)) {
      setUsernameHint("3-20 characters: lowercase letters, numbers, underscores.", "is-taken");
      return;
    }

    setUsernameHint("Checking availability...", "is-checking");

    try {
      const res = await fetch(
        "http://localhost:8080/api/users/username-availability?username=" + encodeURIComponent(value)
      );
      const result = await res.json();

      if (result.available) {
        usernameAvailabilityKnown = true;
        setUsernameHint("Username is available.", "is-available");
      } else {
        setUsernameHint(result.reason || "That username is already taken.", "is-taken");
      }
    } catch (err) {
      setUsernameHint("Couldn't check availability right now.", "is-taken");
    }
  }, 400);

  if (usernameInput) {
    usernameInput.addEventListener("input", function () {
      clearError("f-username");
      checkUsernameAvailability(usernameInput.value);
    });
  }

  signupForm.addEventListener("submit", async function (e) {
    e.preventDefault();
    clearErrors(signupForm);
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const username = (usernameInput ? usernameInput.value : "").trim().toLowerCase();
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
    if (!isValidUsername(username)) {
      showError("f-username", "Choose a username: 3-20 characters, lowercase letters, numbers, underscores.");
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

    // If the availability check hasn't confirmed this exact value yet
    // (e.g. they typed it and hit Enter immediately), verify it once
    // more before submitting so the error, if any, shows up here
    // rather than as a generic failure after the request.
    if (!usernameAvailabilityKnown) {
      try {
        const availRes = await fetch(
          "http://localhost:8080/api/users/username-availability?username=" + encodeURIComponent(username)
        );
        const availData = await availRes.json();
        if (!availData.available) {
          showError("f-username", availData.reason || "That username is already taken.");
          return;
        }
      } catch (err) {
        // Can't reach the server to double-check — let the signup
        // request itself surface the final answer below.
      }
    }

    try {
      const res = await fetch("http://localhost:8080/api/signup", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          fullName: name,
          email: email,
          username: username,
          password: password,
          confirmPassword: confirm,
        }),
      });
      const data = await res.json();

      if (res.ok) {
        localStorage.setItem("token", data.token);
        window.location.href = "choose-topic.html";
      } else {
        const msg = data.error || "Could not create account.";
        if (/username/i.test(msg)) {
          showError("f-username", msg);
        } else {
          showError("f-email", msg);
        }
      }
    } catch (err) {
      showError("f-email", "Could not reach the server. Try again.");
    }
  });
}

})();