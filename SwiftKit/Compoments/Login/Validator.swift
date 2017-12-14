//
// Created by xnxin on 2017/12/14.
// Copyright (c) 2017 xnxin. All rights reserved.
//

import Foundation

protocol Validator {
	associatedtype T
	static func validator(_ input:T) -> Bool
}