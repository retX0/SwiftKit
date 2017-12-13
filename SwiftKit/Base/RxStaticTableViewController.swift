//
//  RxStaticTableViewController.swift
//  Merchant
//
//  Created by xnxin on 2017/6/2.
//  Copyright © 2017年 com.xnxin. All rights reserved.
//

import UIKit
import RxSwift

class RxStaticTableViewController: UITableViewController, Reactable {

    //MARK: -
    //MARK: outlet
    
    private(set) var disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        rx.sentMessage(#selector(viewDidLoad))
            .subscribe(onNext: {[weak self] _ in
                self?.bindViewModel()
            }).addDisposableTo(disposeBag)
        
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
