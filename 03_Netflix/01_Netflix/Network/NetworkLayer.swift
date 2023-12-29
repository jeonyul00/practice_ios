//
//  NetworkLayer.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/19.
//

import Foundation
import UIKit

class NetworkLayer {
    static func request(urlString:String, completion: @escaping (UIImage?)->Void) {
        guard let url = URL(string: urlString) else { return }
        // 이미지 값을 이미지로 변환
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    static func request(type:MediaType, completion:@escaping (MovieModel)->Void){
        let term = URLQueryItem(name: "term", value: type.queryValue)
        let media = URLQueryItem(name: "media", value: type.queryValue)
        let query = [term, media]
        
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = query
        guard let hasUrl = components?.url else { return }
        // 호출
        URLSession.shared.dataTask(with: hasUrl) { data, response, error in
            if let data = data {
                do{
                    let movieModel = try JSONDecoder().decode(MovieModel.self, from: data)
                    completion(movieModel)
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
    
}
