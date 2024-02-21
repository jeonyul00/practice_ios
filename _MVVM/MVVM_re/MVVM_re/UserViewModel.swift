//
//  UserViewModel.swift
//  MVVM_re
//
//  Created by 전율 on 2024/01/14.
//

import Foundation

// 여기서 viewmodel을 만들면 된다
// ObservableObject을 채택하면 내부에서 관찰하고 싶은 요소 등록 가능
class UserViewModel:ObservableObject {
    // @Published: 등록(class에서만 가능)
    @Published var users = [
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
    func createUser(name:String, age:Int) {
        let newUser = User(name: name, age: age)
        self.users.append(newUser)
        
    }
    
    // update
    func updateUser(id:UUID, name:String, age:Int) {
        if let selectUserIndex = users.firstIndex(where: { user in user.id == id }) {
            self.users[selectUserIndex].name = name
            self.users[selectUserIndex].age = age
        }
    }
    
    // delete
    func deleteUser(id:UUID) {
        if let selectUserIndex = users.firstIndex(where: { user in user.id == id }) {
            self.users.remove(at: selectUserIndex)
        }
    }
}
