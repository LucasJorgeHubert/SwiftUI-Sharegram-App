import Foundation

public protocol APIRouterProtocol {
    var field: String? { get }
    var param: String { get }
    var path: String { get }
    var object: ModelProtocol? { get }
}
