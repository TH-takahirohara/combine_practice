import Combine

let publisher = (1 ... 5).publisher

final class Receiver {
    var subscription = Set<AnyCancellable>()
    
    init() {
        publisher
            .sink(receiveCompletion: { completion in
                print("Received completion:", completion)
            }, receiveValue: { value in
                print("Received value:", value)
            })
            .store(in: &subscription)
    }
}

let receiver = Receiver()
