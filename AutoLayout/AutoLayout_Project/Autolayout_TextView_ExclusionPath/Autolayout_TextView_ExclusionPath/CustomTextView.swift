//
//  CustomTextView.swift
//  Autolayout_TextView_ExclusionPath
//
//  Created by jhlee on 2023/08/23.
//

import UIKit

enum TextViewType {
    case circleInImage
    case circleInText
    case circleOutText
}


class CustomTextView: UITextView {
    var textViewType = TextViewType.circleOutText
    
    init(textViewType: TextViewType) {
        super.init(frame: .zero, textContainer: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textViewType = textViewType
        
        self.backgroundColor = .orange
        
    

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        
        switch textViewType {
        case .circleInImage:
            circleInImage(rect)
        case .circleInText:
            circleInText(rect)
        case .circleOutText:
            circleOutText(rect)
        }
        
        
        
    }
    
    
    private func circleInImage(_ rect: CGRect) {
        // 원의 크기
        let circleSize: CGFloat = 100
        
        // 원의 위치와 크기
        let circleFrame = CGRect(x: rect.width / 2 - 50, y: 50, width: circleSize, height: circleSize)
        
        let circleBounds = CGRect(origin: .zero, size: CGSize(width: circleSize, height: circleSize))
                
        // 원 형태의 bezier path
        let circlePath = UIBezierPath(ovalIn: circleBounds)
        
        // Circle Layer생성
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        
        // Image Layer 생성
        let imageLayer = CALayer()
        imageLayer.contents = UIImage(named: "paths")?.cgImage
        imageLayer.frame = circleFrame
        
        // 이미지 레이어와 원 레이어를 마스크 적용한다.
        imageLayer.mask = circleLayer
        
        // 이미지 레이어를 올린다.
        self.layer.addSublayer(imageLayer)
        
        // 텍스트가 나오지 않을 영역 지정
        let circlePath2 = UIBezierPath(ovalIn: circleFrame)
        self.textContainer.exclusionPaths = [circlePath2]
        
        
        self.text = "여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. "
    }
    
    private func circleInText(_ rect: CGRect) {
        // 전체 뷰를 채우는 사격형 패스를 만든다.
        let rectanglePath = UIBezierPath(rect: rect)
        
        
        // 원의 크기
        let circleSize: CGFloat = 100
        
        // 원의 위치와 크기
        let circleFrame = CGRect(x: rect.width / 2 - 50, y: 50, width: circleSize, height: circleSize)

        
        let circlePath = UIBezierPath(ovalIn: circleFrame)
    
        // 사각형 패스에서 원 패스를 뺀다.
        rectanglePath.append(circlePath)
        rectanglePath.usesEvenOddFillRule = true
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = rectanglePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.gray.cgColor
        
        self.layer.addSublayer(circleLayer)
        
        
        self.textContainer.exclusionPaths = [rectanglePath]
        
        self.textContainerInset = .zero
        
        self.isScrollEnabled = false
        
        self.text = "여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. "

    }
    
    
    
    private func circleOutText(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: CGRect(x: rect.width / 2, y: 50, width: 100, height: 100))
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.lightGray.cgColor
        
        
        self.layer.addSublayer(circleLayer)
        
        self.textContainer.exclusionPaths = [circlePath]
//        self.textContainerInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
//        self.textContainer.lineFragmentPadding = 20
        
        self.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        
        self.text = "여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. 여기에 긴 텍스트를 넣으세요. Bezier Path로 정의된 영역을 제외하고 텍스트가 그려집니다. "
    }
    
 
}
