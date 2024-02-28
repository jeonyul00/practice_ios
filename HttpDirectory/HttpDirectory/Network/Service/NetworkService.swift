//
//  NetworkService.swift
//  HttpDirectory
//
//  Created by 전율 on 2024/02/27.
//

// 서버와의 실제 통신을 담당
import Foundation
import RxSwift


class NetworkService {
    
    func fetchPosts() -> Observable<[PostModel]> {
        Observable.create { observer in
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let task = URLSession.shared.dataTask(with: url) { data,_,error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                do{
                    let decoded = try JSONDecoder().decode([PostModel].self, from: data!)
                    observer.onNext(decoded)
                } catch{
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
