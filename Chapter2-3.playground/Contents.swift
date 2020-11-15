import Combine

let subject = PassthroughSubject<String, Never>()

final class Receiver {
    let subscription1: AnyCancellable
    let subscription2: AnyCancellable

    init() {
        subscription1 = subject
            .sink { value in
                print("[1] Received value:", value)
            }
        subscription2 = subject
            .sink { value in
                print("[2] Received value:", value)
            }
    }
}

let receiver = Receiver()
subject.send("あ")
subject.send("い")
subject.send("う")
receiver.subscription1.cancel()
subject.send("え")
subject.send("お")
