//
//  RxDesignableTableViewController.swift
//  Consumer
//
//  Created by xnxin on 2017/5/15.
//  Copyright © 2017年 cn.ssstc.consumer. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxDesignableTableViewController: SMCommonViewController, Reactable {

    //MARK: -
    //MARK: outlet
    
    private(set) var disposeBag = DisposeBag()
    @IBOutlet var tableView: UITableView!
    
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
