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
    private var dataSorurce:UICollectionViewDiffableDataSource<Section, Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        // 셀 등록
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        
        // 레이아웃 적용
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        // datasource 세팅
        setDataSource()
        
        // snapShot
        setSnapShot()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setDataSource() {
        dataSorurce = UICollectionViewDiffableDataSource<Section,Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
                cell.config(title: item.title, imageUrl: item.imageUrl)
                return cell
                //            case .normalCarousel(let item):
                //            case .listCarousel(let item):
            default:
                return UICollectionViewCell()
            }
        })
    }
    
    private func setSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapShot.appendSections([Section(id: "Banner")])
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌 치킨", imageUrl: "https://cdn.mkhealth.co.kr/news/photo/202306/64253_68458_1153.png")),
            Item.banner(HomeItem(title: "굽네 치킨", imageUrl: "https://cdn.mkhealth.co.kr/news/photo/202306/64253_68458_1153.png")),
            Item.banner(HomeItem(title: "네네 치킨", imageUrl: "https://cdn.mkhealth.co.kr/news/photo/202306/64253_68458_1153.png"))
        ]
        
        snapShot.appendItems(bannerItems,toSection:Section(id: "Banner") )
        dataSorurce?.apply(snapShot)
        
    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                self?.createBannerSection()
            case 1:
                self?.createBannerSection()
            case 2:
                self?.createBannerSection()
            default:
                self?.createBannerSection()
            }
            return self?.createBannerSection()
        })
    }
    
    private func createBannerSection()-> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // section
        /*
         orthogonalScrollingBehavior: 이 속성은 섹션 내부의 스크롤 동작을 결정합니다.
         orthogonalScrollingBehavior를 설정함으로써 섹션의 스크롤 방향이 기본 스크롤 방향과 수직(orthogonal)으로 스크롤되도록 할 수 있습니다.
         */
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
}
