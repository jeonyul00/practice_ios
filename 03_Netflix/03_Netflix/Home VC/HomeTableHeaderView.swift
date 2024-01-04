//
//  HomeTableHeaderView.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import UIKit

class HomeTableHeaderView: UIView {
    
    var imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "thumbnail"))
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true // overView: hidden
        imgView.translatesAutoresizingMaskIntoConstraints = false // autoLayout 허용하냐 => false가 허용임, true면 프레임
        return imgView
    }()
    
    init(){
        super.init(frame: .zero)
        addImgView()
    }
    
    // UIView를 초기화할 때 이거 써야함
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImgView()
    }
    
    // xib나 class로 연결된 호출이면 여기로 호출
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addImgView() {
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
        
}
