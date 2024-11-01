import UIKit

// url 생성
//let url = URL(string: "https://kxapi.azurewebsites.net/helloworld?apiKey=Vp3lkFGT4CyPC5t8vF8D")!
//url.scheme // https
//url.host() // kxapi.azurewebsites.net
//url.port // nil -> :4000 직접 명시했을때 반환
//url.lastPathComponent // helloworld
//url.pathComponents // 패스를 /기준으로 배열로 반환
//url.query() // 파람

var url = URL(string: "https://kxapi.azurewebsites.net/books")!
url.append(queryItems: [
    URLQueryItem(name: "apiKey", value: "Vp3lkFGT4CyPC5t8vF8D")
])

let session = URLSession.shared
let task = session.dataTask(with: url) { data, response, error in
    guard error == nil else { return }
    guard let httpResponse = response as? HTTPURLResponse else { return }
    if httpResponse.statusCode == 200 {
        guard let data else { return }
        let str = String(data: data, encoding: .utf8)!
        print(str)
    }
}

task.resume()
