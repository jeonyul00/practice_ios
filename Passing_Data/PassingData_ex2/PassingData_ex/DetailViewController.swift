//
//  DetailViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    
    var detailName = ""
    var detailAge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        updateUI()
    }
    
    func updateUI() -> Void {
        nameLabel.text = detailName
        ageLabel.text = detailAge.description
    }

}
