//
//  File.swift
//  Autolayout_TextView_ExclusionPath
//
//  Created by jhlee on 2023/08/23.
//

import UIKit

class StainlessSteelView: UIView {
    
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
            UIColor(white: 0.65, alpha: 1.0).cgColor,
            UIColor(white: 0.75, alpha: 1.0).cgColor,
            UIColor(white: 0.7, alpha: 1.0).cgColor,
            UIColor(white: 0.8, alpha: 1.0).cgColor,
            UIColor(white: 0.7, alpha: 1.0).cgColor
        ]
        gradientLayer.locations = [0.0, 0.4, 0.5, 0.6, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        self.layer.addSublayer(gradientLayer)
        
        let noiseLayer = CALayer()
        noiseLayer.frame = self.bounds
        noiseLayer.contents = generateNoiseImage()
        noiseLayer.opacity = 0.1
        self.layer.addSublayer(noiseLayer)
    }
    
    private func generateNoiseImage() -> CGImage? {
        let size = 128
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        for _ in 0..<5000 {
            let x = Int(arc4random_uniform(UInt32(size)))
            let y = Int(arc4random_uniform(UInt32(size)))
            let color = (arc4random_uniform(100) < 50) ? UIColor.white : UIColor.black
            context?.setFillColor(color.cgColor)
            context?.fill(CGRect(x: x, y: y, width: 1, height: 1))
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image?.cgImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.forEach { $0.frame = self.bounds }
    }
}
