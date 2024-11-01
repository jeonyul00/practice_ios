//
//  ViewModel.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 8/24/24.
//

import Foundation
import RxSwift


class ViewModel {
    let disposeBag = DisposeBag()
    private let tvNetwork: TVNetwork
    private let movieNetwork: MovieNetwork
    
    init() {
        let provider = NetworkProvider()
        tvNetwork = provider.makeTVNetwork()
        movieNetwork = provider.makeMovieNetwork()
    }
    
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    struct Output {
        let tvList: Observable<[TV]>
        let movieResult: Observable<MovieResult>
    }
    
    func transform(input: Input) -> Output {
        let tvList = input.tvTrigger.flatMapLatest { [unowned self] _ -> Observable<[TV]> in
            self.tvNetwork.getTopRatedList().map { TVListModel in
                return TVListModel.results
            }
        }
        
        let movieResult = input.movieTrigger.flatMapLatest { [unowned self] _ -> Observable<MovieResult> in
            
            return Observable.combineLatest(self.movieNetwork.getUpcomingList(), self.movieNetwork.getPopularList(), self.movieNetwork.getNowPlayingList()) { upcoming, popular, nowPlaying -> MovieResult in
                return MovieResult(upcoming: upcoming, popular: popular, nowPlaying: nowPlaying)
            }
        }        
        return Output(tvList: tvList, movieResult: movieResult)
        
    }
    
}
