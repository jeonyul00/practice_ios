//
//  FitnessView.swift
//  FitnessWithScrollView
//
//  Created by jhlee on 2023/07/16.
//

import UIKit

class FitnessView: UIView {

    @IBOutlet weak var bgImageView: UIImageView!{
        didSet{
            bgImageView.contentMode = .scaleAspectFill
        }
    }

    @IBOutlet weak var fitnessTitle: UILabel!
    
    
    init() {
        super.init(frame: .zero)
        loadNib()
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    
    private func loadNib() {
        
        
        
        
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


