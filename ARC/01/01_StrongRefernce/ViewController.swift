//
//  ViewController.swift
//  01_StrongRefernce
//
//  Created by 전율 on 2023/12/30.
//

import UIKit


class ViewController: UIViewController {
    
    // 클래스의 변수로 만들면 클래스가 내려가지 않는 한 자동으로 죽을 일 없지
    // todo: 옵셔널로 선언만 하고 할당을 안했을 때에도 카운트가 늘어나는가? -> ㄴㄴ 아직 메모리에 안 올라감 증가 안함
    var ortherDetailVC: DetailViewController?
    
    // 약한 참조
    weak var ortherDetailVC2: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func release(_ sender: Any){
        ortherDetailVC = nil
    }
    
    @IBAction func moveToDetailViewController(_ sender: Any) {
        let detailVC = DetailViewController() // 참조: 레퍼런스 카운트 +1
        //        let detailVC2 = detailVC // 레퍼런스 카운트 +1,총 2
        // 변수 자체를 없앨 때 카운트가 줄어든다. => moveToDetailViewController 함수가 끝날 때 생명 주기로 인해 프로퍼티도 죽지
        
        // ortherDetailVC = detailVC // 이러면 이 함수가 끝났어도 외부 변수에서 참조하도록 했으니 카운트 안 줄음
        // 해 당 변수를 없애면 됨, nil을 주던가
        
        self.present(detailVC,animated: true) // 이거도 레퍼런스 카운트 +1, 화면 내리면 -1
        
        // 약한 참조
        ortherDetailVC2 = detailVC
        
        // 생명주기 잘보고, 이 함수가 끝났을 때 참조 변수가 살아있나 볼 것
    }
    
}


class DetailViewController:UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .gray
    }
    
    required init?(coder:NSCoder){
        fatalError("error")
    }
    
    deinit {
        print("detailvc deinit")
    }
    
}

