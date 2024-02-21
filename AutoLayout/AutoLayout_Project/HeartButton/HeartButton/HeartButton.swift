//
//  HeartButton.swift
//  HeartButton
//
//  Created by jhlee on 2023/08/20.
//

import UIKit


class HeartButton: UIButton {
    
    
    private let heartPath = UIBezierPath()
    
    private let heartLayer = CAShapeLayer()
    
    init() {
        super.init(frame: .zero)
        // addTarget
        
//        addTarget(self, action: #selector(animateScaleDown), for: .touchDown)
        
        addTarget(self, action: #selector(animateSpring), for: .touchUpInside)
        addTarget(self, action: #selector(animateSmallCircle), for: .touchUpInside)

 
    }
    
//    @objc private func animateScaleDown() {
//    }
    
    
    @objc private func animateSpring() {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 0.85, 1.15, 0.95, 1.05, 1.0]
        bounceAnimation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        bounceAnimation.duration = 0.5
        heartLayer.add(bounceAnimation, forKey: "bounce")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.3) {
            self.layer.transform = CATransform3DMakeScale(0.9, 0.9, 1)
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.3) {
            self.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        
        let startPoint = CGPoint(x: rect.width / 2, y: rect.height * 0.75)
        let topPoint = CGPoint(x: rect.width / 2, y: rect.height * 0.2)
        let bottomPoint = startPoint
        
        
        let rightControlPointForTopMiddle = CGPoint(x: rect.width, y: rect.height * 0.55)
        let rightControlPointForTopPeak = CGPoint(x: rect.width, y: 0)
        
        let leftControlPointForTopMiddle = CGPoint(x: 0, y: rect.height * 0.55)
        let leftControlPointForTopPeak = CGPoint(x: 0, y: 0)
        
        
        heartPath.move(to: startPoint)
        heartPath.addCurve(to: topPoint, controlPoint1: rightControlPointForTopMiddle, controlPoint2: rightControlPointForTopPeak)
        
        heartPath.addCurve(to: bottomPoint, controlPoint1: leftControlPointForTopPeak, controlPoint2: leftControlPointForTopMiddle)
        
        heartPath.close()
        
        
   
        
        heartLayer.path = heartPath.cgPath
        heartLayer.fillColor = UIColor.orange.withAlphaComponent(0.7).cgColor
        heartLayer.strokeColor = UIColor.gray.cgColor
        heartLayer.lineWidth = 2
        heartLayer.bounds = heartPath.bounds
//        heartLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        heartLayer.position = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        layer.addSublayer(heartLayer)
        
    }
    
    @objc func animateSmallCircle() {
        
        
        let count = 5
        
        for _ in 0..<count {
            
            let smallCircleView = UIView(frame: CGRect(x: bounds.width / 2 - 4, y: bounds.height / 2 - 4, width: 8, height: 8))
            
            smallCircleView.backgroundColor = .red
            smallCircleView.layer.cornerRadius = 4
            self.addSubview(smallCircleView)
            
            // 랜덤 각도
            let angle = CGFloat.random(in: 0..<CGFloat.pi * 2)
            
            let distance: CGFloat = 50
            
            let locationX = cos(angle) * distance + (bounds.width / 2 - 4)
            let locationY = sin(angle) * distance + (bounds.height / 2 - 4)
            
            let movingLocation = CGPoint(x: locationX, y: locationY)
            
            UIView.animate(withDuration: 0.5, animations: {
                smallCircleView.center = movingLocation
                smallCircleView.alpha = 0
            }) { _ in
                smallCircleView.removeFromSuperview()
            }
            
        }
        
        
        
    }
 
}
