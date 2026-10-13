# Exercise walkthrough (Exercises 01–08)

The final app is in `MarksApp/MarksApp.xcodeproj`. Exercises 01–08 are incremental
experiments from the original `README.md`; replacing the final `ContentView.swift`
with a starter example will temporarily remove the finished app.
**Use a separate temporary SwiftUI project/playground for experiments**, or
use the snippets as learning notes. Keep the final app code unchanged for submission.

1. **Exercise 01 — First View:** `Text("Welcome to SE4041")` in a SwiftUI `View`.
2. **Exercise 02 — Modifiers:** `.font(.title).bold().foregroundStyle(.blue).padding()`.
   Compare `.padding().background(.orange)` vs `.background(.orange).padding()`.
3. **Exercise 03 — Stacks:** combine `VStack`, `HStack`, `Spacer`, and
   `Image(systemName: "graduationcap.fill")`.
4. **Exercise 04 — State and Button:**
   ```swift
   @State private var count = 0
   Text("Button tapped \(count) times")
   Button("Tap Me") { count += 1 }
   Button("Reset") { count = 0 }
   ```
5. **Exercise 05 — TextField and Binding:**
   ```swift
   @State private var name = ""
   TextField("Enter student name", text: $name)
   Text(name.isEmpty ? "Enter your name above" : "Welcome, \(name)")
   ```
6. **Exercise 06 — Model:** see `Student.swift` (`Identifiable`, stored/computed properties).
7. **Exercise 07 — List:** see `List(students)` in `ContentView.swift`; the row is
   implemented by reusable `StudentRowView.swift`.
8. **Exercise 08 — Navigation:** see `NavigationStack` and `NavigationLink` in
   `ContentView.swift`, and `StudentDetailView.swift`.

The final task then adds validation, the Add Student action, pass/fail formatting,
live passing count, and the optional grade property.
