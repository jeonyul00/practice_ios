//
//  BannerCollectionViewCell.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/01/31.
//

import UIKit
import SnapKit
import Kingfisher

class BannerCollectionViewCell:UICollectionViewCell {
    
    static let id = "BannerCell"
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 필요한 ui작업
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        // snapkit
        
        self.addSubview(backgroundImage)
        self.addSubview(titleLabel)
        
        // 제약 조건 설정
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    public func config(title: String, imageUrl: String) {
        titleLabel.text = title
        let url = URL(string: imageUrl)
        backgroundImage.kf.setImage(with: url)
        
    }
}
