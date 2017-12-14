
import Foundation
import Moya

public protocol Server {
    var online: String { get }
    var test: String { get }
}
