// ==================================================
// PLACEMENT RESULT — drives test-result.html
//
// Reads the PlacementResultDTO that placement-test.js stashed
// in sessionStorage right after submitting, and renders the
// per-subject score cards + recommended path. No network call
// here — if the user lands on this page without having just
// taken the test (refresh, direct link), it falls back to a
// friendly message instead of fake data.
// ==================================================

(function () {

    const SUBJECT_CLASS = {
        HTML: "is-html",
        CSS: "is-css",
        JS: "is-js"
    };

    const SUBJECT_ICON = {
        HTML: "&lt;/&gt;",
        CSS: "#",
        JS: "JS"
    };

    const resultGrid = document.getElementById("result-grid");
    const pathList = document.getElementById("path-list");

    function render() {
        const raw = sessionStorage.getItem("placementResult");
        if (!raw) {
            showNoResult();
            return;
        }

        let data;
        try {
            data = JSON.parse(raw);
        } catch (err) {
            showNoResult();
            return;
        }

        const results = data.results || [];
        if (!results.length) {
            showNoResult();
            return;
        }

        resultGrid.innerHTML = "";
        pathList.innerHTML = "";

        results.forEach(r => {
            const cls = SUBJECT_CLASS[r.subjectCode] || "";

            resultGrid.insertAdjacentHTML("beforeend", `
                <div class="card result-card ${cls}">
                    <h3>${r.subjectName}</h3>
                    <div class="score">${r.scorePercent}%</div>
                    <div class="score-bar">
                        <div class="score-bar__fill" style="width: ${r.scorePercent}%;"></div>
                    </div>
                </div>
            `);

            pathList.insertAdjacentHTML("beforeend", `
                <div class="path-item">
                    <div class="path-item__icon ${cls}">${SUBJECT_ICON[r.subjectCode] || r.subjectCode}</div>
                    <div class="path-item__info">
                        <strong>${r.subjectName}</strong>
                        <span class="path-item__level">Start from Level ${r.placedLevelNumber}</span>
                    </div>
                </div>
            `);
        });

        // One-shot: don't let a page refresh re-show the same result as if it
        // were a fresh submission.
        sessionStorage.removeItem("placementResult");
    }

    function showNoResult() {
        resultGrid.innerHTML = `<p>No recent placement test result to show. <a href="genre-test.html">Take the test</a> or <a href="choose-topic.html">jump straight into a topic</a>.</p>`;
        pathList.innerHTML = "";
    }

    render();

})();