//
//  MenulistViewModel.swift
//  RxSwift+MVVM
//
//  Created by 전율 on 2024/01/30.
//  Copyright © 2024 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

class MunuListViewModel {
    
    var menuObserverble = BehaviorSubject<[Menu]>(value: [])
    
    init() {
        _ = APIService.fetchAllMenusRx().map { data -> [MenuItem] in
            struct Response: Decodable {
                let menus:[MenuItem]
            }
            let response = try! JSONDecoder().decode(Response.self, from: data)
            return response.menus
        }.map { menuItems -> [Menu] in
            var menus:[Menu] = []
            menuItems.enumerated().forEach { (index, item) in
                let menu = Menu.fromMenuItems(id: index, item: item)
                menus.append(menu)
            }
            return menus
        }.take(1).bind(to: menuObserverble)
        
        
        let menus: [Menu] = [
            Menu(id: 0, name: "exMenu", price: 100, count: 0),
            Menu(id: 1, name: "exMenu2", price: 300, count: 0),
            Menu(id: 2, name: "exMenu3", price: 200, count: 0),
        ]
        
        menuObserverble.onNext(menus)
    }
    
    lazy var itemsCount = menuObserverble.map {
        $0.map { $0.count }.reduce(0, +)
    }
    // subject: Observable처럼 값을 가져올 수도 있고 외부에서 값을 수정할 수도 있다.
    // var totalPrice: Observable<Int> = Observable.just(0)
    
    lazy var totalPrice = menuObserverble.map {
        $0.map { $0.price * $0.count }.reduce(0, +)
    }
    
    func clearAllItemSelections() {
        _ = menuObserverble.map { menus in
            menus.map { m in
                Menu(id: m.id, name: m.name, price: m.price, count: max(m.count, 0))
            }
        }.take(1) // take(1): 1번만 실행, 이 스트림이 계속 생길 필요가 없지
            .subscribe {
                self.menuObserverble.onNext($0)
            }
    }
    
    func changeCount(_ item:Menu, _ increase:Int){
        _ = menuObserverble.map { menus in
            menus.map { m in
                if m.id == item.id {
                    return Menu(id: m.id, name: m.name, price: m.price, count: max(m.count + increase, 0))
                }
                return Menu(id: m.id, name: m.name, price: m.price, count: m.count)
            }
        }.take(1) // take(1): 1번만 실행, 이 스트림이 계속 생길 필요가 없지
            .subscribe {
                self.menuObserverble.onNext($0)
            }
    }
    
    func onOrder(){
        
    }
}
