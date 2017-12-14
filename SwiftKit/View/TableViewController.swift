//
//  BaseTableViewController.swift
//  Client
//
//  Created by xnxin on 2016/11/23.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import RxSwift
import QMUIKit

open class TableViewController: QMUICommonTableViewController {

	//MARK : Varibles

	open override func loadView() {
		super.loadView()
	}


	override open func viewDidLoad() {
		super.viewDidLoad()

		guard tableView.tableFooterView == nil else {
			return
		}
		tableView.tableFooterView = UIView()
	}

	deinit {
//        log("\(String(describing: self)) deinited")
	}
}

