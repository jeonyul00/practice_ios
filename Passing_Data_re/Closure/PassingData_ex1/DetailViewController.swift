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
    var detailName = "KIM"
    var detailAge = 0
    var detailClosure:((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    func updateLabel() -> Void {
        nameLabel.text = detailName
        ageLabel.text = detailAge.description
    }
    
    
    
    func closureWithFunc(completion:(String)->Void) -> Void {
        completion(detailName)
    }
    
    
    @IBAction func backClosure(_ sender: Any) {
        detailClosure?(detailName)
        self.dismiss(animated: true)
    }
}
