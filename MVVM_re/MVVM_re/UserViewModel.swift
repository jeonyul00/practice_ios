//
//  UserViewModel.swift
//  MVVM_re
//
//  Created by 전율 on 2024/01/14.
//

import Foundation

// 여기서 viewmodel을 만들면 된다

struct UserViewModel {
    private var users = [
        User(name: "jeon", age: 30),
        User(name: "kim", age: 29),
        User(name: "lee", age: 28),
    ]
    
    var count:Int { users.count }
    
    // read
    func user (index:Int) -> User {
        return users[index]
    }
    
    // create
    mutating func createUser(name:String, age:Int) {
        let newUser = User(name: name, age: age)
        self.users.append(newUser)
        
    }
    
    // update
    mutating func updateUser(id:UUID, name:String, age:Int) {
        if let selectUserIndex = users.firstIndex(where: { user in user.id == id }) {
            self.users[selectUserIndex].name = name
            self.users[selectUserIndex].age = age
        }
    }
    
    // delete
    mutating func deleteUser(id:UUID) {
        if let selectUserIndex = users.firstIndex(where: { user in user.id == id }) {
            self.users.remove(at: selectUserIndex)
        }
    }
}
