//
//  OffsetTableViewController.swift
//  Farm
//
//  Created by hx on 2016/12/25.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import ObjectMapper
import MJRefresh

class OffsetTableViewController: RxDesignableTableViewController {
    
    //MARK: -
    //MARK: outlet && variables
    
    let isLoading = Variable<Bool>(false)
    let isRefreshing = Variable<Bool>(false)
    let isLoadingMore = Variable<Bool>(false)
    let refreshTrigger = PublishSubject<Void>()
    let loadmoreTrigger = PublishSubject<Void>()
    
    
    //MARK: -
    //MARK: life cycle
//    deinit {
//        if isViewLoaded {
//            tableView.dg_removePullToRefresh()
//        }
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: -
    //MARK: override method
    override func loadView() {
        super.loadView()
        
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        
//        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
//        loadingView.tintColor = UIColor.white
//        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
//            self?.refreshTrigger.onNext()
//            }, loadingView: loadingView)
//        tableView.dg_setPullToRefreshFillColor(UIConstants.red)
//        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))
//        tableView.autz
        edgesForExtendedLayout = .all
    }
    
    //MARK: -
    //MARK: action
    
    func refresh() {
        refreshTrigger.onNext()
    }
    
    override func fetchData() {
        refresh()
    }
    
    override func bindViewModel() {
        
        isRefreshing.asObservable()
            .filter{ $0 == false }
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.mj_header.endRefreshing()
            }).addDisposableTo(disposeBag)
        
        isLoading.asObservable()
            .subscribe(onNext: { [weak self] _ in
//                self?.tableView.reloadEmptyDataSet()
                let _ = self
            }).addDisposableTo(disposeBag)
        
        tableView.rx.reachedBottom.asObservable()
            .bind(to: loadmoreTrigger)
            .addDisposableTo(disposeBag)
        
        rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map { _ in () }
            .bind(to: refreshTrigger)
            .addDisposableTo(disposeBag)

    }
    

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    //MARK: -
    //MARK: private method
    
}


//extension OffsetTableViewController: DZNEmptyDataSetSource {
//    
//    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
//        let font = UIFont.systemFont(ofSize: 17)
//        let text = "暂时没有数据"
//        let textColor = UIColor.lightGray
//        
//        return NSAttributedString(string: text, attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName: textColor])
//    }
//    
//    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
//        
//        let font = UIFont.systemFont(ofSize: 14)
//        let text = ""
//        let textColor = UIColor.lightGray
//        
//        return NSAttributedString(string: text, attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName: textColor])
//    }
//    
//    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
//        
//        let font = UIFont.systemFont(ofSize: 14)
//        let text = "刷新"
//        let textColor = UIConstants.green
//        
//        return NSAttributedString(string: text, attributes: [NSFontAttributeName:font, NSForegroundColorAttributeName: textColor])
//    }
//    
//    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
//        return UIColor(rgb: 0xEFEFEF)
//    }
//    
//    func imageAnimation(forEmptyDataSet scrollView: UIScrollView!) -> CAAnimation! {
//        let animation = CABasicAnimation(keyPath: "transform")
//        animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
//        animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0.0, 0.0, 1.0))
//        animation.duration = 0.25
//        animation.isCumulative = true
//        animation.repeatCount = MAXFLOAT
//        
//        return animation
//    }
//    
//    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
//        
//        if isLoading.value {
//            return UIImage(named: "loading_img")
//        } else {
//            return nil
//        }
//    }
//}

//extension OffsetTableViewController: DZNEmptyDataSetDelegate {
//    
//    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
//        return true
//    }
//    
//    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
//        return false
//    }
//    
//    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView!) -> Bool {
//        return isLoading.value
//    }
//    
//    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
//        refreshTrigger.onNext()
//    }
//    
//    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
//        refreshTrigger.onNext()
//    }
//}

