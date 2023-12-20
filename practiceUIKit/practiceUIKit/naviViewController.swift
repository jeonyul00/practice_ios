//
//  naviViewController.swift
//  practiceUIKit
//
//  Created by 전율 on 2023/12/20.
//

import UIKit

class naviViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "test"
        
        // Do any additional setup after loading the view.
    }
                        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "exidentifier" {
            let viewController = segue.destination as! naviChildViewController
            viewController.inputName = textField.text!
        }
    }
    
    
}
