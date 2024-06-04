//
//  HomeNaviViewController.swift
//  FitnessApp
//
//  Created by 전율 on 2024/05/27.
//

import UIKit

class HomeNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UINavigationBar.appearance().tintColor = .white // 전역 설정
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.topItem?.title = "Fitness"
        
        let btn1 = UIBarButtonItem(image: UIImage(systemName: "pencil.slash"), style: .done, target: self, action: #selector(pressPencil))
        let btn2 = UIBarButtonItem(image: UIImage(systemName: "trash.circle"), style: .done, target: self, action: #selector(pressTrash))
        self.navigationBar.topItem?.rightBarButtonItems = [btn1, btn2]
        
        let barAppearance = UINavigationBarAppearance() // 탑top 바 포함 위로 다
        
        self.navigationBar.standardAppearance = barAppearance
        self.navigationBar.scrollEdgeAppearance = barAppearance
        self.navigationBar.compactAppearance = barAppearance
        self.navigationBar.compactScrollEdgeAppearance = barAppearance
    }

    
    @objc func pressPencil(){
        
    }
    
    @objc func pressTrash(){
        
    }
}
