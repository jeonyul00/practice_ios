//
//  TextInput2ViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/04/17.
//

import UIKit

class TextInput2ViewController: UIViewController {
    
    var myButton: UIButton = {
        let btn = UIButton()
        var confing = UIButton.Configuration.tinted()
        confing.title = "my Button"
        btn.configuration = confing
        let myMenu = UIMenu(children: [
            UIAction(title: "item11", handler: { action in
                print(action)
            }),
            UIAction(title: "item22", handler: { action in
                print(action)
            })
        ])
        btn.menu = myMenu
        btn.showsMenuAsPrimaryAction = true // 누르자마자 메뉴 리스트 바로 나옴
        btn.changesSelectionAsPrimaryAction = true // 누른 값으로 변함
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myButton)
        myButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
    }
                                    

}

