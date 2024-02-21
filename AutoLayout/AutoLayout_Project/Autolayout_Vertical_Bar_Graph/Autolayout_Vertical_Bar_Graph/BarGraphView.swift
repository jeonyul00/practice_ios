//
//  BarGraphView.swift
//  Autolayout_Vertical_Bar_Graph
//
//  Created by jhlee on 2023/09/13.
//


//barPercents = [0.5, 0.7, 0.2, 0.5]

import UIKit

class BarGraphView: UIView {

    private var bars = [BarElement]()
    
    private var barSpacing: CGFloat = 10
    
    var barPercents = [CGFloat](){
        didSet {
            setNeedsLayout()
//            setupBars()
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupBars()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBars()

    }
    
    private func setupBars() {
        
        let barWidth = (self.bounds.width - barSpacing * CGFloat(barPercents.count + 1)) / CGFloat(barPercents.count)
        
        
        for barIndex in 0..<barPercents.count {
            let x = barSpacing * CGFloat(barIndex + 1) + barWidth * CGFloat(barIndex)
            
            let barHeight = barPercents[barIndex] * self.bounds.size.height
            
            let y = self.bounds.height - barHeight

            // anchorPoint
            
            
            if bars.count > barIndex {
                // bar가 만들어진 상황
                // 0.5, 1
                bars[barIndex].frame = CGRect(x: x, y: y, width: barWidth, height: barHeight)
  
                
            }else{
                let bar = BarElement()
                bars.append(bar)
                self.addSubview(bar)
                
                bar.anchorPoint = CGPoint(x: 0.5, y: 1)
                bar.frame = CGRect(x: x, y: y, width: barWidth, height: barHeight) // 이 때 anchorPoint를 설정하지 않으면 기본값인 0.5, 0.5 가 설정된다.

            }
            
            bars[barIndex].setPercentValue(value: barPercents[barIndex])
            
            addAnimation(barIndex: barIndex, barHeight: barHeight)
        }
 
        
    }
    private func addAnimation(barIndex: Int, barHeight: CGFloat) {
        
      let animation = CABasicAnimation(keyPath: "bounds.size.height")
        // 애니메이션 시작 값
        animation.fromValue = 0
        // 애니메이션 종료 값
        animation.toValue = barHeight
        // 애니메이션 지속되는 시간
        animation.duration = 0.5
        // 애니메이션 시작 시간을 설정 current에서 추가된 값 만큼 늦게 시작한다.
        animation.beginTime = CACurrentMediaTime() + 0.3 * CGFloat(barIndex)
        // 애니메이션이 완료된 후 애니메이션 toValue상태를 계속 유지한다.
        // forwords - 애니메이션 종료시점 값 유지, isRemovedOnCompletion이 false여야함.
        // backwords - 애니메이션 시작 전에 값 미리 적용
        // both - 애니메이션 시작 종료 모두 유지
        animation.fillMode = .backwards
        // 애니메이션 종류 후 애니메이션 객체를 지울지 여부
        animation.isRemovedOnCompletion = true
        
        bars[barIndex].layer.add(animation, forKey: "heightAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBars()
    }

}
