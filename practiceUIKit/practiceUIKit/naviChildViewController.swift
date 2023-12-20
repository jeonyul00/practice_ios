//
//  naviChildViewController.swift
//  practiceUIKit
//
//  Created by 전율 on 2023/12/20.
//

import UIKit

class naviChildViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    var inputName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name { name.text = inputName }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
