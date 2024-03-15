//
//  ViewController.swift
//  Base
//
//  Created by 전율 on 2024/02/29.
//

import UIKit

class ViewController: UIViewController {
    var button1: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var button2: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var button3: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var button4: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .brown
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    struct btnInfo {
        static let multiplier: [(y:CGFloat,x:CGFloat)] = [
            (0.5,0.5),(0.5,1.5),(1.5,0.5),(1.5,1.5)
        ]
    }
    
    func setLayout() {
        // isActive = true === 제약 조건 활성화
        // self.view.addSubview(button1) // view에 button1 올림
        //        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true // width 100으로 고정
        //        button1.widthAnchor.constraint(equalTo: button1.heightAnchor, multiplier: 1).isActive = true // width와 height 1:1 비율로 설정
        //        button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true // button1을 self.view의 가로 중앙에 맞춤
        //        button1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true // button1을 self.view의 세로 중앙에 맞춤
        //        NSLayoutConstraint(item: button1, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.5, constant: 0).isActive = true
        //        NSLayoutConstraint(item: button1, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 0.5, constant: 0).isActive = true
        
        //        self.view.addSubview(button2)
        //        button2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        button2.widthAnchor.constraint(equalTo: button2.heightAnchor, multiplier: 1).isActive = true
        //        NSLayoutConstraint(item: button2, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.5, constant: 0).isActive = true
        //        NSLayoutConstraint(item: button2, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.5, constant: 0).isActive = true
        
        // 중복 코드 너무 많음 👆
        
        let btns: [UIButton] = [button1,button2,button3,button4]
        for (index, btn) in btns.enumerated() {
            self.view.addSubview(btn)
            btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
            btn.widthAnchor.constraint(equalTo: btn.heightAnchor, multiplier: 1).isActive = true
            NSLayoutConstraint(item: btn, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: btnInfo.multiplier[index].y, constant: 0).isActive = true
            NSLayoutConstraint(item: btn, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: btnInfo.multiplier[index].x, constant: 0).isActive = true
        }
        
    }
    
}
