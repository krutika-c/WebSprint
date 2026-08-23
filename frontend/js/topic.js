async function loadSubjects() {

    const container = document.getElementById("subjects-container");

    if (!container) {
        console.error("subjects-container not found");
        return;
    }

    try {

        const subjects = await apiFetch("/api/subjects");

        console.log("Subjects received:", subjects);

        container.innerHTML = "";

        subjects.forEach(subject => {

            let className = "";
            let icon = "";
            let description = "";
            let buttonClass = "";
            let page = "";

            if (subject.code === "HTML") {

                className = "is-html";
                icon = "</>";
                description =
                    "Learn the structure of the web and build the foundation of every website.";
                buttonClass = "btn--html";
                page = "html-roadmap.html";

            } else if (subject.code === "CSS") {

                className = "is-css";
                icon = "#";
                description =
                    "Style your webpages with colors, fonts and make them beautiful.";
                buttonClass = "btn--css";
                page = "css-roadmap.html";

            } else if (subject.code === "JS") {

                className = "is-js";
                icon = "JS";
                description =
                    "Add interactivity and bring your websites to life with JavaScript.";
                buttonClass = "btn--js";
                page = "js-roadmap.html";
            }

            const card = document.createElement("div");

            card.className = `card topic-card ${className}`;

            card.innerHTML = `
                <div class="topic-icon ${className}">
                    ${icon}
                </div>

                <h3>${subject.name}</h3>

                <p>${description}</p>

                <span class="badge badge--beginner">
                    ⚡ Beginner
                </span>

                <div class="progress">
                    <div class="progress__fill" style="width: 0%"></div>
                </div>

                <div class="progress__meta">
                    <span>Progress</span>
                    <span>0%</span>
                </div>

                <a href="${page}"
                   class="btn ${buttonClass} btn--block">
                    Start Learning →
                </a>
            `;

            container.appendChild(card);
        });

    } catch (error) {

        console.error("Failed to load subjects:", error);

        container.innerHTML = `
            <p>Unable to load subjects. Please try again.</p>
        `;
    }
}

document.addEventListener("DOMContentLoaded", loadSubjects);