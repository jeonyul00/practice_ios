//
//  Network.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/02/01.
//

import Foundation
import RxSwift
import RxAlamofire

class Network<T:Decodable> {
    
    private let endPoint:String
    private let queue:ConcurrentDispatchQueueScheduler
    
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.queue = ConcurrentDispatchQueueScheduler(qos: .background)
    }
    
    func getItemList(path: String) -> Observable<T> {
        let fullPath = "\(endPoint)\(path)?api_key=\(APIKEY)&language=ko"
        return RxAlamofire.data(.get,fullPath)
            .observe(on: queue)
            .debug()
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
    
}


