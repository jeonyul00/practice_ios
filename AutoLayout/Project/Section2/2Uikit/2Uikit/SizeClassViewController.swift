//
//  SizeClassViewController.swift
//  2Uikit
//
//  Created by 전율 on 2024/03/18.
//

import UIKit

// 가로 세로 대응
class SizeClassViewController: UIViewController {
    
    var pLeading:NSLayoutConstraint?
    var pTop:NSLayoutConstraint?
    var lCentrX: NSLayoutConstraint?
    var lCentrY: NSLayoutConstraint?
    
    let imgView:UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "food1")
        imgView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imgView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
 
    func setLayout(){
        self.view.addSubview(imgView)
     
        
        // 세웠을때
        pLeading = imgView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 30)
        pTop = imgView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: -30)
        
        // 눞혔을때
        lCentrX = imgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        lCentrY = imgView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        setSizeClass()
    }
    
    // 인터페이스 스타일이 바꼈을 때 (눕히거나 세우거나, 다크모드)
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setSizeClass()
    }
    
    func setSizeClass(){
        if traitCollection.verticalSizeClass == .regular {
            print("디바이스를 세운 경우")
            pLeading?.isActive = true
            pTop?.isActive = true
            lCentrX?.isActive = false
            lCentrY?.isActive = false
        } else if traitCollection.verticalSizeClass == .compact {
            print("디바이스를 눞힌 경우")
            pLeading?.isActive = false
            pTop?.isActive = false
            lCentrX?.isActive = true
            lCentrY?.isActive = true
        }
    }
    
    
    
}
