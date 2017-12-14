//
//  WebViewController.swift
//  Client
//
//  Created by hx on 2016/12/2.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit

open class WebViewController: ViewController {

    
    //MARK: -
    //MARK: outlet && variables
    
    @IBOutlet public var webView: UIWebView!
    
    open var url: String!
    //MARK: -
    //MARK: life cycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()

//        guard let url = URL(url) else {
//            return
//        }
//        let request = URLRequest(url: url)
//        webView.loadRequest(request)
    }
    
    //MARK: -
    //MARK: override method
    
    //MARK: -
    //MARK: action
    
    //MARK: -
    //MARK: private method

}

//public extension WebViewController: Injectable {
//    typealias T = String
//
//    public func inject(_ url: T) {
//        self.url = url
//    }
//
//    public func assertDependencies() {
//        assert(url != nil)
//    }
//}
