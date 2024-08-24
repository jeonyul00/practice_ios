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
    
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    struct Output {
        let tvList: Observable<[TV]>
        // let movieList: Observable<MovieListModel>
    }
    
    func transform(input: Input) -> Output {
        input.tvTrigger.bind {
            print("trigger")
        }.disposed(by: disposeBag)
        
        return Output(tvList: Observable<[TV]>.just([]))
        
    }
    
}
