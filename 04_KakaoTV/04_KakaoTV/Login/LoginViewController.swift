//
//  LoginViewControllerViewController.swift
//  04_KakaoTV
//
//  Created by 전율 on 2023/12/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButton.layer.borderWidth = 1
        self.loginButton.layer.borderColor = UIColor(named: "main-brown")?.cgColor
        self.loginButton.layer.cornerRadius = 20
    }
    
    
    @IBAction func buttonDidTap(_ sender: Any) {
        self.view.window?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
        
    }
    
    
}
