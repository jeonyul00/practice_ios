//
//  ProgressBarView.swift
//  ImageLoad_ProgressBar
//
//  Created by jhlee on 2023/08/20.
//

import UIKit

class ProgressBarView: UIView {
    
    var rate: CGFloat = 0 {
        didSet{
            DispatchQueue.main.async {
                self.setNeedsDisplay()
            }
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        
        let colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        
        gradientLayer.colors = colors
        gradientLayer.locations = [0, 0.5]
//        gradientLayer.cornerRadius = rect.height / 2
        // 수평
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
//        // 수직
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        
        
        // 아래에서 위로
//        gradientLayer.frame = CGRect(x: 0, y: (1 - rate) * rect.height, width: rect.width, height: rect.height * rate)
        
        // 위에서 아래로
//        gradientLayer.frame = CGRect(x: 0, y: 0 * rect.height, width: rect.width, height: rect.height * rate)

//        // 오른쪽에서 왼쪽
//        gradientLayer.frame = CGRect(x: (1 - rate) * rect.width, y: 0, width: rect.width * rate, height: rect.height)
        
        // 왼쪽에서 오른쪽으로
        gradientLayer.frame = CGRect(x: 0, y: 0, width: rect.width * rate, height: rect.height)


        print("y ", (1 - rate) * rect.height)
        print("height", rect.height * rate)
        
        self.layer.addSublayer(gradientLayer)

        
    }
    
}
