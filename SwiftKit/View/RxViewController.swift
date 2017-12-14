//
//  BaseRxViewController.swift
//  Client
//
//  Created by xnxin on 2016/11/25.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import RxSwift

open class RxViewController: ViewController, RxDesignable {

    //MARK: -
    //MARK: outlet
    public private(set) var disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: life cycle
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: -
    //MARK: action
    open func bindViewModel() {}
    
    open func rebindViewModel() {
        
        disposeBag = DisposeBag()
        bindViewModel()
    }
    
    //MARK: -
    //MARK: override method
    
    override open func loadView() {
        super.loadView()
        
        rx.sentMessage(#selector(UIViewController.viewDidLoad))
            .subscribe(onNext: {[weak self] _ in
                self?.bindViewModel()
            }).disposed(by: disposeBag)
    }
}
