import Combine

let subject = PassthroughSubject<String, Never>()

final class SomeObject {
    var value: String = "" {
        didSet {
            print("didSet value:", value)
        }
    }
}

final class Receiver {
    var subscriptions = Set<AnyCancellable>()
    let object = SomeObject()
    
    init() {
        subject
            .assign(to: \.value, on: object)
            .store(in: &subscriptions)
    }
}

let receiver = Receiver()
subject.send("あ")
subject.send("い")
subject.send("う")
subject.send("え")
subject.send("お")
