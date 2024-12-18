//import UIKit
//
//struct Books:Codable {
//    let totalCount: Int
//    let list: [book]
//    let code: Int
//    let message:String?
//    
//    struct book:Codable {
//        let id: Int
//        let title: String
//        let summary: String
//        let storeLink: String
//        let publicationDate: Date
//    }
//    
//}
//
//
//// url 생성
////let url = URL(string: "https://kxapi.azurewebsites.net/helloworld?apiKey=Vp3lkFGT4CyPC5t8vF8D")!
////url.scheme // https
////url.host() // kxapi.azurewebsites.net
////url.port // nil -> :4000 직접 명시했을때 반환
////url.lastPathComponent // helloworld
////url.pathComponents // 패스를 /기준으로 배열로 반환
////url.query() // 파람
//
//var url = URL(string: "https://kxapi.azurewebsites.net/books")!
//url.append(queryItems: [
//    URLQueryItem(name: "apiKey", value: "Vp3lkFGT4CyPC5t8vF8D")
//])
//
//let session = URLSession.shared
//let task = session.dataTask(with: url) { data, response, error in
//    guard error == nil else { return }
//    guard let httpResponse = response as? HTTPURLResponse else { return }
//    if httpResponse.statusCode == 200 {
//        guard let data else { return }
//        do {
//            let formmater = DateFormatter()
//            formmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .formatted(formmater)
//            let result = try decoder.decode(Books.self, from: data)
//            result.list.forEach({ book in
//                print(URL(string: book.storeLink)!, book.publicationDate)
//            })
//        } catch {
//            print(error)
//        }
//    }
//}
//
//task.resume()

// ---
import UIKit

struct Books:Codable {
    let totalCount: Int
    let list: [bookSummary]
    let code: Int
    let message:String?
    
    struct bookSummary:Codable {
        let id: Int
        let title: String
    }
    
}

var url = URL(string: "https://kxapi.azurewebsites.net/books")!
url.append(queryItems: [
    URLQueryItem(name: "apiKey", value: "Vp3lkFGT4CyPC5t8vF8D")
])

let session = URLSession.shared
var request = URLRequest(url: url)
request.addValue("2.0", forHTTPHeaderField: "kxcoding-api-version") // header
let task = session.dataTask(with: request) { data, response, error in
    guard error == nil else { return }
    guard let httpResponse = response as? HTTPURLResponse else { return }
    if httpResponse.statusCode == 200 {
        guard let data else { return }
        do {
            let formmater = DateFormatter()
            formmater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formmater)
            let result = try decoder.decode(Books.self, from: data)
            print(result)
            
        } catch {
            print(error)
        }
    }
}

task.resume()
