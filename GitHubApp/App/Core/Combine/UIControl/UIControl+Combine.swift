import Combine
import UIKit

extension UIControl {

    public func publisher(for events: UIControl.Event) -> UIControlPublisher<UIControl> {
        UIControlPublisher(control: self, events: events)
    }

    public func tap() -> UIControlPublisher<UIControl> {
        publisher(for: .touchUpInside)
    }

    public func throttledTap(for interval: Double = 0.5) -> AnyPublisher<UIControl, Never> {
        tap()
            .throttle(for: .seconds(interval), scheduler: RunLoop.main, latest: true)
            .eraseToAnyPublisher()
    }

}

