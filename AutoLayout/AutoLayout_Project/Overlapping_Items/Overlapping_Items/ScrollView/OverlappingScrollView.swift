//
//  OverlappingScrollView.swift
//  Overlapping_Items
//
//  Created by jhlee on 2023/08/28.
//

import UIKit

class OverlappingScrollView: UIScrollView {

    private let imageNames: [String]
    private var itemSize: CGFloat
    
    private var imageContainerView = UIView()
 
    
    init(imageNames: [String], itemSize: CGFloat) {
        self.imageNames = imageNames
        self.itemSize = itemSize
        
        super.init(frame: .zero)
        
        setupImageView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {

        for (index, imageName) in imageNames.enumerated() {
            
            let imageView = UIImageView(image: UIImage(named: imageName))
            
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = itemSize / 2
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 4
            
            imageContainerView.addSubview(imageView)
            
            // 이미지뷰의 위치 설정
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate(
            [
                imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: itemSize),
                imageView.heightAnchor.constraint(equalToConstant: itemSize),
            ]
            )
            
            let leadingConstant = itemSize / 2 * CGFloat(index)
            
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor, constant: leadingConstant).isActive = true
            
            if index == imageNames.count - 1 {
                imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor).isActive = true
            }
            
            imageView.layer.zPosition = CGFloat(imageName.count - index)
 

        }
        
        self.addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.frameLayoutGuide.topAnchor.constraint(equalTo: imageContainerView.topAnchor).isActive = true
        self.frameLayoutGuide.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
        
        self.contentLayoutGuide.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor).isActive = true
        self.contentLayoutGuide.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor).isActive = true
        
        
        
    }
    
}
