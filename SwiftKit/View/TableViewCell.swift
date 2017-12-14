//
//  BaseTableViewCell.swift
//  Client
//
//  Created by hx on 2016/12/2.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit


@IBDesignable
open class TableViewCell: UITableViewCell {

    @IBInspectable var grayIsHidden: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        
        
        layoutMargins = UIEdgeInsets();
        guard grayIsHidden == true else {
            preservesSuperviewLayoutMargins = true
            return
        }
        
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.size.width)
    }
    
}
