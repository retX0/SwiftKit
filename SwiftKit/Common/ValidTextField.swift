//
//  ValidTextField.swift
//  ValidTextField
//
//  Created by xnxin on 2017/5/10.
//  Copyright © 2017年 com.xnxin. All rights reserved.
//

import UIKit
import QMUIKit
import RxSwift
import RxCocoa
import QMUIKit

class ValidTextField: QMUITextField {

    
    
    //MARK: -
    //MARK: outlet && variables
    
    var rightInset:CGFloat = 8 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var error: String? {
        
        didSet {
            guard let error = error else {
                rightViewMode = .never
                return
            }
            popupView.textLabel.text = error
            rightViewMode = .always
        }
    }
    
    private lazy var popupView: QMUIPopupContainerView = {
        let view = QMUIPopupContainerView()
        view.automaticallyHidesWhenUserTap = true
        view.preferLayoutDirection = .below
        view.didHideBlock = { [weak self] _ in
            self?.button.isEnabled = true
        }
        return view
    }()
    
    private lazy var button: QMUIButton = {
        let button = QMUIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        return button
    }()
    
    private lazy var warningImg: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "icon_warn.png"))
        return view
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
        

        
        popupView.maximumWidth = self.frame.size.width
        popupView.layoutWithTargetRect(inScreenCoordinate: warningImg.convert(warningImg.bounds, to: UIApplication.shared.keyWindow))
    }
    
    //MARK: -
    //MARK: action
    
    //MARK: -
    //MARK: private method
    
    func setupUI() {
        button.addSubview(warningImg)
        rightView = button;
//        button.addTarget(self, action: #selector(showError), for: .touchUpInside)
    }
    
    func showError() {
        
        if (popupView.isShowing()) {
            popupView.hideWith(animated: true) { [weak self] _ in
                self?.button.isEnabled = true
            }
        } else {
            popupView.showWith(animated: true)  { [weak self] _ in
                self?.button.isEnabled = false
            }

        }
    }
    
}

extension Reactive where Base: ValidTextField {
    
    var error: UIBindingObserver<Base, String?> {
        return UIBindingObserver(UIElement: self.base) { textField, error in
            textField.error = error
        }
    }
}
