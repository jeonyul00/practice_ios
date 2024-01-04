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
    var detailName = ""
    var detailAge = 0
    
    var mainVC:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    @IBAction func backInstance(_ sender: Any) {
        mainVC?.myName = "KIM"
        mainVC?.nameLabel.text = mainVC?.myName
        self.dismiss(animated: true)
    }
    
    func updateLabel() -> Void {
        nameLabel.text = detailName
        ageLabel.text = detailAge.description
    }
}
