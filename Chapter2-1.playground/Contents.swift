import Combine

let subject = PassthroughSubject<String, Never>()

final class Receiver {
    let subscription: AnyCancellable
    
    init() {
        subscription = subject
            .sink { value in
                print("Received value:", value)
            }
    }
}

let receiver = Receiver()

subject.send("あ")
subject.send("い")
subject.send("う")
subject.send("え")
subject.send("お")
