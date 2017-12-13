//
//  WebViewController.swift
//  Client
//
//  Created by hx on 2016/12/2.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit

class WebViewController: ViewController {

    
    //MARK: -
    //MARK: outlet && variables
    
    @IBOutlet var webView: UIWebView!
    
    var url: String!
    //MARK: -
    //MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
        
        guard let url = URL(url) else {
            return
        }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
    
    //MARK: -
    //MARK: override method
    
    //MARK: -
    //MARK: action
    
    //MARK: -
    //MARK: private method

}

extension WebViewController: Injectable {
    typealias T = String
    
    func inject(_ url: T) {
        self.url = url
    }
    
    func assertDependencies() {
        assert(url != nil)
    }
}
