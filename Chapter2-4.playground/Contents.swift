import Combine

let subject = PassthroughSubject<String, Never>()

final class Receiver {
    var subscriptions = Set<AnyCancellable>()

    init() {
        subject
            .sink { value in
                print("[1] Received value:", value)
            }
            .store(in: &subscriptions)
        subject
            .sink { value in
                print("[2] Received value:", value)
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
