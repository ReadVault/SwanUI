struct Action {
    static func empty() -> Action {
        .init()
    }
}

class ActionBuilder: @unchecked Sendable {
    var storage: ActionStorage

    init(storage: ActionStorage) {
        self.storage = storage
    }

    func register<each Input, Output>(action: (repeat each Input) -> Output, on: String) -> Action {
        .init()
    }
}

public protocol ActionStorage {}
public protocol AsyncResponse {}
