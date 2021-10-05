import Combine
import UIKit

public struct UIControlPublisher<Control: UIControl>: Publisher {

    public typealias Output = Control
    public typealias Failure = Never

    let control: Control
    let controlEvents: UIControl.Event

    public init(control: Control, events: UIControl.Event) {
        self.control = control
        self.controlEvents = events
    }

    public func receive<S>(
        subscriber: S
    ) where S: Subscriber, S.Failure == UIControlPublisher.Failure, S.Input == UIControlPublisher.Output {
        let subscription = UIControlSubscription(subscriber: subscriber, control: control, event: controlEvents)
        subscriber.receive(subscription: subscription)
    }

}
