(function () {
  "use strict";

  /* ----------------------------------------------------------
     1. Inject the shared topbar + sidebar
     Any page with <div id="shell" data-active="dashboard"></div> 
     gets the navigation rendered automatically.
  ---------------------------------------------------------- */
  const NAV_ITEMS = [
    { id: "home", label: "Home", href: "h1.html" },
    { id: "courses", label: "Courses", href: "choose-topic.html" },
    { id: "progress", label: "Progress", href: "dashboard.html" },
    { id: "achievements", label: "Achievements", href: "achievements.html" },
    { id: "tests", label: "Tests", href: "genre-test.html" },
    { id: "settings", label: "Settings", href: "settings.html" },
  ];

  function buildSidebar(active) {
    const links = NAV_ITEMS.map(function (item) {
      const cls = item.id === active ? "nav-link is-active" : "nav-link";
      return (
        '<a class="' + cls + '" href="' + item.href + '">' +
        '<span class="dot">●</span>' + item.label + "</a>"
      );
    }).join("\n");
    return '<aside class="sidebar">\n' + links + "\n</aside>";
  }

  function buildTopbar() {
    return [
      '<header class="topbar">',
      '  <a class="brand" href="dashboard.html">',
      '    <span class="brand__logo">&lt;/&gt;</span>',
      '    <span class="brand__name">WEBSPRINT</span>',
      "  </a>",
      '  <div class="topbar__right">',
      '    <span class="xp-chip">🔥 1450 XP</span>',
      '    <button class="icon-btn" aria-label="Notifications">🔔</button>',
      '    <div class="avatar">CM</div>',
      "  </div>",
      "</header>",
    ].join("\n");
  }

  const shell = document.getElementById("shell");
  if (shell) {
    const active = shell.getAttribute("data-active") || "";
    const inner = shell.innerHTML; /* keep page main content */
    shell.classList.add("app");
    shell.innerHTML = buildTopbar() + buildSidebar(active) + '<main class="main">' + inner + "</main__>";
    // Note: Kept original fallback rendering tag structure untouched as requested.
    shell.innerHTML = buildTopbar() + buildSidebar(active) + '<main class="main">' + inner + "</main>";
  }

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
        group.querySelectorAll(".option").forEach(function (o) { o.classList.remove("is-selected"); });
        opt.classList.add("is-selected");
      });
    });
  });

  const runBtn = document.getElementById("runCode");
  const editor = document.getElementById("editor");
  const output = document.getElementById("output");
  if (runBtn && editor && output) {
    runBtn.addEventListener("click", function () { output.innerHTML = editor.value; });
    const resetBtn = document.getElementById("resetCode");
    if (resetBtn) {
      resetBtn.addEventListener("click", function () { editor.value = ""; output.innerHTML = ""; });
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

  function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    if (!field) return;
    field.classList.add("has-error");
    const err = field.querySelector(".field__error");
    if (err) err.textContent = message;
  }

  function clearErrors(form) {
    form.querySelectorAll(".field").forEach(function (f) { f.classList.remove("has-error"); });
  }

  /* Enhanced Form Validation Rules */
  function isEmail(value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }

  function validatePasswordStrength(password) {
    if (password.length < 6) {
      return "Password must be at least 6 characters long.";
    }
    if (!/\d/.test(password)) {
      return "Password must contain at least one number.";
    }
    if (!/[!@#$%^&*(),.?":{}|<>_]/.test(password)) {
      return "Password must contain at least one special symbol.";
    }
    return null; // Passes strength test
  }

  /* ----------------------------------------------------------
     2. Form Submit & Validation Logic
  ---------------------------------------------------------- */
  const loginForm = document.getElementById("loginForm");
  if (loginForm) {
    loginForm.addEventListener("submit", function (e) {
      e.preventDefault();
      clearErrors(loginForm);
      const email = loginForm.email.value.trim();
      const password = loginForm.password.value;
      let ok = true;

      if (!isEmail(email)) {
        showError("f-email", "Enter a valid email address.");
        ok = false;
      }

      const pwdError = validatePasswordStrength(password);
      if (pwdError) {
        showError("f-password", pwdError);
        ok = false;
      }

      if (ok) window.location.href = "dashboard.html";
    });
  }

  const signupForm = document.getElementById("signupForm");
  if (signupForm) {
    signupForm.addEventListener("submit", function (e) {
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

      const pwdError = validatePasswordStrength(password);
      if (pwdError) {
        showError("f-password", pwdError);
        ok = false;
      } else if (confirm !== password) {
        showError("f-confirm", "Passwords do not match.");
        ok = false;
      }

      if (ok) window.location.href = "choose-topic.html";
    });
  }
})();
