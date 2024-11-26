//
//  CircularSlider.swift
//  HelloCustomView
//
//  Created by 전율 on 11/26/24.
//

import UIKit

class CircularSlider: UIView {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let rect = rect.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        let circl = UIBezierPath(ovalIn: rect)
        circl.lineWidth = 30
        UIColor.yellow.setFill()
        UIColor.systemBlue.setStroke()
        circl.stroke()
        let verticalLine = UIBezierPath()
        verticalLine.move(to: CGPoint(x: rect.midX, y: rect.minY))
        verticalLine.addLine(to: CGPoint(x: rect.midX, y: rect.maxY) )
        verticalLine.lineWidth = 30
        verticalLine.lineCapStyle = .round
        verticalLine.stroke()
        let angleLine = UIBezierPath()
        angleLine.lineWidth = 30
        angleLine.move(to: CGPoint(x: rect.minX + angleLine.lineWidth, y: rect.midY * 1.5))
        angleLine.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        angleLine.addLine(to: CGPoint(x: rect.maxX - angleLine.lineWidth , y: rect.midY * 1.5))
        angleLine.lineJoinStyle = .round
        angleLine.stroke()
        
    }
    
    
}

