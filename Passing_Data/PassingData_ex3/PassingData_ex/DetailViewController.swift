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
    
    var detailName = ""
    var detailAge = 0
    
    // self instance를 받기위한 변수
    var mainVC:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 이렇게 인스턴스를 통으로 넘기는 방법으로 하면 뭔가 위험해 보이네
    @IBAction func backInstance(_ sender: Any) {
        mainVC?.myName = "kim"
        mainVC?.nameLabel.text = mainVC?.myName
        mainVC?.callbackDataLabel.text = mainVC?.myName
        self.dismiss(animated: true)
    }
    
}
