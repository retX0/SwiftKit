//
//  APIError.swift
//  BCLifeM
//
//  Created by xnxin on 2016/11/9.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import Foundation
import Moya

typealias ServerError = (statusCode:Int,description: String)

public enum APPError:Swift.Error {
    
    /// no response in limit time.
    case timeout
    
    /// status code not in 200..<300.
    case invalidResponse(URLResponse)
    
    /// no internet connected.
    case networkNotAvaiable

    /// cannot convert to json.
    case jsonDecoded
    
    /// server thrown error.
    case serverThrown(Int, String)
    
    /// urlsession catch error.
    case underlying(Swift.Error)
    
    /// show alert view to display error.
    case alert(Swift.Error)

}

extension APPError {
    
    public var localizedDescription: String {
        switch self {
        case .timeout:
            return "请求超时"
        case .invalidResponse(let response):
            
            guard let resp = response as? HTTPURLResponse else {
                return "服务器返回错误"
            }
            return "服务器返回错误, 状态码:\(resp.statusCode)"
        case .networkNotAvaiable:
            return "网络不可用"
        case .jsonDecoded:
            return "服务器错误"
        case .serverThrown(let code, let msg):
            return "\(msg),状态码:\(code)"
        case .underlying(let error):
            return error.localizedDescription
        case .alert(let error):
            return "\(error)"
        }
    }
}

extension APPError {
    
    var errorCode: Int {
        switch self {
        case .invalidResponse(let response):
            guard let httpResonse = response as? HTTPURLResponse else {
                return -1
            }
            return httpResonse.statusCode
        default:
            return -1
        }
    }
}

extension APPError {
    
    static func error(with error:Swift.Error) -> APPError {
        
       
        if let moyaError = error as? Moya.MoyaError {
            return self.moya(with: moyaError)
        }
        
        if let appError = error as? APPError {
            return appError
        }

//        if let actionError = error as? ActionError {
//            switch actionError {
//                case .underlyingError(let error):
//                if (error is APPError) {
//                    return error as! APPError
//                }
//                if let moyaError = error as? Moya.MoyaError {
//                    return self.moya(with: moyaError)
//                }
//                fallthrough
//            default:
//                return self.error(with: error as NSError)
//            }
//        }
        return self.error(with: error as NSError)
    }
    
    static func moya(with error: Moya.MoyaError) -> APPError {
        
        switch error {
        case .jsonMapping:
            return .jsonDecoded
        case .underlying(let error):
            return self.error(with: error as! NSError)
        case .statusCode(let resp):
            return .invalidResponse(resp.response!)
        default:
            return .underlying(error)
        }
    }
    
    static func error(with error:NSError) -> APPError {
        
        guard error.domain == NSURLErrorDomain else {
            return .underlying(error)
        }
        
        switch error.code {
        case NSURLErrorTimedOut:
            return .timeout
        case NSURLErrorNotConnectedToInternet:
            return .networkNotAvaiable
        default:
            return .underlying(error)
        }
    }
}

extension APPError: Equatable {
    
    public static func ==(lhs: APPError, rhs: APPError) -> Bool {
        let le = lhs as NSError
        let re = rhs as NSError
        
        return le.isEqual(re)
    }
}
