//
//  DetailViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit


// 메모리 관리가 되나? => detail에서 main를 참조하고 있는데 => detail 내릴 때 main도 내려야겠다.
// 이 떄 상호(순환) 참조 조심 -> 이 상황이면 앱 망한거임 => weak로 상호 참조를 막을것 또는 애초에 상호 참조를 안되게 할 것
class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    // 이러면 딱 필요한 것만 넘길 수 있겠군 : 사실 self 전부를 넘겨받은건데 볼 수 있는데 프로토콜 뿐인 것 : 메모리 관리 할 것
    // => weak로 참조 할 것, weak를 사용하기 위해서는  프로토콜이 AnyObject 채택해야됨
    weak var delegate: ViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "전율"
    }
    
    @IBAction func backDelegate(_ sender: Any) {
        delegate?.rightLabelString("delegate")
        dismiss(animated: true)
    }
    
}
