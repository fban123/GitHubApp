import Combine
import UIKit

public class UIControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription where
    SubscriberType.Input == Control {

    private var subscriber: SubscriberType?
    private let control: Control

    public init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }

    public func request(_ demand: Subscribers.Demand) {}

    public func cancel() {
        subscriber = nil
    }

    @objc private func eventHandler() {
        _ = subscriber?.receive(control)
    }

}
