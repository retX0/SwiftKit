
import Foundation

public typealias JSON = [String: Any]

public protocol Request {
    func toJSON() -> JSON?
}
