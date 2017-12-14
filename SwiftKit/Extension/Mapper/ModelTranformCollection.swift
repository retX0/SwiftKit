//
//  ModelTranformCollection.swift
//  BCLifeM
//
//  Created by xnxin on 2016/11/15.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import Foundation
import ObjectMapper

public class DecimalTransform: TransformType {
    
    public typealias Object = Decimal
    public typealias JSON = String
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> Decimal? {
        if let decimalDouble = value as? Double {
            return Decimal(floatLiteral: decimalDouble)
        }
        
        if let decimalStr = value as? String {
            return Decimal(string: decimalStr)
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: Decimal?) -> String? {
        if let decimal = value {
            return decimal.description
        }
        return nil
    }
}


public class BoolTransform: TransformType {
    public typealias Object = Bool
    public typealias JSON = String
    
    public init() {}
    
    public func transformFromJSON(_ value: Any?) -> Bool? {
        if let value = value as? Bool {
            return value
        }

        if let value = value as? Int {
            return value == 0 ? false : true
        }

        if let value = value as? String {
            if (value == "Y") {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
    
    public func transformToJSON(_ value: Bool?) -> String? {
        
        guard let value = value else {
            return "N"
        }
        
        if value {
            return "Y"
        }
        
        return "N"
    }
}


public class DateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    
    public init() {}
    
    public func transformFromJSON(_ value: Any?) -> Date? {
        
        if value is String {
            let string = value as! String
            return string.date()
        }
        
        if value is Int {
            
            let intValue = value as! CUnsignedLongLong
            let timeInterval = Double(intValue)
            
            if (intValue > 1000000000) {
                return Date(timeIntervalSince1970: timeInterval/1000)
            } else {
                return Date(timeIntervalSince1970: timeInterval)
            }
        }
        
        return nil
    }
    
    public func transformToJSON(_ value: Date?) -> String? {
        return value?.string(format: "yyyy-MM-dd HH:mm:SSS")
    }
}

/*

class ActiveStateTransform: TransformType {
    public typealias Object = ActiveState
    public typealias JSON = Int
    
    public init() {}
    
    func transformFromJSON(_ value: Any?) -> ActiveState? {
        
        var intValue = 0
        
        if let value = value as? String {
            intValue = Int(value) ?? 0
        }
        
        switch intValue {
        case 1:
            return .review
        case 2:
            return .reject
        case 3:
            return .pass
        default:
            return .none
        }

    }
    
    func transformToJSON(_ value: ActiveState?) -> Int? {
        
        guard let value = value else {
            return 0
        }
        
        switch value {
        case .review:
            return 1
        case .reject:
            return 2
        case .pass:
            return 3
        default:
            return 0
        }
    }
}

class SexTransform: TransformType {
    
    public typealias Object = ActiveState
    public typealias JSON = Int
    
    public init() {}
    
    func transformFromJSON(_ value: Any?) -> Object? {
        
//        var intValue =
        let value = value as? String {
            
        }
    }
    
    func transformToJSON(_ value: Bool?) -> JSON? {
        

    }
}
 
 */
