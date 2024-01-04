//
//  DetailViewController.swift
//  PassingData_ex1
//
//  Created by 전율 on 2023/12/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    var detailName = "KIM"
    var detailAge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    func updateLabel() -> Void {
        nameLabel.text = detailName
        ageLabel.text = detailAge.description
    }
    
    
    // 여기서, 등록된 노티피케이션으로 보내네
    @IBAction func postNotification(_ sender: Any) {
        let notiName = Notification.Name("changeName")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: ["name" : detailName])        
    }
    
}
