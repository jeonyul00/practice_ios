//
//  FitnessView.swift
//  FitnessAppScroll
//
//  Created by 전율 on 2024/06/04.
//

import UIKit

class FitnessView: UIView {
    
    @IBOutlet weak var bgImageView: UIImageView! {
        didSet {
            bgImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var fitnessTitle: UILabel!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    // 초기화 시 nib 파일도 같이 호출되도록
    init() {
        super.init(frame: .zero)
        loadNib()
    }
        
    
    private func loadNib(){
        if let loadedView = UINib(nibName: "FitnessView", bundle: nil).instantiate(withOwner: self).first as? UIView {
            self.addSubview(loadedView)
            loadedView.translatesAutoresizingMaskIntoConstraints = false
            loadedView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            loadedView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            loadedView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            loadedView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
    
    
}
