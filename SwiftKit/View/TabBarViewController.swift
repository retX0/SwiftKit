//
//  BaseTabBarViewController.swift
//  XHKit
//
//  Created by xnxin on 2016/10/16.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import QMUIKit

open class TabBarViewController: QMUITabBarViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? .default
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.selectedViewController?.supportedInterfaceOrientations ?? .all
    }
    
}

