// SE4041 Practical 04 — Reusable student row
// Student: G M H Himal | IT23152632
import SwiftUI

struct StudentRowView: View {
    let student: Student

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.circle")
                .font(.title2)
                .foregroundStyle(.blue)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(student.name)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(student.passed ? "Pass" : "Fail")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(student.passed ? Color.green : Color.red)
            }

            Spacer()

            Text("\(student.mark)")
                .font(.title3.weight(.semibold))
                .foregroundStyle(student.passed ? Color.green : Color.red)
        }
        .padding(.vertical, 6)
        .accessibilityElement(children: .combine)
    }
}
