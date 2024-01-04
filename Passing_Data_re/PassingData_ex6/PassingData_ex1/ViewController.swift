//
//  ViewController.swift
//  PassingData_ex1
//
//  Created by 전율 on 2023/12/26.
//

import UIKit

// 1. Property (instance)
// 2. segue
// 3. self instance
// 4. delegate (pattern)
// 5. closure
// 6. notification : 한 쪽에서 일방적으로 보내는 개념

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 20
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObserver()
        nameLabel.text = myName
    }
    
    // 옵저버 등록
    // 등록이 같은 이름으로 여러군데 있으면? 한 번에 다 보내짐 아주 좋은데?
    func createObserver() {
        let notiName = Notification.Name("changeName")
        NotificationCenter.default.addObserver(self, selector: #selector(changeName), name: notiName, object: nil)
    }
    
    @objc func changeName(notification:Notification) -> Void {
        if let hasName = notification.userInfo?["name"] as? String {
            callbackDataLabel.text = hasName
        }
    }
    
}
