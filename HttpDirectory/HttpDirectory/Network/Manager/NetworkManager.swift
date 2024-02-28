//
//  NetworkManager.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/27.
//

// 네트워크 요청의 결과를 처리하고 앱의 다른 부분과 네트워크 서비스 레이어 사이의 인터페이스 역할
import Foundation


class NetworkManager {
//    private let networkService = NetworkService()
//    
//    func fetchSomeData(completion: @escaping ([PostModel]?, Error?) -> Void) {
//        networkService.request(endpoint: "https://jsonplaceholder.typicode.com/posts", method: "GET", parameters: nil) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(nil, error)
//                return
//            }
//            
//            // Parse JSON data
//            let decodedData = try? JSONDecoder().decode([PostModel].self, from: data)
//            completion(decodedData, nil)
//        }
//    }
}
