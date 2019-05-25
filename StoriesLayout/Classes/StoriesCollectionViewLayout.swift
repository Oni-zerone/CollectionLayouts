//
//  StoriesCollectionViewLayout.swift
//  StoriesLayout
//
//  Created by Andrea Altea on 23/05/2019.
//

import UIKit

public class StoriesCollectionViewLayout: UICollectionViewLayout {
    
    public var baseTransform: CATransform3D = {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / 1000
        return transform
    }()
    
    override public var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView,
            let dataSource = collectionView.dataSource else { return .zero }
        
        return CGSize(width: collectionView.bounds.size.width * CGFloat(dataSource.collectionView(collectionView, numberOfItemsInSection: 0)),
                      height: collectionView.bounds.size.height)
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView,
            let dataSource = collectionView.dataSource else { return nil }
        let rect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        
        let itemIndex = Int(rect.origin.x == 0 ? 0 : rect.origin.x / rect.width)
        var items: [UICollectionViewLayoutAttributes] = []
        if  dataSource.collectionView(collectionView, numberOfItemsInSection: 0) > itemIndex,
            let firstItem = layoutAttributesForItem(at: IndexPath(item: itemIndex, section: 0)) {
            items.append(firstItem)
        }
        if dataSource.collectionView(collectionView, numberOfItemsInSection: 0) > (itemIndex + 1),
            let secondItem = layoutAttributesForItem(at: IndexPath(item: itemIndex + 1, section: 0) ) {
            secondItem.indexPath = IndexPath(item: itemIndex + 1, section: 0)
            secondItem.zIndex = 1000
            items.append(secondItem)
        }
        return items
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = LayoutAttributes(forCellWith: indexPath)
        guard let collection = collectionView else { return nil }
        
        attributes.frame = CGRect(x: collection.bounds.width * CGFloat(indexPath.item),
                                  y: 0,
                                  width: collection.bounds.width,
                                  height: collection.bounds.height)
        
        if attributes.frame.minX > collection.contentOffset.x &&
            attributes.frame.maxX > (collection.contentOffset.x + collection.bounds.width) {
            let rightSideOriginalTransform = -90 * CGFloat.pi / 180
            var rightAnimationPercentComplete = (collection.contentOffset.x / collection.bounds.width).truncatingRemainder(dividingBy: 1)
            rightAnimationPercentComplete = (1 - rightAnimationPercentComplete).truncatingRemainder(dividingBy: 1)
            let rotation = CATransform3DRotate(baseTransform, rightSideOriginalTransform * rightAnimationPercentComplete, 0.0, 1.0, 0.0)
            let translation = CATransform3DMakeTranslation(attributes.frame.width / -2.0, 0.0, 0.0)
            attributes.transform3D = CATransform3DConcat(rotation, translation)
            attributes.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            return attributes
        }
        
        if attributes.frame.minX < collection.contentOffset.x &&
            attributes.frame.maxX < (collection.contentOffset.x + collection.bounds.width) {
            let leftSideOriginalTransform = 90 * CGFloat.pi / 180
            let leftAnimationPercentageComplete = (collection.contentOffset.x / collection.bounds.width).truncatingRemainder(dividingBy: 1)
            let rotation = CATransform3DRotate(baseTransform, leftSideOriginalTransform * leftAnimationPercentageComplete, 0.0, 1.0, 0.0)
            let translation = CATransform3DMakeTranslation(attributes.frame.width / 2.0, 0.0, 0.0)
            attributes.transform3D = CATransform3DConcat(rotation, translation)
            attributes.anchorPoint = CGPoint(x: 1.0, y: 0.5)
            return attributes
        }
        
        attributes.transform3D = CATransform3DIdentity
        attributes.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        return attributes
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

