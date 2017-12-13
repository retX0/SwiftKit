//
//  DecimalExtension.swift
//  Client
//
//  Created by hx on 2016/12/2.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import UIKit

extension NSNumber {

    
    var money: String {
        
        let formatter = NumberFormatter()
        formatter.positiveFormat = "###,##0.00;"
        return formatter.string(from: self) ?? "0.00"
    }
}

extension Decimal {
    
    var percent: String {
        
        get {
            return (self * 100).money
        }
        
        set {
            
            let tmp = Double(newValue) ?? 0 / 100
            self = Decimal(floatLiteral: tmp)
        }
    }
    
    var money: String {
        let tmp = NSDecimalNumber(decimal: self)
        return tmp.money
    }
}
