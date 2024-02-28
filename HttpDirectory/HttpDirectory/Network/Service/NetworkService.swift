//
//  NetworkService.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/27.
//

// 서버와의 실제 통신을 담당
import Foundation


class NetworkService {
    
    func request(endpoint: String, method: String, parameters: [String: Any]?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: endpoint) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
    
}
