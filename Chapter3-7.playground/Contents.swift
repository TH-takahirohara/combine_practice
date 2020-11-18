import Combine

let subject = PassthroughSubject<String, Never>()
let publisher = subject.eraseToAnyPublisher()

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
subject.send("あ")
subject.send("い")
subject.send("う")
subject.send("え")
subject.send("お")
