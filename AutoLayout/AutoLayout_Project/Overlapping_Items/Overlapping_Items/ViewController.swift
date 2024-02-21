//
//  ViewController.swift
//  Overlapping_Items
//
//  Created by jhlee on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {

   lazy var imageNames = getProfilesPhotoNames(count: 5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        overlapVC()
        
//        overlapStack()

        overlapScrollView()
    }
    
    func overlapScrollView() {
         let overlapScrollView = OverlappingScrollView(imageNames: imageNames, itemSize: 150)
        
        self.view.addSubview(overlapScrollView)
        
        overlapScrollView.translatesAutoresizingMaskIntoConstraints = false
    
        overlapScrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        overlapScrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        overlapScrollView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        overlapScrollView.heightAnchor.constraint(equalToConstant: 150).isActive = true

    }
    
    func overlapStack() {
        let overlapStackView = OverlappingStackView(imageNames: imageNames, itemSize: 100)
        
        self.view.addSubview(overlapStackView)
        
        overlapStackView.translatesAutoresizingMaskIntoConstraints = false
    
        overlapStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        overlapStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        overlapStackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        overlapStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }
    
    func overlapVC() {
        
        // 화면에 올리겠다.
        let overlapVC = OverlappingCollectionVC(imageNames: imageNames)
        
        self.addChild(overlapVC)
        self.view.addSubview(overlapVC.view)
        
        // 자식 뷰 컨트롤러 전환 완료
        overlapVC.didMove(toParent: self)
        
        overlapVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        overlapVC.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        overlapVC.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        overlapVC.view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        overlapVC.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    
    
    func getProfilesPhotoNames(count: Int) -> [String] {
        var imageNames = [String]()
        
        for i in 1...count {
            let imageName = "profile_photo_\(i)"
            
            if let _ = UIImage(named: imageName) {
                imageNames.append(imageName)
            }
        }
        
        return imageNames
    }

}

