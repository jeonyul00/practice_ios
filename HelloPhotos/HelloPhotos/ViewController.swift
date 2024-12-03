//
//  ViewController.swift
//  HelloPhotos
//
//  Created by 전율 on 11/28/24.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var allPhotos: PHFetchResult<PHAsset>?
    let imageManager = PHImageManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // PHCollectionList.fetchTopLevelUserCollections(with: nil) // 사용자 앨범 가져오기
        
        Task {
            let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
            
            switch status {
            case .notDetermined:
                break
            case .restricted, .denied:
                print(status.rawValue)
            case .authorized, .limited:
                print(status.rawValue)
            @unknown default:
                fatalError()
            }
        }
    }
    
    func fetchAllPhotos() {
        let options = PHFetchOptions()
        options.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        allPhotos = PHAsset.fetchAssets(with: options)
        collectionView.reloadData()
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AssetCollectionViewCell.self), for: indexPath) as! AssetCollectionViewCell
        if let target = allPhotos?.object(at: indexPath.item) {
            var size = CGSize.zero
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = Int((collectionView.bounds.width - (layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing)) / 2)
                size = CGSize(width: width, height: width)
            }
            imageManager.requestImage(for: target, targetSize: size, contentMode: .aspectFill, options:nil) { image, _ in
                cell.ThumbnailImageView.image = image
            }
        }
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let width = Int((collectionView.bounds.width - (layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing)) / 2)
        return CGSize(width: width, height: width)
    }
    
}
