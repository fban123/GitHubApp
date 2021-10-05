import UIKit
import Combine

extension UITextField {

    var rxText: AnyPublisher<String, Never> {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

