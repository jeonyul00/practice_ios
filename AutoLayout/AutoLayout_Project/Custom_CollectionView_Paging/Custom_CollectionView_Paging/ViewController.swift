//
//  ViewController.swift
//  Custom_CollectionView_Paging
//
//  Created by jhlee on 2023/09/01.
//

import UIKit

class ViewController: UIViewController {
 
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        
        let layout = CustomZoomInOutLayout()
        
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CustomPagingCell.self, forCellWithReuseIdentifier: "CustomPagingCell")
        
        
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomPagingCell", for: indexPath) as! CustomPagingCell
        
//        cell.layer.cornerRadius = cell.bounds.width / 2
//        cell.clipsToBounds = true
        
        cell.imageTitle = "Profile No. \((indexPath.item % 12 + 1))"
        cell.bgImage = UIImage(named: "profile_photo_\(indexPath.item % 12 + 1)")
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
}

