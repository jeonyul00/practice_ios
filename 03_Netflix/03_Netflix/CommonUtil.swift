//
//  CommonUtil.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/10.
//

import Foundation

class CommonUtil {
    
    
    static func iso8601(date:String, format:String) -> String {
        let formmater = ISO8601DateFormatter()
        if let isoDate =  formmater.date(from: date) {
            let myFormatter = DateFormatter()
            myFormatter.dateFormat = format
            let dateString = myFormatter.string(from: isoDate)
            return dateString
        }
        return ""
    }
}
