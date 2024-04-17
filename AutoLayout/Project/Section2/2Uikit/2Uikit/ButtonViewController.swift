//
//  ButtonViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/03/19.
//

import UIKit

class ButtonViewController: UIViewController {
    
    let button:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .gray
        btn.setTitle("nocal", for: .normal)
        btn.setTitle("onPress", for: .selected)
        btn.setTitle("ing", for: .highlighted)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor(.blue, for: .highlighted)
        //        btn.setImage(UIImage(systemName: "book"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        
        // only iOS 15 이상
        // img
        let imgConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold)
        let image = UIImage(systemName: "book",withConfiguration: imgConfig)
        btn.setImage(image, for: .normal)
        
        // title
        var btnConfig = UIButton.Configuration.plain()
        btnConfig.title = "main title"
        btnConfig.subtitle = "subTitle"
        
        
        // background
        btnConfig.background.strokeColor = .red
        btnConfig.background.strokeWidth = 1
        btnConfig.contentInsets.top = 15
        btnConfig.contentInsets.bottom = 15
        btnConfig.contentInsets.leading = 30
        btnConfig.contentInsets.trailing = 30
        
        btnConfig.image = UIImage(systemName: "book.closed.fill")
                
        btn.configuration = btnConfig
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout(){
        self.view.addSubview(button)
        button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
}
