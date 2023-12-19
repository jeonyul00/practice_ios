//
//  MovieModel.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/19.
//

import Foundation


/*
 "https://itunes.apple.com/search?media=movie&term=movie"
 movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, software, ebook, all
 */

struct MovieModel:Codable {
    let resultCount:Int
    let results:[MovieResult]
}

struct MovieResult: Codable {
    let trackName:String?
    let previewUrl:String?
    let artworkUrl:String?
    let releaseDate:String?
    let shortDescription:String?
    let longDescription:String?
    
    enum CodingKeys:String, CodingKey {
        case trackName
        case previewUrl
        case artworkUrl = "artworkUrl100"
        case releaseDate
        case shortDescription
        case longDescription
    }
}
