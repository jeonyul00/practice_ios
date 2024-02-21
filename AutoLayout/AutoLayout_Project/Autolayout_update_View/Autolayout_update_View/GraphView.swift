//
//  GraphView.swift
//  Autolayout_update_View
//
//  Created by jhlee on 2023/08/18.
//

import UIKit


class GraphView: UIView {
    
    
    var percentages: [CGFloat] = [] {
        didSet{
            self.setNeedsDisplay()
            // 데이터가 변경되면 다시 그려달라고 요청
            // draw(_ rect: CGRect) 이 함수를 호출한다.
            // 바로 드로잉을 하는게 아니고 다음 드로잉 사이클때 그려달라고 요청함.
            // 시간에 따른 애니메이션을 적용하지 않고 바로 갱신된다.
            
//            self.layoutIfNeeded()
            // 레이아웃이 변경되어야 할때 즉시 업데이트 된다.
            // layoutSubviews()
            // 시간에 따른 애니메이션을 적용한다.

        }
    }
    
    private func convertPercentToPoint(percentages: [CGFloat]) -> [CGPoint]{

        var points = [CGPoint]()
        
        for (index, percent) in percentages.enumerated() {
            let reversePercent = 1 - percent
            
            let positionY = self.bounds.height * reversePercent
            
            let positionX = self.bounds.width / CGFloat(percentages.count) * CGFloat(index)
            
            points.append(CGPoint(x: positionX, y: positionY))
            
        }
        
        return points
    }
    
    
    override func draw(_ rect: CGRect) {
        print("draw")
        guard !percentages.isEmpty else {
            self.layer.removeLayer(withTag: 100)
            self.layer.removeLayer(withTag: 200)
            return
        }
        
        let points = convertPercentToPoint(percentages: percentages)
        drawLine(points: points)
        drawDot(points: points)
        
    }
    
    private func addAnimation(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1
        
        layer.add(animation, forKey: "lineAnimation")
        
    }
    
    
    private func drawDot(points: [CGPoint]) {
        
        self.layer.removeLayer(withTag: 100)
        
        for point in points {
            // bezierPath
            let path = UIBezierPath()

            path.addArc(withCenter: point, radius: 5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
            
            // layer (CAShapeLayer)
            let dotLayer = TaggedLayer()
            dotLayer.path = path.cgPath
            dotLayer.lineWidth = 3
            dotLayer.strokeColor = UIColor.clear.cgColor
            dotLayer.fillColor = UIColor.red.cgColor
            dotLayer.tag = 100
            
            // 표시하고 싶은 화면에 올린다.
            self.layer.addSublayer(dotLayer)

        }


    }
   
    private func drawLine(points: [CGPoint]) {
        
        self.layer.removeLayer(withTag: 200)

        // bezierPath
        let path = UIBezierPath()
        
        for (index, point) in points.enumerated() {
            if index == 0 {
                path.move(to: point)
                continue
            }
            path.addLine(to: point)
        }

        // layer (CAShapeLayer)
        let lineLayer = TaggedLayer()
        lineLayer.path = path.cgPath
        lineLayer.lineWidth = 3
        lineLayer.strokeColor = UIColor.blue.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.tag = 200
        addAnimation(layer: lineLayer)
        
        // 표시하고 싶은 화면에 올린다.
        self.layer.addSublayer(lineLayer)

    }
    
}


class TaggedLayer: CAShapeLayer {
    var tag: Int = 0
}

extension CALayer {
    func removeLayer(withTag tag: Int) {
        if let subLayers = self.sublayers {
            for subLayer in subLayers {
                if let taggedLayer = subLayer as? TaggedLayer, taggedLayer.tag == tag {
                    print("remove layer")
                    taggedLayer.removeFromSuperlayer()
                }
            }
        }
    }
}
