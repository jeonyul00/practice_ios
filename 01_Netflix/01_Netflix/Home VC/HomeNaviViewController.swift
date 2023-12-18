//
//  HomeNaviViewController.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/18.
//

import UIKit

class HomeNaviViewController: UINavigationController {
    
    let statusBarHeight = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.statusBarManager?.statusBarFrame.height
    
    lazy var visuallEffecView:UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = self.navigationBar.bounds.insetBy(dx: 0, dy: -statusBarHeight!).offsetBy(dx: 0, dy: -statusBarHeight!)
        return effectView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.compactScrollEdgeAppearance = appearance
        let logo = UIImage(named: "logo")
        
        let logoButton = UIButton()
        logoButton.setImage(logo, for: .normal)
        logoButton.frame = CGRect(x: 10, y: 0, width: 30, height: 30)
                
        visuallEffecView.alpha = 0.0
        self.navigationBar.addSubview(visuallEffecView)
        self.navigationBar.addSubview(logoButton)
                
    }

}
