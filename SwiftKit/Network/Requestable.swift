//
//  Requestable.swift
//  Consumer
//
//  Created by xnxin on 2017/5/8.
//  Copyright © 2017年 cn.ssstc.consumer. All rights reserved.
//

import Foundation

protocol Requestable {
    func toJSON() -> [String: Any]?
}
