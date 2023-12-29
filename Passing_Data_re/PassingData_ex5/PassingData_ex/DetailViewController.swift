//
//  DetailViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    var detailClosure:((String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "전율"
        
    }
    
    @IBAction func backClosure(_ sender: Any) {
        detailClosure?("이것은 클로저")
        self.dismiss(animated: true)
    }
    
    func closureWithFunc(completion:(String)->Void) -> Void {
        completion("이것도 클로저")
        self.dismiss(animated: true)

    }
    
}
