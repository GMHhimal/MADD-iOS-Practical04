// SE4041 Practical 04 — Input validation
// Student: G M H Himal | IT23152632
import Foundation

enum StudentInputError: LocalizedError {
    case emptyName
    case invalidMark
    case outOfRange

    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "Please enter a student name."
        case .invalidMark:
            return "Enter a whole-number mark, for example 72."
        case .outOfRange:
            return "The mark must be between 0 and 100."
        }
    }
}

enum StudentInputValidator {
    static func makeStudent(name: String, markText: String) throws -> Student {
        let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cleanedName.isEmpty else {
            throw StudentInputError.emptyName
        }

        let cleanedMark = markText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let mark = Int(cleanedMark) else {
            throw StudentInputError.invalidMark
        }
        guard (0...100).contains(mark) else {
            throw StudentInputError.outOfRange
        }

        return Student(name: cleanedName, mark: mark)
    }
}
