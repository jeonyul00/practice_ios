//
//  OverlappingStackView.swift
//  Overlapping_Items
//
//  Created by jhlee on 2023/08/28.
//

import UIKit

class OverlappingStackView: UIView {

    private let stackView = UIStackView()
    private let imageNames: [String]
    
    private let itemSize: CGFloat
    
    init(imageNames: [String], itemSize: CGFloat) {
        self.itemSize = itemSize
        self.imageNames = imageNames
        super.init(frame: .zero)
        
        setupStackView()
        setupImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func setupImageView() {
        imageNames.forEach { imageName in
            let imageView = UIImageView(image: UIImage(named: imageName))
            
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 4
            imageView.layer.cornerRadius = self.itemSize / 2
            
            stackView.addArrangedSubview(imageView)
            
        }
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = -(itemSize / 2)
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true

    }
    

}
