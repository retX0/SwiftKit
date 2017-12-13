//
//  DateExtension.swift
//  Client
//
//  Created by hx on 2016/12/12.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import Foundation

extension Date {

    func string(format:String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension DateFormatter {
    
    convenience init(format: String,
                     locale:Locale = Locale(identifier: "en_US_POSIX"),
                     timeZone:TimeZone? = TimeZone(secondsFromGMT: 0)) {
        self.init()
        self.locale = locale
        self.timeZone = timeZone
        self.dateFormat = format
    }
}
extension String {
    func date() -> Date? {

        let length = self.characters.count
        
//        guard self.isNumber == false else {
//            
//            let timeInterval = Double(self) ?? 0
//            
//            if (self.characters.count > 12) {
//                return Date(timeIntervalSince1970: timeInterval/1000)
//            } else {
//                return Date(timeIntervalSince1970: timeInterval)
//            }
//        }
        switch length {
        case 10:    /// 2014-01-20
            return DateFormatter(format: "yyyy-MM-dd")
                .date(from: self)
        case 16:    /// 2014-01-20 HH:mm
            return DateFormatter(format: "yyyy-MM-dd HH:mm")
                .date(from: self)
        case 19:
            if (self[index(startIndex, offsetBy: 10)] == "T") {  /// 2014-01-20T12:24:48
                
                return DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss")
                    .date(from: self)
            } else {    /// 2014-01-20 12:24:48
                
                return DateFormatter(format: "yyyy-MM-dd HH:mm:ss")
                    .date(from: self)
            }
        case 20: fallthrough    /// 2014-01-20T12:24:48Z        // Github, Apple
        case 25:
            return DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ssZ")
                .date(from: self)
        case 23:

            if (self[index(startIndex, offsetBy: 10)] == "T") {  /// 2014-01-20T12:24:48
                
                return DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
                    .date(from: self)
            } else {    /// 2014-01-20 12:24:48
                
                return DateFormatter(format: "yyyy-MM-dd HH:mm:ss.SSS")
                    .date(from: self)
            }
        case 24:
            return DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ssZ")
            .date(from: self) ?? DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
                .date(from: self)
        case 28: fallthrough
        case 29:
                return DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
                    .date(from: self)
        case 30:
            return DateFormatter(format: "EEE MMM dd HH:mm:ss Z yyyy")
                .date(from: self)
        case 34:
            return DateFormatter(format: "EEE MMM dd HH:mm:ss.SSS Z yyyy")
                .date(from: self)
        default:
            return nil
        }
    }
}
