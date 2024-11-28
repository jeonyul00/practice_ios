//
//  LimitedLibraryViewController.swift
//  HelloPhotos
//
//  Created by 전율 on 11/28/24.
//

import UIKit
import Photos

class LimitedLibraryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var allPhotos: PHFetchResult<PHAsset>?
    let imageManager = PHImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let option = PHFetchOptions()
        option.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        allPhotos = PHAsset.fetchAssets(with: option)
        
        // changedOberver
        PHPhotoLibrary.shared().register(self)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    @IBAction func editSelectedAssets(_ sender: Any) {
        PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: self)
    }
}

extension LimitedLibraryViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.async { [weak self] in
            guard let self, let result = self.allPhotos else { return }
            guard let changes = changeInstance.changeDetails(for: result) else { return }
            self.allPhotos = changes.fetchResultAfterChanges
            
            if changes.hasIncrementalChanges {
                // 배치 업데이트
                self.collectionView.performBatchUpdates {
                    if let removeIndexPaths = changes.removedIndexes?.map({IndexPath(item: $0, section: 0)}),!removeIndexPaths.isEmpty  {
                        self.collectionView.deleteItems(at: removeIndexPaths)
                    }
                    
                    if let insertedIndexPaths = changes.insertedIndexes?.map({IndexPath(item: $0, section:0)}), !insertedIndexPaths.isEmpty {
                        self.collectionView.insertItems(at: insertedIndexPaths)
                    }
                    changes.enumerateMoves { from, to in
                        self.collectionView.moveItem(at: IndexPath(item: from, section: 0), to: IndexPath(item: to, section: 0))
                    }
                }
                
                if let changedIndexPaths = changes.changedIndexes?.map({ IndexPath(item: $0, section: 0)}), !changedIndexPaths.isEmpty {
                    self.collectionView.reloadItems(at: changedIndexPaths)
                }
            } else {
                self.collectionView.reloadData()
            }
        }
    }
}

extension LimitedLibraryViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCollectionViewCell.self), for: indexPath) as! ImageCollectionViewCell
        if let target = allPhotos?.object(at: indexPath.item) {
            var size = CGSize.zero
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                let width = Int((collectionView.bounds.width - (layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing)) / 2)
                size = CGSize(width: width, height: width)
            }
            imageManager.requestImage(for: target, targetSize: size, contentMode: .aspectFill, options:nil) { image, _ in
                cell.imageView.image = image
            }
        }
        return cell
    }
    
    
}

extension LimitedLibraryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        let width = Int((collectionView.bounds.width - (layout.sectionInset.left + layout.sectionInset.right + layout.minimumInteritemSpacing)) / 2)
        return CGSize(width: width, height: width)
    }
    
}
