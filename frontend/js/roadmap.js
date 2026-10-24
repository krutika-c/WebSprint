async function loadLevels() {

    const container = document.getElementById("levels-container");

    if (!container) {
        console.error("levels-container not found");
        return;
    }

    // Get subject code from the HTML page
    const subjectCode = document.body.dataset.subject;

    if (!subjectCode) {
        console.error("Subject code not found");
        return;
    }

    try {

        const levels = await apiFetch(
            `/api/subjects/${subjectCode}/levels`
        );

        container.innerHTML = "";

        levels.forEach(level => {

            const step = document.createElement("a");

            step.className = "step";

            step.href = `lesson.html?levelId=${level.id}`;

            step.innerHTML = `
                <span class="step__num">
                    ${level.levelNumber}
                </span>

                <div class="step__body">
                    <h4>${level.title}</h4>
                    <p>${level.difficulty}</p>
                </div>

                <span class="step__status">
                    Start
                </span>
            `;

            container.appendChild(step);
        });

    } catch (error) {

        console.error("Failed to load levels:", error);

        container.innerHTML = `
            <p>Unable to load levels. Please try again.</p>
        `;
    }
}

document.addEventListener("DOMContentLoaded", loadLevels);