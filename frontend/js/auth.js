/* ----------------------------------------------------------
   auth.js — the ONE place that knows where the login token lives.

   "Remember me" ticked  -> localStorage   (survives closing the browser)
   "Remember me" unticked -> sessionStorage (erased when the tab closes)

   Load this BEFORE js/script.js and any other script that touches the token:
     <script src="js/auth.js"></script>
---------------------------------------------------------- */
(function () {
  "use strict";

  var TOKEN_KEY = "token";

  // Save a token in the right place. Always wipes the other storage first,
  // so an old token can't linger there and win in getToken().
  window.setToken = function (token, remember) {
    window.clearToken();
    (remember ? localStorage : sessionStorage).setItem(TOKEN_KEY, token);
  };

  // Look in both places. Returns "" when nobody is logged in.
  window.getToken = function () {
    return localStorage.getItem(TOKEN_KEY) || sessionStorage.getItem(TOKEN_KEY) || "";
  };

  // Remove the token from both places (logout, account deletion, expired token).
  window.clearToken = function () {
    localStorage.removeItem(TOKEN_KEY);
    sessionStorage.removeItem(TOKEN_KEY);
  };

  // Call at the top of any page that needs a logged-in user.
  window.requireLogin = function () {
    if (!window.getToken()) {
      window.location.href = "login.html";
    }
  };

  window.logout = function () {
    window.clearToken();
    window.location.href = "login.html";
  };
})();