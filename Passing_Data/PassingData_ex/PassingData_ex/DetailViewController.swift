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
        // 이것도 되긴하지만 라이프 사이클이 꼬일 수 있기 때문에 함수로 만드는게 나을 듯
        // nameLabel.text = detailName
        // ageLabel.text = detailAge.description        
        updateUI() // 여기선 안해도 되지 않나? viewController에서 이미 호출했잖아 -> 안됐을 때를 대비 -> 그럼 결국 2번 호출하게 되는거 아닌가?
    }
    
    func updateUI() -> Void {
        nameLabel.text = detailName
        ageLabel.text = detailAge.description
    }

}
