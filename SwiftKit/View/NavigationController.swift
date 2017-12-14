//
//  BaseNavigationController.swift
//  XHKit
//
//  Created by xnxin on 2016/10/16.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import QMUIKit

open class NavigationController: QMUINavigationController {
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed=true
            
        }
        else{
            //在栈底
            viewController.hidesBottomBarWhenPushed=false
        }
        super.pushViewController(viewController, animated: animated)
    }
}
