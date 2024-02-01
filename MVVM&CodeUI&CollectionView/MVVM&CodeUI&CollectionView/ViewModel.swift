//
//  ViewModel.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/02/01.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    let disposeBag = DisposeBag()
    private let tvNetwork: TVNetwork
    private let movieResult: MovieNetwork
    
    init() {
        let provider = NetworkProvider()
        tvNetwork = provider.makeTVNetwork()
        movieResult = provider.makeMovieNetwork()
    }
    
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    struct Output {
        let tvList: Observable<[TV]>
//        let moviewList: Observable<MovieResult>
    }
 
    func transform(input: Input) -> Output {
        
        
        let tvList = input.tvTrigger.flatMap { [unowned self] _ -> Observable<[TV]> in
            return self.tvNetwork.getTopRatedList().map {$0.results}
        }
        
        let movieResult =  input.movieTrigger.flatMap { [unowned self] _ -> Observable<MovieResult> in
            return Observable.combineLatest(self.movieNetwork.getUpcomingList(), self.movieNetwork.getPopularList(), self.movieNetwork.getNowPlayingList()) {
                upcoming, popular,nowPlaying -> MovieResult in return MovieResult(upcoming: upcoming, popular: popular, nowPlaying: nowPlaying)
            }
        }
        return Output(tvList: tvList, movieResult: movieResult)
    }
}
