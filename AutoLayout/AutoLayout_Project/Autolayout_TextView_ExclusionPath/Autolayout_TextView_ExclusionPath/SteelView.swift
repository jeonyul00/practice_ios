//
//  File.swift
//  Autolayout_TextView_ExclusionPath
//
//  Created by jhlee on 2023/08/23.
//

import UIKit
class SteelView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(white: 0.7, alpha: 1.0).cgColor,
            UIColor(white: 0.9, alpha: 1.0).cgColor,
            UIColor(white: 0.8, alpha: 1.0).cgColor,
            UIColor(white: 0.9, alpha: 1.0).cgColor,
            UIColor(white: 0.7, alpha: 1.0).cgColor
        ]
        gradientLayer.locations = [0.0, 0.25, 0.5, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.first?.frame = self.bounds
    }
}
