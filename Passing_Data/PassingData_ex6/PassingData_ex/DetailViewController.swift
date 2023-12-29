//
//  DetailViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "전율"
    }
    
    
    // 2. notification 옵저버 이름으로 post하면 값을 넣음 => 약간 redux같은건가?
    @IBAction func postNotification(_ sender: Any) {
        let notiName = Notification.Name("changeNotiName")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: ["name" : "noti name"])
    }
    
}
