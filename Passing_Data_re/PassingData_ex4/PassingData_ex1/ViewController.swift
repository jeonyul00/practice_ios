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

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 20
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }
    
    @IBAction func delegateMoveToDetail(_ sender: Any) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        // 이러면 프로토콜 타입만 보낼 수 있지
        detailVC.delegate = self
        self.present(detailVC, animated: true)
        
    }
    

}

extension ViewController:ViewControllerDelegate {
    func rightLabelString(str: String) {
        callbackDataLabel.text = str
    }
}


protocol ViewControllerDelegate {
    func rightLabelString(str:String)
}
