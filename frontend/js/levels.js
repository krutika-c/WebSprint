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
        levels.forEach((level, index) => {

            const step =
                document.createElement("a");

            // ---------------------------------------
            // LOCK STATUS
            //
            // Level 1 is always open. Every level after
            // that stays locked until the quiz on the
            // level right before it has been completed.
            // ---------------------------------------

            const completed =
                isLevelCompleted(level.id);

            const locked =
                index > 0 &&
                !isLevelCompleted(levels[index - 1].id);

            step.className =
                "step" +
                (completed ? " is-done" : "") +
                (locked ? " is-locked" : "");


            // IMPORTANT:
            // Pass both levelId and subject
            const lessonUrl =
                `lesson.html?levelId=${level.id}&subject=${subject}`;

            if (locked) {

                // Locked steps aren't real links —
                // clicking should do nothing.

                step.href = "#";

                step.addEventListener(
                    "click",
                    event => {
                        event.preventDefault();
                    }
                );

                step.setAttribute(
                    "aria-disabled",
                    "true"
                );

            }

            else {

                step.href = lessonUrl;

            }

            console.log(
                "Creating step:",
                lessonUrl,
                "locked:",
                locked,
                "completed:",
                completed
            );


            // NOTE: built with createElement + textContent
            // (not innerHTML) so level titles/difficulty
            // text is always shown as plain text, never
            // parsed as markup.

            const numSpan =
                document.createElement("span");

            numSpan.className = "step__num";

            numSpan.textContent =
                level.levelNumber;


            const body =
                document.createElement("div");

            body.className = "step__body";

            const bodyTitle =
                document.createElement("h4");

            bodyTitle.textContent =
                level.title;

            const bodyDifficulty =
                document.createElement("p");

            bodyDifficulty.textContent =
                level.difficulty;

            body.appendChild(bodyTitle);
            body.appendChild(bodyDifficulty);


            const status =
                document.createElement("span");

            status.className =
                "step__status" +
                (completed ? " is-done" : "") +
                (locked ? " is-locked" : "");

            status.textContent =
                locked
                    ? "🔒 Locked"
                    : completed
                        ? "✓ Done"
                        : "Start";


            step.appendChild(numSpan);
            step.appendChild(body);
            step.appendChild(status);

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