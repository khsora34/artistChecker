import Foundation
extension String {
    var getAgeFromStringAndFormatToString: String {
        let formatter = ISO8601DateFormatter()
        guard let newDate = formatter.date(from: self) else { return "" }
        let calendar = Calendar.current
        return String(calendar.component(.year, from: newDate))
    }
}
