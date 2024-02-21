//
//  PatternView.swift
//  Autolayout_Pattern_Match_Lecture
//
//  Created by jhlee on 2023/09/11.
//

import UIKit

extension PatternView {
    func isValidPattern(pattern: [Int]) -> Bool {
       let indexes = connectedDots.map { $0.index }
        return indexes == pattern
    }
}

class PatternView: UIView {

    private var dots = [DotView]()
    
    private var connectedDots = [DotView]() {
        didSet{
            connectedDots.forEach { dot in
                print(dot.index, terminator: " ")
            }
            print()
        }
    }
    
    
    // 현재 드래그 중인 패스를 표현할 레이어 (터치시작시 생성, 터치 끝나면 없앤다.)
    private var currentLineLayer: CAShapeLayer?
    
    // 실제로 연결되는 패스를 표현할 레이어
    private var lineLayer: CAShapeLayer?
    
    // 실제 패스
    private var linePath: UIBezierPath?
    
    
    
    init() {
        super.init(frame: .zero)
        self.setupDots()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDots()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupDots()
    }
    
    
    func resetPattern() {
        connectedDots.removeAll()
        lineLayer?.removeFromSuperlayer()
        lineLayer = nil
        linePath = nil
        currentLineLayer?.removeFromSuperlayer()
        currentLineLayer = nil
        
        dots.forEach { dot in
            dot.isSelected = false
        }
        
    }
    
    private func setupDots() {
        let grid = 3 // 3x3 grid
        let totalSize = min(self.bounds.width, self.bounds.height)
        let dotSize: CGFloat = 40
        let spacing: CGFloat = (totalSize - dotSize * CGFloat(grid)) / (CGFloat(grid) - 1)
        
        // grid에 맞춰서 dotview를 배치
        for row in 0..<grid {
            for col in 0..<grid {
                
                let x = CGFloat(col) * (dotSize + spacing)
                let y = CGFloat(row) * (dotSize + spacing)
                
                let dotIndex = row * grid + col
                
                if dots.count > dotIndex {
                    // dotview가 이미 생성된 상태
                    dots[dotIndex].frame = CGRect(x: x, y: y, width: dotSize, height: dotSize)
                    
                }else{
                    let dot = DotView(frame: CGRect(x: x, y: y, width: dotSize, height: dotSize))
                    dot.index = dotIndex
                    dots.append(dot)
                    self.addSubview(dot)

                }
                
            }
        }
        
    }
    
    // 터치 시작시
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLineLayer = CAShapeLayer()
        currentLineLayer?.strokeColor = UIColor.blue.cgColor
        currentLineLayer?.lineWidth = 4
        self.layer.addSublayer(currentLineLayer!)
    }
    
    private func handleDotSelection(dot: DotView) {
        
        
        // 마지막으로 연결한 점이 있는지 확인
        if let lastDot = connectedDots.last {
            if let intermediateDot = findIntermediateDot(d1: lastDot, d2: dot) {
                connectedDots.append(intermediateDot)
                intermediateDot.isSelected = true
            }
        }
        
        
        
        connectedDots.append(dot)

        dot.isSelected = true
        
        if connectedDots.count == 1 {
            //  하나만 있을 경우 선택된 점이 시작점
            linePath = UIBezierPath()
            linePath?.move(to: dot.center)
        }else{
            linePath?.addLine(to: dot.center)
        }
        
        
        // 현재 경로를 다시 적용해서 다시 그리는 함수
        // 기존의 lineLayer를 제거한다.
        lineLayer?.removeFromSuperlayer()
        lineLayer = nil
        lineLayer = CAShapeLayer()
        lineLayer?.path = linePath?.cgPath
        lineLayer?.strokeColor = UIColor.blue.cgColor
        lineLayer?.lineWidth = 4
        lineLayer?.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(lineLayer!)
        
        
    }
    
    private func findIntermediateDot(d1: DotView, d2: DotView) -> DotView? {
        
        //  두 점의 인덱스를 오름차순으로 정렬한다.
        let indexes = (min(d1.index, d2.index), max(d1.index, d2.index))
        
        let pairsWithCenter: [(Int, Int, Int)] = [
        (0, 8, 4), (1, 7, 4), (2, 6, 4), (3, 5, 4), (1, 7, 4),
        (0, 6, 3), (2, 8, 5),
        (0, 2, 1), (6, 8, 7), (3, 5, 4),
        ]
        
        for pair in pairsWithCenter {
            if indexes == (pair.0, pair.1) {
                if !connectedDots.contains(where: { $0.index == pair.2 }) {
                    return dots[pair.2]
                }

            }
        }
        
        return nil
    }
    
    // 터치 이동시
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 첫번째 터치 이벤트를 가져온다.
        guard let touch = touches.first else { return }
        
        // 현재 터치 위치를 가져온다.
        let location = touch.location(in: self)
        
        for dot in dots {
            if dot.frame.contains(location) == true && !connectedDots.contains(where: { $0.index == dot.index
            }){
                handleDotSelection(dot: dot)
            }
        }
        
        // 아직 연결된 점이 없을 때는 선 표현을 안한다.
        if connectedDots.count == 0 {
            return
        }
        
        if let lastDot = connectedDots.last {
            let linePath = UIBezierPath()
            // 마지막으로 연결된 dotView의 가운데에서 시작한다.
            linePath.move(to: lastDot.center)
            linePath.addLine(to: location)
            currentLineLayer?.path = linePath.cgPath
        }
        
        

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLineLayer?.removeFromSuperlayer()
        currentLineLayer = nil
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupDots()
    }
}
