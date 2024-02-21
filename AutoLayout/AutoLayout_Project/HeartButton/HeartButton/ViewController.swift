//
//  ViewController.swift
//  HeartButton
//
//  Created by jhlee on 2023/08/20.
//

import UIKit

class ViewController: UIViewController {

    let heartButton = HeartButton()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        heartButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        heartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        heartButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        heartButton.addTarget(self, action: #selector(someEvent), for: .touchUpInside)

    }
    
    @objc func someEvent() {
        print("pressed button")
    }


}

