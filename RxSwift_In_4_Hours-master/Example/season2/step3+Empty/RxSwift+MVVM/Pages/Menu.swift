//
//  Menu.swift
//  RxSwift+MVVM
//
//  Created by 전율 on 2024/01/30.
//  Copyright © 2024 iamchiwon. All rights reserved.
//

import Foundation


struct Menu {
    var id: Int
    var name: String
    var price: Int
    var count: Int
}
extension Menu {
    static func fromMenuItems(id: Int, item:MenuItem) -> Menu {
        return Menu(id:id, name: item.name, price: item.price, count: 0)
    }
}
