import Combine
import Foundation

let myNotification = Notification.Name("MyNotification")
let publisher =
    NotificationCenter.default.publisher(for: myNotification)

final class Receiver {
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        publisher
            .sink { value in
                print("Received value:", value)
            }
            .store(in: &subscriptions)
    }
}

let receiver = Receiver()
//NotificationCenter.default.post(Notification(name: myNotification))
NotificationCenter.default.post(Notification(name: myNotification, object: "test", userInfo: ["test": 2]))
