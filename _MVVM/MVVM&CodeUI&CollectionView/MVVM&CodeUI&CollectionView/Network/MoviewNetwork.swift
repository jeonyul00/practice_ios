//
//  MoviewNetwork.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/02/01.
//

import Foundation

import RxSwift

final class MovieNetwork {
    private let network: Network<MovieListModel>
    
    init(network: Network<MovieListModel>) {
        self.network = network
    }
    
    func getNowPlayingList() -> Observable<MovieListModel> {
        self.network.getItemList(path: "/movie/now_playing")
    }
    
    func getPopularList() -> Observable<MovieListModel> {
        self.network.getItemList(path: "/movie/popular")
    }
    
    func getUpcomingList() -> Observable<MovieListModel> {
        self.network.getItemList(path: "/movie/upcoming")
    }
}
