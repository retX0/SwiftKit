//
//  API.swift
//  Farm
//
//  Created by hx on 2016/12/21.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import Foundation
import Moya

enum API {
    case login(Requestable)
}

extension API: TargetType {
    
    var headers: [String : String]? {
        return nil;
    }
    
    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }

    /// The method used for parameter encoding.

    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        
        switch self {
        case .login:
            return .post
        }
    }
    
    var parameters: [String : Any]? {
        switch self {

        case .login(let model):
            return model.toJSON()
        }
    }
    
    var sampleData: Data {
        
        switch self {
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
//        case .uploadFile( _ , let images):
//
//            var data = [MultipartFormData]()
//            for image in images {
//                if let imageData = MultipartFormData(image: image) {
//                    data.append(imageData)
//                }
//            }
//            return .upload(.multipart(data))
        default:
            return .requestPlain
        }
    }
    
    
    var isMock: Bool {
        return false
    }
}
