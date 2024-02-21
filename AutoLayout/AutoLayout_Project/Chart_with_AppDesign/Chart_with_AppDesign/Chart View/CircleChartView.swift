//
//  CircleChartView.swift
//  Autolayout_Donut_Chart
//
//  Created by jhlee on 10/28/23.
//

import Foundation
import UIKit


class CircleChartView: UIView {
    
    enum ChartType {
        case pie
        case donut
    }
    
    var chartType = ChartType.donut {
        didSet{
            setNeedsLayout()
        }
    }
    
    var segments = [(UIColor, CGFloat)]() {
        didSet{
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawChart()
    }
    
    private func drawChart() {
        
        layer.sublayers?.forEach { sublayer in
            if sublayer.name == "removableLayer" {
                sublayer.removeFromSuperlayer()
            }
        }
        
        
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let radius = min(self.bounds.width, self.bounds.height) / 2
        let innerRadius = radius * 0.6

        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + (CGFloat.pi * 2)
        
        let backgroundPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        if chartType == .donut {
            backgroundPath.addArc(withCenter: center, radius: innerRadius * 0.92, startAngle: endAngle, endAngle: startAngle, clockwise: false)
        }
        
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.name = "removableLayer"
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.fillColor = UIColor.lightGray.cgColor
        
        self.layer.addSublayer(backgroundLayer)
 
        
        let total = segments.reduce(0) { partialResult, segment in
            partialResult + segment.1
        }
       
        var segmentStartAngle = -CGFloat.pi / 2
        
        for (color, value) in segments {
            let segmentEndAngle = segmentStartAngle + (CGFloat.pi * 2) * (value / total)
            
            let segmentPath = UIBezierPath()
            segmentPath.move(to: center)
            segmentPath.addArc(withCenter: center, radius: radius * 0.95, startAngle: segmentStartAngle, endAngle: segmentEndAngle, clockwise: true)
            
            
            if chartType == .donut {
                segmentPath.addArc(withCenter: center, radius: innerRadius, startAngle: segmentEndAngle, endAngle: segmentStartAngle, clockwise: false)
            }
            
            segmentPath.close()
            
            
            let segmentLayer = CAShapeLayer()
            segmentLayer.name = "removableLayer"
            segmentLayer.path = segmentPath.cgPath
            segmentLayer.fillColor = color.cgColor
            
            self.layer.addSublayer(segmentLayer)
            
            segmentStartAngle = segmentEndAngle
            
 
        }
    }
}
 
