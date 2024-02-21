//
//  ProfileSelectView.swift
//  Chart_with_AppDesign
//
//  Created by jhlee on 10/30/23.
//

import UIKit

class ProfileButton: UIButton {
    
    let selectView = ProfileSelectView()

    override var isSelected: Bool {
        didSet{
            selectView.isSelected = self.isSelected
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(selectView)
        
        selectView.translatesAutoresizingMaskIntoConstraints = false
        selectView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        selectView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        selectView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        selectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        selectView.isUserInteractionEnabled = false
        
        
        self.addTarget(self, action: #selector(toggleSelected), for: .touchUpInside)
        

    }
    
    @objc private func toggleSelected() {
        self.isSelected.toggle()
    }
    
    
    override var isHighlighted: Bool {
        didSet{
            if isHighlighted {
                selectView.alpha = 0.4
            }else{
                selectView.alpha = 1
            }
        }
    }
    
    

}


class ProfileSelectView: UIView {
    
    lazy var isSelected = false {
        didSet{
            UIView.animate(withDuration: 0.1) {
                if self.isSelected {
                    self.arrowImageView.transform = .init(rotationAngle: .pi)
                }else{
                    self.arrowImageView.transform = .identity
                }
            }
        }
    }
    
    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet{
            profileImageView.layer.cornerRadius = 20
            profileImageView.clipsToBounds = true
            profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "ProfileSelectView", bundle: nil)
        if let object = nib.instantiate(withOwner: self).first as? UIView {
            self.addSubview(object)
            object.translatesAutoresizingMaskIntoConstraints = false
            object.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            object.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            object.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            object.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
        }
    }
    

}
