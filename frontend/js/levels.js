async function loadLevels() {

    const container =
        document.getElementById("levels-container");

    if (!container) {
        console.error("levels-container not found");
        return;
    }

    // Get subject from roadmap page
    const subject =
        document.body.dataset.subject;

    if (!subject) {
        console.error(
            "Subject not specified in body data-subject"
        );
        return;
    }

    console.log("Roadmap subject:", subject);

    try {

        // Get levels for current subject
        const levels =
            await getLevels(subject);

        console.log(
            `${subject} Levels received:`,
            levels
        );

        // Clear old levels
        container.innerHTML = "";

        // Create each level
        levels.forEach(level => {

            const step =
                document.createElement("a");

            step.className = "step";

            // IMPORTANT:
            // Pass both levelId and subject
            step.href =
                `lesson.html?levelId=${level.id}&subject=${subject}`;

            console.log(
                "Creating link:",
                step.href
            );

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

        console.error(
            "Failed to load levels:",
            error
        );

        container.innerHTML = `
            <p>
                Unable to load ${subject} levels.
                Please try again.
            </p>
        `;
    }
}


document.addEventListener(
    "DOMContentLoaded",
    loadLevels
);