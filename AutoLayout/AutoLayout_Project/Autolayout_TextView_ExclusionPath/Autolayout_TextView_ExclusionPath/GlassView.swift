//
//  File.swift
//  Autolayout_TextView_ExclusionPath
//
//  Created by jhlee on 2023/08/23.
//

import UIKit

class GlassView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGlassEffect()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGlassEffect()
    }
    
    private func setupGlassEffect() {
        // 그라데이션 설정
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(white: 1.0, alpha: 0.2).cgColor,
            UIColor(white: 0.9, alpha: 0.3).cgColor,
            UIColor(white: 0.8, alpha: 0.4).cgColor,
            UIColor(white: 0.9, alpha: 0.3).cgColor,
            UIColor(white: 1.0, alpha: 0.2).cgColor
        ]
        gradientLayer.locations = [0.0, 0.2, 0.5, 0.8, 1.0]
        self.layer.addSublayer(gradientLayer)
        
        // 테두리와 그림자 설정
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(white: 0.8, alpha: 0.3).cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 3.0
        self.layer.cornerRadius = 5.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.first?.frame = self.bounds
    }
}
