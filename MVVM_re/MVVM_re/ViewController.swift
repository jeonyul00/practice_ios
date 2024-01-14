//
//  ViewController.swift
//  MVVM_re
//
//  Created by 전율 on 2024/01/14.
//

// MVC: model, view, controller
// MVVM: model, view, viewmodel

// MVVM 패턴을 구현하기 위해서는 바인딩을 구현해야함
// 바인딩을 구현하는 방법들: closure, notification, observableObject(이게 그 바인딩 프레임워크), rxSwift => 옵저버 패턴


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    //    var model = Users()
    var viewModel = UserViewModel()
    
    var selectedUUID = UUID()
    
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
        tableView.reloadData() // 이거 아주 불편하다. -> 이걸 이제 옵저버 패턴으로 고칠 예정
    }
    
    
    @IBAction func edit(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let age = Int(ageTextField.text ?? "") ?? 0
        viewModel.updateUser(id: selectedUUID, name: name, age: age)
        tableView.reloadData() // 이거 아주 불편하다. -> 이걸 이제 옵저버 패턴으로 고칠 예정
    }
    
    @IBAction func remove(_ sender: Any) {
        viewModel.deleteUser(id: selectedUUID)
        tableView.reloadData() // 이거 아주 불편하다. -> 이걸 이제 옵저버 패턴으로 고칠 예정
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.nameLabel.text = viewModel.user(index: indexPath.row).name
        cell.ageLabel.text = viewModel.user(index: indexPath.row).age.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUUID = viewModel.user(index: indexPath.row).id
    }
}
