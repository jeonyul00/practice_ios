//
//  MainTabbarViewController.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let newHotVC = UIStoryboard(name: "NewHot", bundle: nil).instantiateViewController(withIdentifier: "NewHotViewController") as! NewHotViewController
        
        homeVC.tabBarItem.title = "home"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        newHotVC.tabBarItem.title = "New & Hot"
        newHotVC.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        
        // 설정: 탭바
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .black
        // tabBarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
                        
        // 설정: 탭바 아이템
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.iconColor = .darkGray
        tabBarItemAppearance.normal.titleTextAttributes = [.foregroundColor:UIColor.darkGray]
        tabBarItemAppearance.selected.iconColor = .white
        tabBarItemAppearance.selected.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        // 설정: 서있을때, 누워있을때 등
        tabBarAppearance.inlineLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = tabBarItemAppearance
        
        // 적용
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        self.viewControllers = [homeVC, newHotVC]
    }
    
}
