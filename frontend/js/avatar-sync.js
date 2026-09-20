// ==================================================
// AVATAR SYNC (shared across every page)
//
// The Settings/Profile page lets people pick a preset avatar.
// That choice is stored in localStorage (there's no image-upload
// backend yet), so this tiny script's only job is: on every page
// that shows the little avatar circle in the top nav, read the
// saved choice and apply it. Without this, the nav avatar was
// stuck on the hardcoded default outside of profile.html.
//
// No dependencies — safe to include on any page, logged in or not.
// ==================================================

(function () {
    "use strict";

    var AVATAR_STORAGE_KEY = "websprint.avatar";
    var INITIALS_STORAGE_KEY = "websprint.initials";

    // Keep this list identical to the one profile.js uses to build
    // the avatar picker grid — profile.js reads it from
    // window.WEBSPRINT_AVATAR_PRESETS so there's only one copy.
    var AVATAR_PRESETS = [
        { id: "default", bg: "linear-gradient(135deg, #8bffb0, #264de4)" },
        { id: "rocket",  bg: "linear-gradient(135deg, #a78bfa, #6d28d9)", glyph: "🚀" },
        { id: "fire",    bg: "linear-gradient(135deg, #ff9a5a, #ff5a8a)", glyph: "🔥" },
        { id: "cat",     bg: "linear-gradient(135deg, #5ad1ff, #1d4ed8)", glyph: "🐱" },
        { id: "bolt",    bg: "linear-gradient(135deg, #ffe08a, #f59e0b)", glyph: "⚡" },
        { id: "blossom", bg: "linear-gradient(135deg, #ff8bd6, #db2777)", glyph: "🌸" },
        { id: "game",    bg: "linear-gradient(135deg, #6ee7b7, #0891b2)", glyph: "🎮" },
        { id: "brain",   bg: "linear-gradient(135deg, #c4b5fd, #4338ca)", glyph: "🧠" }
    ];

    window.WEBSPRINT_AVATAR_PRESETS = AVATAR_PRESETS;

    function applyStoredAvatarToNav() {

        var avatarId = localStorage.getItem(AVATAR_STORAGE_KEY) || "default";
        var initials = localStorage.getItem(INITIALS_STORAGE_KEY) || "CM";

        var preset = AVATAR_PRESETS.filter(function (p) {
            return p.id === avatarId;
        })[0] || AVATAR_PRESETS[0];

        document.querySelectorAll(".profile-avatar--nav").forEach(function (el) {
            el.style.background = preset.bg;
            el.textContent = preset.glyph || initials;
        });

    }

    // Exposed so profile.js can re-run this the instant someone
    // picks a new avatar or saves a new display name, without
    // waiting for a page reload.
    window.WEBSPRINT_APPLY_NAV_AVATAR = applyStoredAvatarToNav;

    document.addEventListener("DOMContentLoaded", applyStoredAvatarToNav);

})();