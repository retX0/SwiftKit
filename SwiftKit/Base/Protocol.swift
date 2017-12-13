//
//  File.swift
//  BCLifeM
//
//  Created by xnxin on 2016/11/9.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import RxSwift

protocol Viewable {
    
    /// initialize UI compoment in this method
    /// call this method on
    /// init and initWithCoder
    func initializeUI()
}

protocol Reactable {
    
    
    /// all reacrivealbe has the disposeBag to collect all Observerable
    var disposeBag:DisposeBag { get }
    
    /// bind viewmodel to view.
    func bindViewModel()
}

protocol Loadingable {
    
    
    /// process data or request data from internet.
    /// override to show the empry view for UI.
    func loading()
    
    /// when fetch data, it`ll automatically call this 
    /// method.
    func done()
}

protocol Injectable {
    associatedtype T
    func inject(_: T)
    func assertDependencies()
}

protocol ErrorDisplayable {
    
    func raise(error:Error)
    
}
