//
//  GuideView.swift
//  Merchant
//
//  Created by xnxin on 2017/6/6.
//  Copyright © 2017年 com.xnxin. All rights reserved.
//

import UIKit

protocol GuideViewDelegate: NSObjectProtocol {
    func doneButtonTapped()
}

class GuideView: UIView {
   
    
    //MARK: -
    //MARK: outlet && variables
    
    weak var delegate:GuideViewDelegate?
    
    private var scrollView: UIScrollView!
    
    fileprivate var doneButton: UIButton!
    fileprivate var pageControl: UIPageControl!
    fileprivate let numOfPages = 3
    
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
        
        scrollView.frame = bounds
        
        doneButton.right = width - 20
        doneButton.top = 20
        
        pageControl.centerX = width/2
        pageControl.bottom = bottom - 20
    }
    
    //MARK: -
    //MARK: action
    
    
    //MARK: -
    //MARK: private method
    
    private func setupUI() {
       
        scrollView = UIScrollView(frame: bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPoint.zero
        
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages),
                                        height: frame.size.height)
        scrollView.delegate = self
        for index  in 0..<numOfPages {
            let imageName = "pic_guide_\(index + 1)"
            let imageView = UIImageView(image: UIImage(named: imageName))
            assert(imageView.image != nil, "引导页设置不正确")
            imageView.frame = CGRect(x: frame.size.width * CGFloat(index), y: 0, width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imageView)
        }
        addSubview(scrollView)
        
        
        doneButton = UIButton()
        doneButton.alpha = 0
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        doneButton.layer.cornerRadius = 5;
        doneButton.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        doneButton.layer.masksToBounds = true
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        doneButton.setTitle("   完成   ", for: .normal)
        doneButton.sizeToFit()
        addSubview(doneButton)
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = numOfPages
        pageControl.sizeToFit()
        pageControl.currentPageIndicatorTintColor = UIConstants.tintColor
        pageControl.pageIndicatorTintColor = UIConstants.labelGray
        pageControl.currentPage = 0
        addSubview(pageControl)
    }
    
    func doneButtonTapped() {
        if let delegate = delegate {
            delegate.doneButtonTapped()
        }
    }
}

extension GuideView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / bounds.width)
        
        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage == numOfPages - 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.doneButton.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.doneButton.alpha = 0.0
            })
        }
    }
}

extension UserDefaults {
   
    var storeVersionKey: String {
        return "ssstc_version"
    }
    
    var isNeedShowGuide: Bool {
        
        guard let version = lastVersion else {
            return true
        }
        
        return version != latestVersion
    }
    
    var lastVersion: String? {
        let re = string(forKey: storeVersionKey)
        return re
    }
    
    var latestVersion: String {
        
        guard let infoDic = Bundle.main.infoDictionary else {
            return "0.0"
        }
        
        guard let version = infoDic["CFBundleShortVersionString"] as? String else {
            return "0.0"
        }
        
        return version
    }
    
    func updateLastVersion() {
        set(latestVersion, forKey: storeVersionKey)
    }
}
