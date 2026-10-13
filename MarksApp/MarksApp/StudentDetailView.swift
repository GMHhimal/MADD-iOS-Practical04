// SE4041 Practical 04 — Student detail screen
// Student: G M H Himal | IT23152632
import SwiftUI

struct StudentDetailView: View {
    let student: Student

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 84))
                    .foregroundStyle(.blue)
                    .accessibilityHidden(true)

                Text(student.name)
                    .font(.largeTitle.weight(.bold))
                    .multilineTextAlignment(.center)

                VStack(spacing: 14) {
                    LabeledContent("Mark", value: "\(student.mark) / 100")
                    Divider()
                    LabeledContent("Result") {
                        Text(student.passed ? "PASS" : "FAIL")
                            .bold()
                            .foregroundStyle(student.passed ? Color.green : Color.red)
                    }
                    Divider()
                    LabeledContent("Grade", value: student.grade)
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
