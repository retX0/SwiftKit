//
//  RxStaticTableViewController.swift
//  Merchant
//
//  Created by xnxin on 2017/6/2.
//  Copyright © 2017年 com.xnxin. All rights reserved.
//

import UIKit
import RxSwift

class RxStaticTableViewController: UITableViewController, RxDesignable {

    //MARK: -
    //MARK: outlet
    
    public private(set) var disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rx.sentMessage(#selector(viewDidLoad))
            .subscribe(onNext: {[weak self] _ in
                self?.bindViewModel()
            }).disposed(by: disposeBag)
        
    }
    
    //MARK: -
    //MARK: action
    
    func bindViewModel() {}
    
    func rebindViewModel() {
        disposeBag = DisposeBag()
        bindViewModel()
    }
    
    //MARK: -
    //MARK: override method

}
