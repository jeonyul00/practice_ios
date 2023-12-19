//
//  TypeInfo.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/19.
//

import Foundation

/*
    movie
    podcast
    music
    musicVideo
    audiobook
    shortFilm
    tvShow
    software
    ebook
    all
 */
enum MediaType:Int, CaseIterable {
    case movie
    case podcast
    case music
    case musicVideo
    case tvShow
    
    var queryValue:String { return "\(self)" }

    var title:String {
        switch self {
        case .movie: return "영화"
        case .podcast: return "팟캐스트"
        case .music: return "음악"
        case .musicVideo: return "뮤직비디오"
        case .tvShow: return "TV쇼"
        }
        
    }
}
