# SE4041 Practical 04 — G M H Himal (IT23152632)

This repository contains a **ready-to-open Xcode SwiftUI project** for the final Student Marks App task.
The original practical instructions are preserved in `README.md`.

## Open in Xcode

1. Open `MarksApp/MarksApp.xcodeproj` (not the `README.md`).
2. Select the `MarksApp` scheme and an **iPhone Simulator** in Xcode.
3. Press `Command + R` to build/run (first launch may take longer).
4. To view all students, add them using the name and mark fields. Students start empty by design.

## Features

- SwiftUI app `@main` entry point and `ContentView`.
- Form fields using `@State`, `TextField`, bindings and a Button.
- Input validation: rejects blank/whitespace names, non-integer marks, and marks outside 0...100.
- `Student: Identifiable` with a `passed` computed property (mark >= 50).
- `List` with reusable `StudentRowView` and pass/fail text + color.
- `NavigationStack` and `NavigationLink` to `StudentDetailView`.
- Automatically recalculated count of passed students.
- Optional `grade` challenge completed.

## Test in Simulator

| Input name | Mark | Expected |
|---|---:|---|
| Amal | 72 | Added, Pass, B+ |
| Nimali | 45 | Added, Fail, C |
| (blank) | 60 | Rejected |
| Ruwan | abc | Rejected |
| Ruwan | 120 | Rejected |
| Test Zero | 0 | Added, Fail |
| Test Forty Nine | 49 | Added, Fail |
| Test Fifty | 50 | Added, Pass |
| Test Hundred | 100 | Added, Pass |
| Test Negative | -1 | Rejected |

The input fields are cleared after every successful addition. The app does not persist student records when it restarts, because the lab specifically requests `@State` (in-memory state).

## Screenshots

Capture these **from the running iOS Simulator**, not mockups:

- `screenshots/01-Student-List.png`: list with passing and failing students, input fields, passed count.
- `screenshots/02-Student-Details.png`: a selected student's details with SF Symbol and pass/fail.

The `screenshots` folder intentionally starts empty. Do not submit fake screenshots; add your own from Simulator.

## Learning exercises

`EXERCISE_WALKTHROUGH.md` maps Exercises 01–08 to a reproducible set of SwiftUI snippets. The final app combines those concepts.

## GitHub

Add this `MarksApp` folder and guide **inside your own Practical04 repository**.
Do not replace the `.git` directory of a cloned repository with files from a ZIP.
Use the repository/branch supplied by your instructor for GitHub Classroom submission.
