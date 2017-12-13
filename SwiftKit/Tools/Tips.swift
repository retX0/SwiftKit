//
//  Tips.swift
//
//
//  Created by xnxin on 2017/6/5.
//  Copyright © 2017年 com.xnxin. All rights reserved.
//

import Foundation

class Tips {
    
    enum `Type` {
        case info
        case success
        case error
        case loading
    }
    
    ///如果view是空，放到windows上
    class func show(_ type: Type, title: String, detail: String? = nil, on aView: UIView? = nil) {
        
        var view = aView
        
        if view == nil {
            view = UIApplication.shared.keyWindow
        }
        
        guard let tipsView = view else {
            return
        }
        
        let tips = QMUITips.createTips(to: tipsView)
        
        switch type {
        case .info:
            if let detail = detail {
                tips?.showInfo(title, detailText: detail)
            }
            tips?.showInfo(title)
        case .success:
            if let detail = detail {
                tips?.showSucceed(title, detailText: detail)
            }
            tips?.showSucceed(title)
        case .error:
            if let detail = detail {
                tips?.showError(title, detailText: detail)
            }
            tips?.showError(title)
        case .loading:
            if let detail = detail {
                tips?.showLoading(title, detailText: detail)
            }
            tips?.showLoading()
        }
    }
    
    class func showAutoHide(_ type: Type, title: String, detail: String? = nil, on aView: UIView? = nil, after delay: TimeInterval = 1.5, compeletion: ((Void) -> (Void))? = nil) {
        
        var view = aView
        
        if view == nil {
            view = UIApplication.shared.keyWindow
        }
        
        guard let tipsView = view else {
            return
        }
        
        let tips = QMUITips.createTips(to: tipsView)
        
        switch type {
        case .info:
            if let detail = detail {
                
                tips?.showInfo(title, detailText: detail, hideAfterDelay: delay)
            }
            tips?.showInfo(title, hideAfterDelay: delay)
        case .success:
            if let detail = detail {
                tips?.showSucceed(title, detailText: detail, hideAfterDelay: delay)
            }
            tips?.showSucceed(title, hideAfterDelay: delay)
        case .error:
            if let detail = detail {
                tips?.showError(title, detailText: detail, hideAfterDelay: delay)
            }
            tips?.showError(title, hideAfterDelay: delay)
        case .loading:
            if let detail = detail {
                tips?.showLoading(title, detailText: detail, hideAfterDelay: delay)
            }
            tips?.showLoading(title)
        }
        
        if let closure = compeletion {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                closure()
            }
        }
    }
}
