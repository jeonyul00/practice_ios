//
//  ViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

// 3. self instance
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 30
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        
    }
        
    @IBAction func selfInstanceMoveToDetail(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // 참조하는거임
        detailVC.mainVC = self
        self.present(detailVC, animated: true)
    }
    
}

 
