//
//  HomeTableHeaderView.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/18.
//

import UIKit

class HomeTableHeaderView: UIView {
    
    init(){
        super.init(frame: .zero)
        addView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "thumnail"))
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private func addView() {
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
