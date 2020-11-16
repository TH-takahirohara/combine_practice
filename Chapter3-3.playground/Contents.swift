import Combine
import Foundation

let publisher = Timer.publish(every: 1, on: .main, in: .common)

final class Receiver {
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        publisher
            .autoconnect()
            .sink { value in
                print("Received value:", value)
            }
            .store(in: &subscriptions)
    }
}

let receiver = Receiver()
//publisher.connect()
