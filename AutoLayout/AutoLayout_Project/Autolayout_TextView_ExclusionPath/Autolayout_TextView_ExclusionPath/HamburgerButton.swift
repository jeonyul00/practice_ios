
import UIKit
import Foundation


class HamBurgerButton: UIButton {
    
    private let topLine = CAShapeLayer()
    private let middleLine = CAShapeLayer()
    private let bottomLine = CAShapeLayer()
    
    private var isToggled = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        [topLine, middleLine, bottomLine].forEach { layer in
            layer.fillColor = nil
            layer.strokeColor = UIColor.black.cgColor
            layer.lineWidth = 5.0
            self.layer.addSublayer(layer)
        }
        
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
        updatePaths(withAnimation: false)
    }
    
    @objc private func toggle() {
        isToggled.toggle()
        updatePaths()
    }
    
    private func updatePaths(withAnimation: Bool = true) {
        let width = self.bounds.width
        let height = self.bounds.height
        
        let topPath = UIBezierPath()
        let middlePath = UIBezierPath()
        let bottomPath = UIBezierPath()
        
        if isToggled {
            // 모든 선이 가운데로 모임
            topPath.move(to: CGPoint(x: 0, y: height / 2))
            topPath.addLine(to: CGPoint(x: width, y: height / 2))
            
            middlePath.move(to: CGPoint(x: 0, y: height / 2))
            middlePath.addLine(to: CGPoint(x: width, y: height / 2))
            
            bottomPath.move(to: CGPoint(x: 0, y: height / 2))
            bottomPath.addLine(to: CGPoint(x: width, y: height / 2))
        } else {
            // 햄버거 형태
            topPath.move(to: CGPoint(x: 0, y: height * 0.25))
            topPath.addLine(to: CGPoint(x: width, y: height * 0.25))
            
            middlePath.move(to: CGPoint(x: 0, y: height / 2))
            middlePath.addLine(to: CGPoint(x: width, y: height / 2))
            
            bottomPath.move(to: CGPoint(x: 0, y: height * 0.75))
            bottomPath.addLine(to: CGPoint(x: width, y: height * 0.75))
        }
        
        if withAnimation {
            animatePathChange(for: topLine, to: topPath.cgPath)
            animatePathChange(for: middleLine, to: middlePath.cgPath)
            animatePathChange(for: bottomLine, to: bottomPath.cgPath)
        } else {
            topLine.path = topPath.cgPath
            middleLine.path = middlePath.cgPath
            bottomLine.path = bottomPath.cgPath
        }
    }
    
    private func animatePathChange(for layer: CAShapeLayer, to newPath: CGPath) {
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = newPath
        animation.duration = 0.3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(animation, forKey: animation.keyPath)
    }
    
 
}
