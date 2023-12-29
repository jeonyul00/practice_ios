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
    
    // 상호 참조를 끊기 위해 weak
    // 근데 사실 여기서는 상호참조가 아니라서 반드시 할 필요 없다.
    weak var delegate: ViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    
    func updateLabel() -> Void {
        nameLabel.text = detailName
        ageLabel.text = detailAge.description
    }
    
    
    @IBAction func backDelegate(_ sender: Any) {
        delegate?.rightLabelString(str: detailName)
        self.dismiss(animated: true)
    }
    
    
}
