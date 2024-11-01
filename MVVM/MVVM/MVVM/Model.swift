//
//  Model.swift
//  MVVM
//
//  Created by 전율 on 2023/12/21.
//

import Foundation

//
struct User {
    var id: UUID
    var name:String
    var age:Int
    
    init(name: String, age: Int) {
        self.id = UUID()
        self.name = name
        self.age = age
    }
}


struct Users {
    var info:[(name:String, age:Int)] = [("jeon",30),("kim",28)]
}
