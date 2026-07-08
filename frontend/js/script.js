(function () {
  "use strict";
  /* ----------------------------------------------------------
     1. Inject the shared topbar + sidebar
     Any page with <div id="shell" data-active="dashboard"></div>
     gets the navigation rendered automatically.
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
    form.querySelectorAll(".field").forEach(function (f) {
      f.classList.remove("has-error");
    });
  }
  function isEmail(value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }
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
      if (password.length < 6) {
        showError("f-password", "Password must be at least 6 characters.");
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
      if (password.length < 6) {
        showError("f-password", "Password must be at least 6 characters.");
        ok = false;
      }
      if (confirm !== password) {
        showError("f-confirm", "Passwords do not match.");
        ok = false;
      }
      if (ok) window.location.href = "choose-topic.html";
    });
  }
})();
