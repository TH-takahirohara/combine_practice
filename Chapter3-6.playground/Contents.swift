import Combine

let subject = CurrentValueSubject<String, Never>("A")

final class Receiver {
    var subscriptions = Set<AnyCancellable>()

    init() {
        subject
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
print("Current value:", subject.value)
