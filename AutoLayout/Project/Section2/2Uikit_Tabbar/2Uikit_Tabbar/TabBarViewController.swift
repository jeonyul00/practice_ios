//
//  TabBarViewController.swift
//  2Uikit_Tabbar
//
//  Created by 전율 on 2024/04/18.
//

import UIKit

class HomeTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        makeVCs()
        makeTabbarDesign()
    }
            
    private func makeVCs() {
        let vc = ViewController()
        let vc2 = ViewController2()
        let vc3 = ViewController3()
        
        vc.tabBarItem.title = "home"
        vc2.tabBarItem.title = "feed"
        vc3.tabBarItem.title = "setting"
        
        vc.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle.fill")
        vc3.tabBarItem.image = UIImage(systemName: "gear")

        self.viewControllers = [vc, vc2, vc3]
    }
    
    private func makeTabbarDesign() {
        // 탭바
        let tabbarAppearance = UITabBarAppearance()
        tabbarAppearance.backgroundEffect = UIBlurEffect(style: .regular)
        
        // 탭바 아이템
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.titleTextAttributes = [ .backgroundColor : UIColor.gray ]
        itemAppearance.selected.titleTextAttributes = [ .backgroundColor : UIColor.red ]
        
        itemAppearance.normal.iconColor = .gray
        itemAppearance.selected.iconColor = .red
        
        tabbarAppearance.inlineLayoutAppearance = itemAppearance // 아이콘과 제목이 수평일 때
        tabbarAppearance.stackedLayoutAppearance = itemAppearance // 아이콘과 제목이 수직일 때
        tabbarAppearance.compactInlineLayoutAppearance = itemAppearance // 제일 큰 폰 빼고 세우면 다 컴팩트임 -> HIG 살펴봐.
        
        self.tabBar.standardAppearance = tabbarAppearance // 일반
        
        tabbarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
        self.tabBar.scrollEdgeAppearance = tabbarAppearance // 스크롤이 맨 밑에 갔을 때
    }
    
    
        
}
