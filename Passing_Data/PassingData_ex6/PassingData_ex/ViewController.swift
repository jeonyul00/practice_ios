//
//  ViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

// 6. notification : 한쪽에서 일방적으로 전달해주는 개념 => 상대가 받았던 말던 전달해주고 끝-
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 30
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        createObserver()
    }
    
    // 1. notification 옵저버를 추가하고
    func createObserver(){
        let notiName = Notification.Name("changeNotiName")
        NotificationCenter.default.addObserver(self, selector: #selector(changeName), name:notiName , object: nil)
    }
    
    // 3. 받아서 처리 할 부분 만들면 됨
    @objc func changeName(notification:Notification) {
        if let hasName = notification.userInfo?["name"] as? String {
            callbackDataLabel.text = hasName
        }
    }
    
}
