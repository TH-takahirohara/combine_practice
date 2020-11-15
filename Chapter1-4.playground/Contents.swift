import Combine

enum MyError: Error {
    case failed
}

let subject = PassthroughSubject<String, MyError>()

subject
    .sink(receiveCompletion: { completion in
        print("Received completion:", completion)
    }, receiveValue: { value in
        print("Received value:", value)
    })

subject.send("あ")
subject.send("い")
subject.send("う")
subject.send("え")
subject.send("お")
subject.send(completion: .failure(.failed))
