//
//  NetworkProvider.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/02/01.
//

import Foundation

// 네트워크 생성
final class NetworkProvider {
    private let endPoint:String
    
    init() {
        self.endPoint = "https://api.themoviedb.org/3"
    }
    
    func makeTVNetwork() -> TVNetwork {
        let network = Network<TVListModel>(endPoint)
        return TVNetwork(network: network)
    }
    
    func makeMovieNetwork() -> MovieNetwork {
        let network = Network<MovieListModel>(endPoint)
        return MovieNetwork(network: network)
    }
    
}
