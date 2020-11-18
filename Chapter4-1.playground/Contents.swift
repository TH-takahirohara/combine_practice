import Combine

final class Model {
    @Published var value: String = "0"
}

let model = Model()

final class ViewModel {
    var text: String = "" {
        didSet {
            print("didset text:", text)
        }
    }
}

final class Receiver {
    var subscriptions = Set<AnyCancellable>()
    let viewModel = ViewModel()
    
    init() {
        model.$value
            .assign(to: \.text, on: viewModel)
            .store(in: &subscriptions)
    }
}

let receiver = Receiver()
model.value = "1"
model.value = "2"
model.value = "3"
model.value = "4"
model.value = "5"
