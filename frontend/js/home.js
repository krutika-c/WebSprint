async function loadSubjects() {
    try {
        const subjects = await apiFetch("/api/subjects");

        console.log(subjects);

    } catch (error) {
        console.error(error);
    }
}

loadSubjects();