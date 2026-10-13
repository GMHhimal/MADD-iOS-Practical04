// SE4041 Practical 04 — Student Marks App
// Student: G M H Himal | IT23152632
import SwiftUI

struct ContentView: View {
    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""
    @State private var showInputAlert = false
    @State private var inputAlertMessage = ""

    @FocusState private var focusedField: InputField?

    private enum InputField: Hashable {
        case name
        case mark
    }

    private var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                inputForm

                HStack {
                    Label("Passed Students: \(passedCount)", systemImage: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Total: \(students.count)")
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                .padding(.bottom, 12)

                Divider()

                if students.isEmpty {
                    emptyState
                } else {
                    List(students) { student in
                        NavigationLink {
                            StudentDetailView(student: student)
                        } label: {
                            StudentRowView(student: student)
                        }
                    }
                    .listStyle(.plain)
                }

                Text("G M H Himal  •  IT23152632")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 8)
            }
            .navigationTitle("SE4041 Marks")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { focusedField = nil }
                }
            }
            .alert("Invalid Student Details", isPresented: $showInputAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(inputAlertMessage)
            }
        }
    }

    private var inputForm: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Add a Student", systemImage: "person.badge.plus")
                .font(.title3.weight(.semibold))

            TextField("Student Name", text: $studentName)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()
                .focused($focusedField, equals: .name)
                .submitLabel(.next)
                .onSubmit { focusedField = .mark }
                .accessibilityLabel("Student Name")

            TextField("Mark (0–100)", text: $markText)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .focused($focusedField, equals: .mark)
                .accessibilityLabel("Mark between 0 and 100")

            Button(action: addStudent) {
                Label("Add Student", systemImage: "plus.circle.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Spacer()
            Image(systemName: "list.bullet.clipboard")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)
            Text("No Students Yet")
                .font(.headline)
            Text("Enter a name and mark, then tap Add Student.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
    }

    private func addStudent() {
        do {
            let student = try StudentInputValidator.makeStudent(
                name: studentName,
                markText: markText
            )
            students.append(student)
            studentName = ""
            markText = ""
            focusedField = nil
        } catch {
            inputAlertMessage = error.localizedDescription
            showInputAlert = true
        }
    }
}
