//
//  MainTabbarViewController.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/18.
//

import UIKit

class MainTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // home view controller
//        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        homeVC.tabBarItem.title = "home"
//        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        // home navi view controller
        let homeNaviVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeNaviViewController") as! HomeNaviViewController
        
        homeNaviVC.tabBarItem.title = "home"
        homeNaviVC.tabBarItem.image = UIImage(systemName: "house")
        
        // newhot view controller
        let newHotVC = UIStoryboard(name: "NewHot", bundle: nil).instantiateViewController(withIdentifier: "NewHotViewController") as! NewHotViewController
        newHotVC.tabBarItem.title = "new & hot"
        newHotVC.tabBarItem.image = UIImage(systemName: "play.rectangle.on.rectangle")
        
        let tabbarAppearance = UITabBarAppearance()
//        tabbarAppearance.backgroundColor = .black
        tabbarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
        let tabbarItemAppearance = UITabBarItemAppearance()
        tabbarItemAppearance.normal.iconColor = .gray
        tabbarItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
        tabbarItemAppearance.selected.iconColor = .white
        tabbarItemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        tabbarAppearance.inlineLayoutAppearance = tabbarItemAppearance
        tabbarAppearance.stackedLayoutAppearance = tabbarItemAppearance
        tabbarAppearance.compactInlineLayoutAppearance = tabbarItemAppearance
        self.tabBar.standardAppearance = tabbarAppearance
        self.tabBar.scrollEdgeAppearance = tabbarAppearance
        self.viewControllers = [homeNaviVC, newHotVC]
    }
    
}
