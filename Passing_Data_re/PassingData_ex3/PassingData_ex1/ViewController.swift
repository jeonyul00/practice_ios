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

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 20
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }
    
    @IBAction func selfInstanceMoveToDetail(_ sender: Any) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.mainVC = self // 참조로 넘어감
        // 이러면 좀 위험할 수 있겠다.
        
        self.present(detailVC, animated: true)
    }
    

}

