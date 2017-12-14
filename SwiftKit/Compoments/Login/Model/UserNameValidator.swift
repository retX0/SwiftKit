//
// Created by xnxin on 2017/12/14.
// Copyright (c) 2017 xnxin. All rights reserved.
//

import Foundation

struct UserNameValidator: Validator {
	
	static func validator(_ input: String) -> Bool {
		return input.count >= 4
	}
}