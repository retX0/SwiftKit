//
//  File.swift
//  BCLifeM
//
//  Created by xnxin on 2016/11/9.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import RxSwift

public protocol Viewable {
    
    /// initialize UI compoment in this method
    /// call this method on
    /// init and initWithCoder
    func initializeUI()
}

public protocol RxDesignable {
    
    
    /// all observers has the disposeBag to collect all Observable
    var disposeBag:DisposeBag { get }
    
    /// bind viewModel to view.
    func bindViewModel()
}

public protocol DataFetch {
    /// process data or request data from internet.
    /// override to show the empty view for UI.
    func loading()
    
    /// when fetch data, it`ll automatically call this 
    /// method.
    func done()
}

public protocol Injectable {
    associatedtype T

    func inject(_: T)
    func assertDependencies()
}

public protocol ErrorDisplayable {
    func raise(error:Error)
}
