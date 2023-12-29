//
//  ViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

// 2. segue
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 30
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
        
    }
    
    // 스토리보드에서 연결한 세그웨이
    // 모든 세그웨이는 이 함수로 호출됨 -> 아이디로 분기 처리
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDetail" {
            if let detailVC =  segue.destination as? DetailViewController {
                detailVC.detailAge = myAge
                detailVC.detailName = myName
            }
        }
    }
    
    // unwindSegue : 되돌아왔을 때 데이터를 받는 기능, 다른 화면에서 뒤로가기 누르면 (뎁스 관계없음) unwind함수로 감
    // 규칙 : 매개변수 UIStoryboardSegue 타입이어야함
    @IBAction func unwind(segue:UIStoryboardSegue){
        if let detailVC = segue.source as? DetailViewController {
            self.callbackDataLabel.text = detailVC.detailName
        }
    }
    
    
}

