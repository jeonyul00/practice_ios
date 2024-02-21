//
//  NumberButton.swift
//  Autolayout_Custom_Numpad_Lecture
//
//  Created by jhlee on 2023/09/17.
//

import Foundation
import UIKit

class NumberButton: UIButton {
    
 
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        
        self.backgroundColor = UIColor.systemGray5
        self.layer.cornerRadius = 10
        self.setTitleColor(.darkGray, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        
        
        self.addTarget(self, action: #selector(selectedDesign), for: [.touchDown])
        self.addTarget(self, action: #selector(normalDesign), for: [.touchUpInside, .touchDragExit, .touchCancel])

        normalDesign()
    }
    
    
    @objc func normalDesign() {
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
    }
    
    @objc func selectedDesign() {
        self.layer.shadowOpacity = 0
    }
    
    
}


