//
//  DecimalExtension.swift
//  Client
//
//  Created by hx on 2016/12/2.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit

public extension NSNumber {

    public var money: String {
        
        let formatter = NumberFormatter()
        formatter.positiveFormat = "###,##0.00;"
        return formatter.string(from: self) ?? "0.00"
    }
}

public extension Decimal {
    
    public var percent: String {
        
        get {
            return (self * 100).money
        }
        
        set {
            let tmp = Double(newValue) ?? 0 / 100
            self = Decimal(floatLiteral: tmp)
        }
    }

    //used for money display
    public var money: String {
        let tmp = NSDecimalNumber(decimal: self)
        return tmp.money
    }
}
