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

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 20
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }
    
    @IBAction func closureMoveToDetail(_ sender: Any) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        detailVC.detailClosure = { (str:String) in self.callbackDataLabel.text = str }
        
        detailVC.closureWithFunc { name in
            self.callbackDataLabel.text =  name
        }
        
        self.present(detailVC, animated: true)
        
    }
    
}
