//
//  AlignViewController.swift
//  Base
//
//  Created by 전율 on 2024/03/05.
//

import UIKit

class AlignViewController: UIViewController {
    
    var redView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    var orangeView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    var label1 = {
        let lbl = UILabel()
        lbl.text = "한글로 하는 경우"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 30)
        return lbl
    }()
    
    var label2 = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.text = "label\nlabel\nlabel"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 15)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setLayout2()
    }
    
    private func setLayout() {
        self.view.addSubview(orangeView)
        self.view.addSubview(redView)
        
        orangeView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        orangeView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        orangeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        orangeView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // red의 시작점은 orange의 시작점 + 10 에서 시작
        redView.leadingAnchor.constraint(equalTo: orangeView.leadingAnchor, constant: 10).isActive = true
        // red의 y축 탑은 orange의 top에서 시작
        redView.topAnchor.constraint(equalTo: orangeView.topAnchor).isActive = true
    }
    
    private func setLayout2() {
        self.view.addSubview(label1)
        self.view.addSubview(label2)
        label2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        label2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label1.trailingAnchor.constraint(equalTo: label2.leadingAnchor, constant: -20).isActive = true
        // baseline에 맞추기
        label1.lastBaselineAnchor.constraint(equalTo: label2.lastBaselineAnchor).isActive = true
        
        
    }
    
    
}
