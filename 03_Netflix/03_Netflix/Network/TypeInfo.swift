//
//  TypeInfo.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import Foundation

enum MediaType:Int, CaseIterable {
    case movie    
    case music
    case audiobook
    case musicVideo
    
    var queryValue: String {
        return "\(self)"
    }
    
    var title:String {
        switch self {
        case .movie:
            return "영화"
        case .music:
            return "뮤직"
        case .musicVideo:
            return "뮤직 비디오"
        case .audiobook:
            return "오디오북"
        }
    }
}
