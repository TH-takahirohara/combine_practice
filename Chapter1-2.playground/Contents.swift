import Combine

let subject = PassthroughSubject<String, Never>()

subject
    .sink { value in
        print("Received value:", value)
    }

subject.send("あ")
subject.send("い")
subject.send("う")
subject.send("え")
subject.send("お")
