//
//  ButtonView.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 8/24/24.
//

import Foundation
import UIKit
import SnapKit

class ButtonView:UIView {
    
    let tvButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("TV", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.configuration = UIButton.Configuration.bordered()
        return btn
    }()
    
    let movieButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Movie", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.configuration = UIButton.Configuration.bordered()
        return btn
    }()
    
    required init?(coder: NSCoder) { fatalError("not used") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
        
}

// MARK: - UI
extension ButtonView {
    private func setUI() {
        self.addSubview(tvButton)
        self.addSubview(movieButton)
        
        tvButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(20)
        }
        
        movieButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(tvButton.snp.trailing).offset(10)
        }
                        
    }
}
