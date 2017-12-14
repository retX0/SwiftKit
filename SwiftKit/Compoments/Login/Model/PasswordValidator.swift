//
// Created by xnxin on 2017/12/14.
// Copyright (c) 2017 xnxin. All rights reserved.
//

import Foundation

struct PasswordValidator: Validator {
	static func validator(_ input: String) -> Bool {
		return input.count > 6
	}
}