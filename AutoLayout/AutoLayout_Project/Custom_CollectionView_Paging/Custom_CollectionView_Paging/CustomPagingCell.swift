//
//  CustomPagingCell.swift
//  Custom_CollectionView_Paging
//
//  Created by jhlee on 2023/09/02.
//

import UIKit

class CustomPagingCell: UICollectionViewCell {
    
    
    private let bgImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
 
   
    private let visualEffectView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.translatesAutoresizingMaskIntoConstraints = false

       return effectView
    }()
    
    private let imageTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.textColor = .darkGray
        
        return label
    }()
    
 
    var imageTitle: String? {
        didSet{
            imageTitleLabel.text = imageTitle
        }
    }
    
    var bgImage: UIImage? {
        didSet{
            self.bgImageView.image = bgImage
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        print("init frame")

        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(visualEffectView)
        self.contentView.addSubview(imageTitleLabel)
        
        
        bgImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        bgImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        bgImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        
        
        visualEffectView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        visualEffectView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        imageTitleLabel.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor).isActive = true
        imageTitleLabel.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor).isActive = true
        imageTitleLabel.topAnchor.constraint(equalTo: visualEffectView.topAnchor).isActive = true
        imageTitleLabel.bottomAnchor.constraint(equalTo: visualEffectView.bottomAnchor).isActive = true

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
