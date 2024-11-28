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
            case .authorized:
                print(status.rawValue)
            case .limited:
                print(status.rawValue)
            @unknown default:
                fatalError()
            }
        }
    }
    
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

