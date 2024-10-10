//
//  ViewController.swift
//  ARC_re
//
//  Created by 전율 on 2024/01/15.
//

import UIKit





class ViewController: UIViewController {
    
    // 참조 (강한 참조)
    var otherDetailVC: DetailViewController?
    
    // 약한 참조
    weak var otherDetailVC2: DetailViewController? {
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("약한 참조 : ", self.otherDetailVC2) // 값이 없어지면 nil로 변환
            }
        }
    }
    
    // 미소유 참조
    unowned var otherDetailVC3: DetailViewController? {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("미소유 참조 : ", self.otherDetailVC3) // 값이 없어지면 nil로 변환되는게 아니고, 그냥 메모리에서 해제됨 => 이 로직에서는 크래시가 난다. unowned는 무조건 값이 있는거다. 라고 인식함 그런데 참조가 끊겨서(값이 없어서) 크래시
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
            
    @IBAction func moveToDetail(_ sender: Any) {
        // 자기 자신의 라이프 사이클이 끝나면 카운트 -1 => 여기서는 moveToDetail 함수가 끝나면 detailVC도 죽으니까, -1
        let detailVC = DetailViewController() // 래퍼런스 카운트 + 1
        // self.present(detailVC, animated: true) // 래퍼런스 카운트 +1, 창을 내리면 -1
        
        otherDetailVC2 = detailVC // 약한 참조 값, 래퍼런스 + 0
        otherDetailVC3 = detailVC
        
    } // 함수 종료 시점에 detailVC의 스코프가 끝나니까 래퍼런스 카운트  -1
    
}

// --------------------------------------------------

class DetailViewController:UIViewController {
    
    deinit {
        print("메모리 해제")
    }
}
