//
//  ActivityButton.swift
//  ActivityButtonDemo
//
//  Created by xnxin on 2017/5/9.
//  Copyright © 2017年 com.xnxin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import QMUIKit


struct ActivityButtonUX {
    static let tintColor = UIConstants.tintColor
}

class ActivityButton: QMUIButton {
    
    
    //MARK: -
    //MARK: outlet && variables
    
    var isShownActivity = false {
        willSet {
            
            guard newValue != isShownActivity else {
                return
            }
            
            isUserInteractionEnabled = !newValue
            
            guard newValue == true else {
                
                if let titleLabel = titleLabel {
                    addSubview(titleLabel)
                }
                if let imageView = imageView {
                    addSubview(imageView)
                }
                activityView.stopAnimating()
                
                setNeedsLayout()
                return
            }
            
            titleLabel?.removeFromSuperview()
            imageView?.removeFromSuperview()
            activityView.startAnimating()
            
            setNeedsLayout()
        }
    }
    
    lazy var activityView: UIActivityIndicatorView = {
        
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityView.color = ActivityButtonUX.tintColor
        activityView.hidesWhenStopped = true
        activityView.isUserInteractionEnabled = false
        return activityView
    }()
    
    //MARK: -
    //MARK: life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    
    //MARK: -
    //MARK: override method

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let x = (self.bounds.size.width - activityView.bounds.size.width)/2
        let y = (self.bounds.size.height - activityView.bounds.size.width)/2
        activityView.frame = CGRect(origin: CGPoint(x: x, y:y), size: activityView.bounds.size)
    }
    
    //MARK: -
    //MARK: action
    
    
    
    //MARK: -
    //MARK: private method
    
    
    func setupUI() {
        
        self.addSubview(activityView)
    }
    
    
    
}

extension Reactive where Base: ActivityButton {
    
    var isShownActivity: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { button, value in
            button.isShownActivity = value
        }
    }
}
