//
//  Item.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/01/31.
//

import Foundation

// 컬력션뷰의 섹션, 아이템으로 들어가려면 Hashable을 채택해야함
struct Section:Hashable {
    let id: String
}

enum Item:Hashable {
    case banner(HomeItem)
    case normalCarousel(HomeItem)
    case listCarousel(HomeItem)
}

struct HomeItem:Hashable {
    let title:String
    let subTitle:String? = ""
    let imageUrl:String
}
