//
//  NetworkLayer.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import Foundation
import UIKit

// https://itunes.apple.com/search?media=movie&term=movie
/*
 movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, software, ebook, all
 */

class NetworkLayer {
    
    static func request(urlString:String, completion: @escaping (UIImage?)->Void) {
        if let url =  URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let hasData = data else { return }
                let image = UIImage(data: hasData)
                completion(image)
            }.resume()
        }
    }
    
    static func request(type:MediaType, competion:@escaping (MovieModel)->Void) {
        var components = URLComponents(string: "https://itunes.apple.com/search")
        let term = URLQueryItem(name: "term", value: type.queryValue)
        let media = URLQueryItem(name: "media", value: type.queryValue)
        let querys = [term,media]
        components?.queryItems = querys
        guard let hasUrl = components?.url else { return }
        
        // 호출
        URLSession.shared.dataTask(with: hasUrl) { data, response, error in
            if let hasData = data {
                // hasData에서 가져오는데 MovieModel.self 타입으로 가져온다.
                do{
                    let movieModel = try JSONDecoder().decode(MovieModel.self, from: hasData)
                    competion(movieModel)
                } catch{
                    print("decode error ::: ", error)
                }
            }
        }.resume()
        
    }
}
