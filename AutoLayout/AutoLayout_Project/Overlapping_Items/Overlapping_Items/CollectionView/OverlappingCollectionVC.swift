//
//  OverlappingCollectionVC.swift
//  Overlapping_Items
//
//  Created by jhlee on 2023/08/27.
//

import UIKit


class OverlappingCollectionVC: UICollectionViewController {
    
    private let reuseIdentifier = "ImageCell"
    private let imageNames: [String]
    
    private var itemSize: CGFloat = 0
    
    init(imageNames: [String]) {
        self.imageNames = imageNames
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        self.view.backgroundColor = .orange
        
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(ImageCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        itemSize = self.collectionView.bounds.height
        
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: itemSize, height: itemSize)
            layout.minimumLineSpacing = -(itemSize / 2)
            layout.scrollDirection = .horizontal
            
        }
        
        
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCell
    
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}


