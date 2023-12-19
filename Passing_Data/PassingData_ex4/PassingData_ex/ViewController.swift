//
//  ViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

// 4. delegate : 위임
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 30
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        
    }
            
    @IBAction func delegateMoveToDetail(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            // 이러면 디테일 delegate에서 self를 받아도 타입이 프로토콜이기에 프로토콜 내용만 볼 수 있지
            // 근데 self가 프로토콜 타입을 채택하지 않았기 때문에 error -> 확장 ㄱ
            detailVC.delegate = self
            self.present(detailVC, animated: true)
        }
        
    }
    
}


// 2
extension ViewController:ViewControllerDelegate {
    func rightLabelString(_ str: String) {
        callbackDataLabel.text = str
    }
    
}


// 1
// 디테일 컨트롤러에 얘를 받을 변수 만들기
protocol ViewControllerDelegate: AnyObject {
    func rightLabelString(_ str:String)
}

 
