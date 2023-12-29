//
//  ViewController.swift
//  PassingData_ex1
//
//  Created by 전율 on 2023/12/26.
//

import UIKit

// 1. Property (instance)
// 2. segue

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callbackDataLabel: UILabel!
    
    var myAge = 20
    var myName = "jeon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myName
    }
    
    @IBAction func moveToDetailVC(_ sender: Any) {
        
    }
    
    // segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            // 목적지 정보
            let detailVC = segue.destination as! DetailViewController
            detailVC.detailAge = myAge
            detailVC.detailName = myName
        }
    }
    
    // unwindSegue: 되돌아 올 때 데이터를 들고 되돌아오기
    @IBAction func unwind(segue:UIStoryboardSegue){
        if let detailVC = segue.source as? DetailViewController {
            callbackDataLabel.text = detailVC.detailName
        }
    }

}

