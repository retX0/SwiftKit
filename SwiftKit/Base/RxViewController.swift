//
//  BaseRxViewController.swift
//  Client
//
//  Created by xnxin on 2016/11/25.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import RxSwift

class RxViewController: ViewController, Reactable {

    //MARK: -
    //MARK: outlet
    private(set) var disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func loadView() {
        super.loadView()
        
        rx.sentMessage(#selector(UIViewController.viewDidLoad))
            .subscribe(onNext: {[weak self] _ in
                self?.bindViewModel()
            }).addDisposableTo(disposeBag)
    }
}
