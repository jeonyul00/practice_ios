//
//  CustomZoomInOutLayout.swift
//  Custom_CollectionView_Paging
//
//  Created by jhlee on 2023/09/03.
//

import UIKit

class CustomZoomInOutLayout: UICollectionViewFlowLayout {
    
    // 크기조절 (확대 축소 - 가운데에서 확대, 가장자리로 가면 축소)
    
    private let minScale: CGFloat = 0.5
    private let maxScale: CGFloat = 1
    
    
    
    // 레이아웃이 처음 생성되거나 다시 계산되어서 레이아웃이 나올때
    override func prepare() {
        super.prepare()
        
        // 초기 레이아웃 셋팅
        
        guard let collectionView = collectionView else {
            return
        }
        
        let inset = (collectionView.bounds.width - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
    }
    
    
    
    // 스크롤 할 때마다 레이아웃을 새로 계산한다.
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    // 영역 안에 있는 모든 아이템의 레이아웃 속성값을 반환
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let collectionView = collectionView, let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        // 가운데 위치
        let centerX = collectionView.contentOffset.x + collectionView.bounds.width / 2
        
        for attribute in attributes {
            
            // 아이템 중앙 위치
            let itemCenterX = attribute.center.x
            
            // 아이템 중앙위치와 현재 스크롤 위치의 중앙과 거리를 구한다.
            let distanceFromCenter = abs(itemCenterX - centerX)
            
            // 거리를 백분율로 계산
            let distancePercentage = distanceFromCenter / (collectionView.bounds.width / 2)
            
            // 크기를 계산
            let scale = maxScale - (maxScale - minScale) * distancePercentage
            
            attribute.transform = CGAffineTransform(scaleX: scale, y: scale)
            
        }
        
        return attributes
        
    }
    
    
    
    
    // custom paging
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
     
        // collectionView가 존재하는지 확인
        guard let collectionView = collectionView else {
           return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        // 스크롤 끝나서 예상되는 컬렉션 뷰의 화면 영역
        let proposedRect = CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y, width: collectionView.bounds.width, height: collectionView.bounds.height)
        
        
        // proposedRect에 있는 모든 셀의 레아이웃 속성 가져옴
        guard let layoutAttributes = layoutAttributesForElements(in: proposedRect) else {
           return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        // 가운데
        let centerX = collectionView.bounds.width / 2
        
        // 가운데와 가장 가까운 속성 찾기 위해
        var closestAttribute: UICollectionViewLayoutAttributes?
        
        // 가운데와의 거리
        var minimumDistance = CGFloat.greatestFiniteMagnitude
        
        
        for attribute in layoutAttributes {
            let distance = abs(attribute.center.x - proposedContentOffset.x - centerX)
            
            if minimumDistance > distance {
                minimumDistance = distance
                closestAttribute = attribute
            }
            
        }
        
        
        guard let finalAttribute = closestAttribute else {
           return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
         
        // 최종목표는 제일 가까운 item을 찾아서 가운데로 이동
        return CGPoint(x: finalAttribute.center.x - centerX, y: proposedContentOffset.y)
        
        }
        
}
    
    
 
