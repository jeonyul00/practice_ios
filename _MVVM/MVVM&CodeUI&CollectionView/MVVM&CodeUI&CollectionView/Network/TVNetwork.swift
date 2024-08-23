//
//  TVNetwork.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 8/23/24.
//

import Foundation
import RxSwift

final class TVNetwork {
    private let network: Network<TVListModel>
    
    init(network: Network<TVListModel>) {
        self.network = network
    }
    
    func getTopRatedList() -> Observable<TVListModel> {
        return network.getItemList(path: "/tv/top_rated")
    }
    
    
}
