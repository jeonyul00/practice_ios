//
//  ViewController.swift
//  MVVM_re
//
//  Created by 전율 on 2024/01/14.
//

// MVC: model, view, controller
// MVVM: model, view, viewmodel (+ binding)

// MVVM 패턴을 구현하기 위해서는 바인딩을 구현해야함
// 바인딩을 구현하는 방법들: closure, notification, observableObject(이게 그 바인딩 프레임워크), rxSwift => 옵저버 패턴

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    //    var model = Users()
    var viewModel = UserViewModel()
    
    var selectedUUID = UUID()
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    
    @IBAction func create(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let age = Int(ageTextField.text ?? "") ?? 0
        viewModel.createUser(name: name, age: age)
        tableView.reloadData()
    }
    
    
    @IBAction func edit(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let age = Int(ageTextField.text ?? "") ?? 0
        viewModel.updateUser(id: selectedUUID, name: name, age: age)
        // tableView.reloadData() // 이거 아주 불편하다. -> 이걸 이제 옵저버 패턴으로 고칠 예정
    }
    
    @IBAction func remove(_ sender: Any) {
        cancellables.removeAll() // cancellables을 지워서 바인딩 다 끊어야함
        viewModel.deleteUser(id: selectedUUID)
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        //        cell.nameLabel.text = viewModel.user(index: indexPath.row).name
        //        cell.ageLabel.text = viewModel.user(index: indexPath.row).age.description
        
        // 문제: 이거 재사용이라서 테이블이 화면 밖을 나갔다 다시 들어오면 또 연결해서 연결이 추가됨, 1번만 연결하면 되는데. => userCell에서 고침
        // 바인딩! sink: 연결한다. viewModel.$users의 정보가 바뀌면 클로저 호출
        viewModel.$users.sink { users in
            cell.nameLabel.text = users[indexPath.row].name
            cell.ageLabel.text = users[indexPath.row].age.description
        }.store(in: &cell.cancellabels) // 메모리에서 해제 => 이거 필수임, 이부분 공부 좀 해야겠다.
        return cell
        
        
        /* 메모리 해제 이렇게 해도 됨
         let bind = viewModel.$users.sink { users in
         cell.nameLabel.text = users[indexPath.row].name
         cell.ageLabel.text = users[indexPath.row].age.description
         }
         bind.cancel()
         return cell
         */
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUUID = viewModel.user(index: indexPath.row).id
    }
}
