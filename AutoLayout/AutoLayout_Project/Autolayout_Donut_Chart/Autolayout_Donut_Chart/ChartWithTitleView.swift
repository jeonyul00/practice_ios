//
//  ChartWithTitleView.swift
//  Autolayout_Donut_Chart
//
//  Created by jhlee on 10/29/23.
//

import UIKit

class ChartWithTitleView: CircleChartView {
    
    var percent: CGFloat = 0 {
        didSet{
//            45.4 => 45%
            let stringValue = String(format: "%.0f%%", percent)
            percentLabel.text = stringValue
        }
    }
    
    private let percentLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addLabel()
    }
    
    private func addLabel() {
        self.addSubview(self.percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        percentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

    }

}
