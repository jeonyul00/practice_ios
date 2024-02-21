//
//  ImageCell.swift
//  Overlapping_Items
//
//  Created by jhlee on 2023/08/27.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imageView)
    }
    
    init() {
        super.init(frame: .zero)
        self.contentView.addSubview(imageView)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // draw
    // 뷰를 그리는 작업을 담는다.

    // layoutSubviews
    // 크기나 위치 변경이나 추가됐을 때 이 함수가 호출
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
        imageView.layer.cornerRadius = bounds.width / 2
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.white.cgColor
        
    }
    
}
