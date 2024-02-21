//
//  UserViewModel.swift
//  MVVM
//
//  Created by 전율 on 2023/12/21.
//

import Foundation
import Combine


// 모델 정보를 가져와서 화면에 맞는 뷰 모델을 만든다.
// crud
// ObservableObject : 관찰할 수 있는 오브젝트 => @Published 선언하면 값이 바꼈을 때 확인 가능, class 에서만 가능
class UserViewModel:ObservableObject {
    @Published var users = [
        User(name: "전율", age: 30),
        User(name: "최승혁", age: 29)
    ]
    
    var cancellables: Set<AnyCancellable> = []
    
    
    var count:Int {
        users.count
    }
    
    func countFunc()->Int{
        return users.count
    }
    
    // 데이터 가공을 여기서 하네 => 그 후에 가공한 상태로 반환, 이걸 컨트롤러에서 안하고 뷰모델에서 하도록
    // read
    func user(index:Int) -> User {
        return users[index]
    }
    
    func userName(index:Int) -> String {
        return users[index].name
    }
    
    func userName2(index:Int, completion: @escaping (String)->Void) {
        $users.sink { users in
            completion(users[index].name)
            // .store(in: &cancellables) => 이거 반드시 있어야함 => 메모리 해제
        }.store(in: &cancellables)
    }
    
    // 이게 가장 효율적이네
    func userName3(index:Int, store: inout Set<AnyCancellable>,  completion: @escaping (String)->Void) {
        $users.filter {$0.count > index}.sink { users in
            completion(users[index].name)
        }.store(in: &store)
    }
    
    func userAge(index:Int) -> String {
        return users[index].age.description
    }
    
    // 이러면 컨트롤러에서 그냥 바로 쓸 수 있겠군
    func userAge2(index:Int, completion:@escaping (String)->Void) {
        $users.sink { users in
            completion(users[index].age.description)
        }.store(in: &cancellables)
        
    }
    
    // create
    func createUser(name:String,age:Int) -> Void {
        let newUser = User(name: name, age: age)
        self.users.append(newUser)
    }
    
    // update
    func updateUser(id:UUID, name:String,age:Int) -> Void {
        if let selectUserIndex = users.firstIndex(where: { user in user.id == id }) {
            users[selectUserIndex].name = name
            users[selectUserIndex].age = age
        }
    }
    
    // delete
    func deleteUser(id:UUID) -> Void {
        if let selectUserIndex = users.firstIndex(where: { user in user.id == id }) {
            // cancellables 해제 -> 이거 해제 되면 sink가 해지됨
            cancellables.removeAll()
            users.remove(at: selectUserIndex)
        }
    }
    
}
