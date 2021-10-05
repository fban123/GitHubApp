import Foundation

extension String {

    func formatDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        guard let date = date else { return nil }
        dateFormatter.dateFormat = "MMM d, y"
        return dateFormatter.string(from: date)
    }

}
