//
//  StackViewViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/03/18.
//

import UIKit

class StackViewViewController: UIViewController {
    
    let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .orange
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .lastBaseline
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .yellow
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .lastBaseline
        stackView.distribution = .fill
        return stackView
    }()
    
    var label1:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray
        lbl.text = "label 1"
        return lbl
    }()
    
    var label2:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray
        lbl.text = "label 2 \n label 2"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var label3:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray
        lbl.text = "label 3"
        return lbl
    }()
    
    var label4:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray
        lbl.text = "label 4"
        return lbl
    }()
    
    var label5:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray
        lbl.text = "label 5 label 5 label 5"
        return lbl
    }()
    
    var label6:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray
        lbl.text = "label 6"
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
    }
    
    private func setLayout(){
        self.view.addSubview(stackView1)
        self.view.addSubview(stackView2)
        
        stackView1.addArrangedSubview(label1)
        stackView1.addArrangedSubview(label2)
        stackView1.addArrangedSubview(label3)
        
        stackView1.removeArrangedSubview(label3) // 스택에서 빠지는거지 화면에서 빠지는게 아님
        label3.removeFromSuperview() // 화면에서 제거
        
        stackView2.addArrangedSubview(label4)
        stackView2.addArrangedSubview(label5)
        stackView2.addArrangedSubview(label6)
        
        stackView1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        stackView1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        stackView2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }

}
