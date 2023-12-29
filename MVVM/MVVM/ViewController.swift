//
//  ViewController.swift
//  MVVM
//
//  Created by 전율 on 2023/12/21.
//

import UIKit
import Combine

/*
 MVVM : model, view, viewModel, 화면을 위한 모델을 만드는 것
 ㄴ 뷰모델만 만든다고해서 mvvm이라고 하지 않는다. -> 바인딩까지 해야지 -> 뷰모델에서 데이터가 바뀌면 뷰에서도 바껴야지
 바인딩 : 지금은 테이블 데이터가 바뀌면 reloadData를 명시하여 다시 리로드함 -> 누군가 데이터 모델을 바라보고 모델 값이 바뀌면 알아서 리로드한다
 (closure, notofication, observableObject, rx)
 */

class ViewController: UIViewController {
    
    var viewModel = UserViewModel()
    var selectedUUID = UUID()
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }
    
    @IBAction func create(_ sender: Any) {
        let name = nameField.text ?? ""
        let age = Int(ageField.text ?? "") ?? 0
        viewModel.createUser(name: name, age: age)
        tableView.reloadData()
    }
    
    @IBAction func edit(_ sender: Any) {
        let name = nameField.text ?? ""
        let age = Int(ageField.text ?? "") ?? 0
        viewModel.updateUser(id: selectedUUID, name: name, age: age)
        //        tableView.reloadData()
    }
    
    
    @IBAction func deleteUser(_ sender: Any) {
        viewModel.deleteUser(id: selectedUUID)
        tableView.reloadData()
    }
    
}


extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    // 값이 바뀌면 이것들이 다시 호출되어야 하는데 => 이럴 때 바인딩 => $ 키워드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        //        x : 이렇게 mvc 패턴으로 하면 컨트롤러가 비효율적으로 커지겠군
        //        cell.nameLabel.text = model.info[indexPath.row].name
        //        cell.ageLabel.text = model.info[indexPath.row].age.description
        
        // 컨트롤러에서는 딱 연결만 시키는 역할이 되겠군
        //        cell.nameLabel.text = viewModel.userName(index: indexPath.row)
        //        cell.ageLabel.text = viewModel.userAge(index: indexPath.row)
        
        // 바인딩 => $users의 값이 바뀌면 클로저를 호출 => 클로저에서 ui를 업데이트 하면 되겠군
        
        //        viewModel.$users.sink { users in
        //            cell.nameLabel.text = users[indexPath.row].name
        //        }.store(in: &cancellables) // 이게 뭐지 => 메모리에서 해제되도록하게 해준다네 -> 변수가 없어질 때 내용도 없어지도록
        //        // 이걸 왜 컨트롤러에 넣지? 밑에처럼 하면 되겠다.
        
        //        viewModel.$users.sink { users in
        //            cell.nameLabel.text = users[indexPath.row].name
        //        }.store(in: &cell.cancellabels) // 이렇게도 제거가 되네
        
        viewModel.userName3(index: indexPath.row, store: &cell.cancellabels) { name in
            cell.nameLabel.text = name            
        }
        
        viewModel.userAge2(index: indexPath.row) { age in
            cell.ageLabel.text = age
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUUID = viewModel.user(index: indexPath.row).id
    }
    
}
