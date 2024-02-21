//
//  DotView.swift
//  Autolayout_Pattern_Match_Lecture
//
//  Created by jhlee on 2023/09/09.
//

import UIKit

class DotView: UIView {

    // 인덱스 속성 지정
    var index: Int = 0
    
    var isSelected: Bool = false {
        didSet{
            backgroundColor = isSelected ? .blue : .gray
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.backgroundColor = .gray
    }

}
