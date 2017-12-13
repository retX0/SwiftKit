//
//  BaseViewController.swift
//  XHKit
//
//  Created by xnxin on 2016/10/16.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit

open class ViewController: UIViewController {

    deinit {
//        log("\(String(describing: self)) deinited")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ErrorDisplayable where Self: ViewController {
    
    func raise(error: Error) {
        
        let title = error.localizedDescription
//        log("\n\n\n\n raise error \(title)")
    }
}


