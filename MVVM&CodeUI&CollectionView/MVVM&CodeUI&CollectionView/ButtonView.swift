//
//  ButtonView.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/02/01.
//

import Foundation
import UIKit
import SnapKit

class ButtonView:UIView {
    let tvButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("TV", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.configuration = UIButton.Configuration.bordered()
        return btn
    }()
    
    
    let movieButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("MOVIE", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.configuration = UIButton.Configuration.bordered()
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setUI() -> Void {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
