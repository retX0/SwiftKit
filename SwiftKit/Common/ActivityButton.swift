
import UIKit
import RxSwift
import RxCocoa
import QMUIKit


struct ActivityButtonUX {
    //FIXME:
    static let tintColor = UIColor.red
}

open class ActivityButton: QMUIButton {
    
    //MARK: -
    //MARK: outlet && variables
    
    open var isShownActivity = false {
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
    
    public lazy var activityView: UIActivityIndicatorView = {
        
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityView.color = ActivityButtonUX.tintColor
        activityView.hidesWhenStopped = true
        activityView.isUserInteractionEnabled = false
        return activityView
    }()
    
    //MARK: -
    //MARK: life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    
    //MARK: -
    //MARK: override method

    open override func layoutSubviews() {
        super.layoutSubviews()
        
        let x = (self.bounds.size.width - activityView.bounds.size.width)/2
        let y = (self.bounds.size.height - activityView.bounds.size.width)/2
        activityView.frame = CGRect(origin: CGPoint(x: x, y:y), size: activityView.bounds.size)
    }
    
    //MARK: -
    //MARK: action
    
    
    
    //MARK: -
    //MARK: private method
    
    
    open func setupUI() {
        
        self.addSubview(activityView)
    }
    
    
    
}

public extension Reactive where Base: ActivityButton {
    
    public var isShownActivity: Binder<Bool> {
        return Binder(self.base) { button, value in
            button.isShownActivity = value
        }
    }
}
