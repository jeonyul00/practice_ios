//
//  ViewController.swift
//  MVVM&CodeUI&CollectionView
//
//  Created by 전율 on 2024/01/31.
//

import UIKit

class ViewController: UIViewController {

    // 컬렉션 뷰 생성
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 등록
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
    }


}


// 컬렉션 뷰, 셀 생성 등록 후
// 레이아웃 구현 - 3가지
// dataSource => cellProvider
// snapshot -> datasource.apply(snapshot)
