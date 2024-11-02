//
//  APIClient.swift
//  Books
//
//  Created by 전율 on 11/2/24.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    func fetchBooks(completion: @escaping (Books) -> Void) {
        // 전체 URL 확인
        var apiUrl = URL(string: "https://kxapi.azurewebsites.net/books")!
        apiUrl.append(queryItems: [
            URLQueryItem(name: "apiKey", value: "Vp3lkFGT4CyPC5t8vF8D")
        ])
        
        let session = URLSession.shared
        var request = URLRequest(url: apiUrl)
        request.addValue("2.0", forHTTPHeaderField: "kxcoding-api-version")
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code not 200")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(formatter)
                let books = try decoder.decode(Books.self, from: data)
                completion(books)
            } catch {
                print("Decoding error:", error)
            }
        }
        task.resume()
    }
    
    
    func fetchDetail(_ id: Int, completion: @escaping (BookDetail)->Void) {
        var apiUrl = URL(string: "https://kxapi.azurewebsites.net/books/\(id)")!
        apiUrl.append(queryItems: [
            URLQueryItem(name: "apiKey", value: "Vp3lkFGT4CyPC5t8vF8D")
        ])
        
        let session = URLSession.shared
        let request = URLRequest(url: apiUrl)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code not 200")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(formatter)
                let books = try decoder.decode(BookDetail.self, from: data)
                completion(books)
            } catch {
                print("Decoding error:", error)
            }
        }
        task.resume()
        
    }
}
