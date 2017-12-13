//
//  URLAddress.swift
//  BCLifeM
//
//  Created by xnxin on 2016/11/10.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import Foundation
import Moya

private let apiVersion = "v1"

enum Server:String {
    case online = "https://ssstc.cn/business"
    case remoteTest = "https://sixsixthree.org/ssstc"
    
    static var active:Server {
        return .online
    }
}

extension TargetType {
    
    public var baseURL: URL {
        return URL(string:"www.baidu.com")!
    }
}
