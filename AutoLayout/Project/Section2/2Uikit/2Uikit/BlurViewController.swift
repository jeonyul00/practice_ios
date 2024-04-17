//
//  BlurViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/04/17.
//

import UIKit

class BlurViewController: UIViewController {
    
    var bgImageView:UIImageView = {
        var imgView = UIImageView()
        imgView.image = UIImage(named: "bg2")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var effectView:UIVisualEffectView = {
        let effectView = UIVisualEffectView()
        effectView.effect = UIBlurEffect(style: .regular)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBG()
        setLayout()
    }
    
    func setBG() -> Void {
        self.view.addSubview(bgImageView)
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        bgImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
    
    func setLayout(){
        self.view.addSubview(effectView)
        effectView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        effectView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        effectView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        effectView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}
