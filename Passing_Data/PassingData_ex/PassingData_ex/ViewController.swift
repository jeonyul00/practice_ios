//
//  ViewController.swift
//  PassingData_ex
//
//  Created by 전율 on 2023/11/01.
//

import UIKit

// 1. property (instance)

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var myAge = 30
    var myName = "jeon"
    
    // 화면이 나올 준비 완료되었을 때 호출 : 이 시점에는 모든 프로퍼티가 연결되어있다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = myName
        
    }

    @IBAction func moveToDetailVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // 결론 : 이 방법들을 외우는게 아니고 라이프 사이클을 외우는게 좋을 듯
        
        // x : detailVC.nameLabel, detailVC.ageLabel이 초기화되지 않았는데 호출을 해서 생기는 에러
        // 현재 detailVC.nameLabel, detailVC.ageLabel는 nil임 ,구조만 잡힌 상태 -> 언제 초기화되냐? -> 해당 화면이 나올 준비가 완료되었을 때 -> 그럼 present를 호출 한 후에 초기화하면 되겠다.
        // 근데 이 방법은 좀 별로다 -> 언제 보내도 상관 없도록 할 수 있다 -> 해 당 컨트롤러에서 프로퍼티를 private로 선언 -> 초기화가 된 변수를 호출해서 값 할당 -> 해 당 컨트롤러의 viewDidLoad에서 값을 아울렛에 할당 -> 이러면 결국 변수를 더 선언해야겠네. 이것도 별로다.
        
        // detailVC.nameLabel.text = myName
        // detailVC.ageLabel.text = myAge.description
        
        // detailName과 detailAge는 이미 초기화가 되어있기 때문에 접근 가능
        // detailVC.detailName = myName
        // detailVC.detailAge = myAge
        
        // 화면 띄운다 => 그럼 해당 컨트롤러에서는 viewDidLoad가 호출(화면 띄울 준비가 다 되었기 떄문에)
        self.present(detailVC, animated: true)
        
        detailVC.detailName = myName
        detailVC.detailAge = myAge
        detailVC.updateUI()
        
        // detailViewController에서 프로퍼티를 private해서 접근x
        // detailVC.nameLabel.text = myName
        // detailVC.ageLabel.text = myAge.description
        
    }
    
}

