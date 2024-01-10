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
        collectionView.backgroundColor = .black
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
        CGSize(width: 125, height: 175)
    }
}

extension HomeCell:UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 아이템을 눌렀을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieResult =  movieModel?.results[indexPath.row]
        // notification 포스트
        NotificationCenter.default.post(name: NSNotification.Name("presentDetailVC"), object: movieResult)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieModel?.resultCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        if let url = self.movieModel?.results[indexPath.item].artworkUrl {
            //            NetworkLayer.request(urlString: url) { img in
            //                DispatchQueue.main.async {
            //                    cell.coverImageView.image = img
            //                }
            //            }
            
            Task {
                let result = await NetworkLayer.requestAsyncAwait(urlString: url)
                switch result {
                    // return 되는 값을 받을 때
                case .success(let image):
                    cell.coverImageView.image = image
                case .failure(let error):
                    print(error)
                }
            }
            
        }
        
        return cell
    }
    
}

