// import class Vapor.Route
// import class Vapor.Routes
import Vapor

import protocol SwanUI.ActionStorage
import protocol SwanUI.AsyncResponse

extension Routes: ActionStorage {
    func register<Response>(endpoint: String, action: @Sendable @escaping () async -> Response)
    where Response: AsyncResponse {
        self.post("\(endpoint)") { _ in
            await action().toVaporEncodable()
        }
    }
}

extension AsyncResponse {
    func toVaporEncodable() -> VaporResponse {
        .init(asyncResponse: self)
    }
}

struct VaporResponse: AsyncResponseEncodable {
    var asyncResponse: AsyncResponse
    func encodeResponse(for request: Vapor.Request) async throws -> Vapor.Response {
        .init(status: .ok)
    }
}
