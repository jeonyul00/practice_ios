//
//  HomeNaviViewController.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import UIKit

class HomeNaviViewController: UINavigationController {
    
    var effectViewAlpha:CGFloat = 0 {
        didSet {
            visuallEffectView.alpha = effectViewAlpha
        }
    }
    var statusBarHeight = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.statusBarManager?.statusBarFrame.height ?? 0
    lazy private var visuallEffectView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = self.navigationBar.bounds.insetBy(dx: 0, dy: -statusBarHeight).offsetBy(dx: 0, dy: -statusBarHeight)
        effectView.alpha = 0
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
        
        let logo = UIImage(named: "icon")
        let logoButton = UIButton()
        logoButton.setImage(logo, for: .normal)
        logoButton.frame = CGRect(x: 10, y: 5, width: 35, height: 35)
        //        logoButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        //        logoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
                                
        self.navigationBar.addSubview(visuallEffectView)
        // addSubview: 위에 얹고 싶을 때
        self.navigationBar.addSubview(logoButton)
        //        self.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        
        
    }
}
