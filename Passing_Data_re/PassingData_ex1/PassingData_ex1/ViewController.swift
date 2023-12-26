//
//  ViewController.swift
//  PassingData_ex1
//
//  Created by 전율 on 2023/12/26.
//

import UIKit

// 1. property (instance)

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var myAge = 20
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }
    
    @IBAction func moveToDetailVC(_ sender: Any) {
        // name을 통해 스토리보드를 가져옴
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // id를 통해서 스토리보드 안의 viewController를 가져옴
        let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // x : nameLabel ageLabel은 화면이 나올 준비가 마쳤을 때 값이 정해짐 => 아직은 nil이기 때문에 호출할 수 없음
        // 화면 부터 띄운 후에 값을 넣어야함
        // detailVC.nameLabel.text = myName
        // detailVC.ageLabel.text = myAge.description
        
        // detailVC.detailName = myName
        // detailVC.detailAge = myAge
        
        // 화면 띄우기
        self.present(detailVC, animated: true)
        
        // detailVC.nameLabel.text = myName
        // detailVC.ageLabel.text = myAge.description
        
        detailVC.detailName = myName
        detailVC.detailAge = myAge
        detailVC.updateLabel()
                                
    }
}

