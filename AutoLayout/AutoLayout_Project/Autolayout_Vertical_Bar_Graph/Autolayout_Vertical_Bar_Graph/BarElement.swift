//
//  BarElement.swift
//  Autolayout_Vertical_Bar_Graph
//
//  Created by jhlee on 2023/09/13.
//

import UIKit

class BarElement: UIView {
 
    private let valueLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    private func setupView() {
        self.backgroundColor = UIColor.init(red: 129/255, green: 204/255, blue: 240/255, alpha: 1)
        
        self.addSubview(valueLabel)
        
        valueLabel.layer.cornerRadius = 4
        valueLabel.textAlignment = .center
        valueLabel.font = .systemFont(ofSize: 14)
        valueLabel.textColor = .black
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.5
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        
    }
    
    
    // 0 ~ 1    0.5 -> 50%
    func setPercentValue(value: CGFloat) {
        valueLabel.text = String(format: "%.0f%%", value * 100)
    }
    
    
}
