//
//  ViewController.swift
//  Autolayout_Pattern_Match_Lecture
//
//  Created by jhlee on 2023/09/09.
//

import UIKit

class ViewController: UIViewController {

    let patternView = PatternView()
    
    let resetButton = UIButton()
    
    let checkButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(patternView)
        patternView.translatesAutoresizingMaskIntoConstraints = false
        patternView.backgroundColor = .orange
        
        patternView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        patternView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        patternView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        patternView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        
        self.view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.rightAnchor.constraint(equalTo: patternView.rightAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: patternView.bottomAnchor, constant: 30).isActive = true
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.black, for: .normal)
        resetButton.addTarget(self, action: #selector(resetPattern), for: .touchUpInside)
        
        
        self.view.addSubview(checkButton)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        checkButton.leftAnchor.constraint(equalTo: patternView.leftAnchor).isActive = true
        checkButton.topAnchor.constraint(equalTo: patternView.bottomAnchor, constant: 30).isActive = true
        checkButton.setTitle("Check", for: .normal)
        checkButton.setTitleColor(.black, for: .normal)
        checkButton.addTarget(self, action: #selector(checkPattern), for: .touchUpInside)

        
    }
    
    @objc func resetPattern() {
        patternView.resetPattern()
        
    }
    
    @objc func checkPattern() {
        print(patternView.isValidPattern(pattern: [1,3,7,4]))
    }
    

}

