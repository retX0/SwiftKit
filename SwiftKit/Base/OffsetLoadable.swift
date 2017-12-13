
import UIKit
import RxSwift
import ObjectMapper
//import DZNEmptyDataSet


protocol OffsetLoadable: Reactable {
    associatedtype E: Mappable
    var viewModel:PaginationViewModel<E>! { get }
}

/// UIViewController cannot user gerneric type
/// with storyboard, so define a protocol

extension OffsetLoadable where Self: UITableViewController {
    
    
    /// must remove load view when deinit called.
    func removeLoadView() {
        
        if isViewLoaded {
//            tableView.dg_removePullToRefresh()
        }
    }
    
    /// set up load view. ussual call this method in loadview
    func addLoadView() {
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
//        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
//        loadingView.tintColor = UIColor.white
//        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
//            self?.viewModel.refreshTrigger.onNext()
//            }, loadingView: loadingView)
////        tableView.dg_setPullToRefreshFillColor(UIConstants.green)
//        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        
//        viewModel.isRefreshing.asObservable()
//            .filter{ $0 == false }
//            .subscribe(onNext: { [weak self] _ in
//                self?.tableView.dg_stopLoading()
//            }).addDisposableTo(disposeBag)
    }
}


/*
 
extension OffsetLoadable where Self: UITableViewController, Self: DZNEmptyDataSetSource {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let font = UIFont.systemFont(ofSize: 17)
        let text = "暂时没有数据"
        let textColor = UIColor.lightGray
        
        return NSAttributedString(string: text, attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName: textColor])
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
        let font = UIFont.systemFont(ofSize: 14)
        let text = ""
        let textColor = UIColor.lightGray
        
        return NSAttributedString(string: text, attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName: textColor])
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        
        let font = UIFont.systemFont(ofSize: 14)
        let text = "刷新"
        let textColor = UIColor.orange
        
        return NSAttributedString(string: text, attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName: textColor])
    }
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return UIColor(rgb: 0xEFEFEF)
    }
    
    func imageAnimation(forEmptyDataSet scrollView: UIScrollView!) -> CAAnimation! {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        
        if viewModel.isLoading.value {
            return UIImage(named: "loading_imgBlue_78x78")
        } else {
            return nil
        }
    }
}

extension OffsetLoadable where Self: UITableViewController, Self: DZNEmptyDataSetDelegate {
    
    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return false
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView!) -> Bool {
        return viewModel.isLoading.value
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        viewModel.refreshTrigger.onNext()
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        viewModel.refreshTrigger.onNext()
    }
}

*/
