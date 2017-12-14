//
//  NavigationItem.swift
//  XHKit
//
//  Created by xnxin on 2016/10/17.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit

extension UINavigationItem {

    func itemWithImage(_ image:UIImage?) -> UIBarButtonItem {
        
        if let image = image {
            let navButton = UIButton();
            navButton.setImage(image, for: .normal)
            navButton.sizeToFit()
            return UIBarButtonItem(customView: navButton)
        }
        return UIBarButtonItem()
    }
}
