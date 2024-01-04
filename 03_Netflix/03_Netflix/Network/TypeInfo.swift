//
//  TypeInfo.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import Foundation

enum MediaType {
    case movie
    case podcast
    case music
    case musicVideo
    case tvShow
    
    var queryValue: String {
        return "\(self)"
    }
    
    var title:String {
        switch self {
        case .movie:
            return "영화"
        case .podcast:
            return "팟캐스트"
        case .music:
            return "뮤직"
        case .musicVideo:
            return "뮤직 비디오"
        case .tvShow:
            return "tv쇼"
        }
    }
}
