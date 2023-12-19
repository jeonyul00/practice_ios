//
//  ViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

// 5. closure
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 30
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        
    }
    
    func rightTopName(str:String){
        self.callbackDataLabel.text = str
    }
            
    @IBAction func closureMoveToDetail(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.detailClosure = { str in
                // 셋 다 가능
                // self.callbackDataLabel.text = str
                // self.rightTopName(str: str)
                detailVC.closureWithFunc { str in
                    self.callbackDataLabel.text = str
                }
                
            }
            
            self.present(detailVC, animated: true)
            
        }
    }
    
    
    
}
