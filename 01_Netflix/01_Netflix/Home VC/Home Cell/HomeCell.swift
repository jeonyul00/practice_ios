//
//  HomeCell.swift
//  01_Netflix
//
//  Created by 전율 on 2023/12/19.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movieModel:MovieModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        // 레이어 설정
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor = .black
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    func requestMediaAPI(type:MediaType?){
        guard let type = type else { return }
        NetworkLayer.request(type: type) { model in
            self.movieModel = model
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension HomeCell:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 150)
    }
}

extension HomeCell:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        if let hasURL = self.movieModel?.results[indexPath.row].artworkUrl {
            NetworkLayer.request(urlString: hasURL) { image in
                DispatchQueue.main.async {
                    cell.coverImageView.image = image
                }
                
            }
        }
        return cell
    }
    
}
