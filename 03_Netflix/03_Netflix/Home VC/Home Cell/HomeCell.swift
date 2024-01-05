//
//  HomeCell.swift
//  03_Netflix
//
//  Created by 전율 on 2024/01/04.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movieModel:MovieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = flowLayout
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func requestMediaAPI(type: MediaType?) {
        guard let hasType = type else { return }
        NetworkLayer.request(type: hasType) { model in
            self.movieModel = model
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
}

extension HomeCell:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 125, height: 150)
    }
}

extension HomeCell:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        if let url = self.movieModel?.results[indexPath.item].artworkUrl {
            NetworkLayer.request(urlString: url) { img in
                DispatchQueue.main.async {
                    cell.coverImageView.image = img
                }
            }
        }
        
        return cell
    }
        
}

