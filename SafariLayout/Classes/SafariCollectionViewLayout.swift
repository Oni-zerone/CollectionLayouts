//
//  SafariCollectionViewLayout.swift
//  Pods
//
//  Created by Andrea Altea on 27/05/2019.
//

import UIKit

@IBDesignable
public class SafariCollectionViewLayout: UICollectionViewLayout {

    private var _tabsCount: Int = 4

    @IBInspectable public var tabsCount: Int {
        set {
            _tabsCount = max(newValue, 1)
            collectionView?.reloadData()
        }
        get {
            return _tabsCount
        }
    }
    
    var defaultAngle: CGFloat = CGFloat.pi * 0.2
    var variationAngle: CGFloat = CGFloat.pi * 0.2
    
    override public var collectionViewContentSize: CGSize {
        guard let collection = collectionView,
            let dataSource = collection.dataSource else {
                return .zero
        }
        
        let cellsCount = dataSource.collectionView(collection, numberOfItemsInSection: 0)
        if cellsCount < 1 {
            return .zero
        }
        
        if cellsCount == 1 {
            return collection.bounds.size
        }
        
        return CGSize(width: collection.bounds.width,
                      height: CGFloat(cellsCount) * (collection.bounds.height / CGFloat(_tabsCount)))
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let firstVisibleItem = self.firstVisibleItem
        let lastVisibleItem = min(firstVisibleItem + tabsCount, itemsCount - 1)
        if lastVisibleItem < firstVisibleItem {
            let indexPath = IndexPath(item: lastVisibleItem, section: 0)
            guard let cellAttributes = layoutAttributesForItem(at: indexPath) else { return nil }
            return [cellAttributes]
        }
        
        var attributes = [UICollectionViewLayoutAttributes]()
        (firstVisibleItem ... lastVisibleItem).forEach { index in
            let indexPath = IndexPath(item: index, section: 0)
            guard let cellAttributes = layoutAttributesForItem(at: indexPath) else { return }
            attributes.append(cellAttributes)
        }
        return attributes
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let collectionBounds = self.collectionBounds
        let collectionOffset = self.collectionOffset
        
        let attributes = SafariCollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = CGRect(x: 0,
                                  y: CGFloat(indexPath.item) * (collectionBounds.height / CGFloat(tabsCount)),
                                  width: collectionBounds.width,
                                  height: collectionBounds.height)
        
        let tilt = ((collectionOffset.y - attributes.frame.minY) / collectionBounds.height)
        var perspective = CATransform3DIdentity
        perspective.m34 = -1/1000
        
        let rotation = CATransform3DRotate(perspective, (tilt * variationAngle) - defaultAngle, 1.0, 0.0, 0.0)
        let translation = CATransform3DMakeTranslation(0.0, collectionBounds.height / -2, 0.0)
        attributes.transform3D = CATransform3DConcat(rotation, translation)
        attributes.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        return attributes
    }
    
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

extension SafariCollectionViewLayout {
    
    var itemsCount: Int {
        guard let collection = collectionView,
            let dataSource = collection.dataSource else {
                return 0
        }
        return dataSource.collectionView(collection, numberOfItemsInSection: 0)
    }

    var firstVisibleItem: Int {
        guard let collection = collectionView else {
                return 0
        }
        return max(Int(collection.contentOffset.y / (collection.bounds.height / CGFloat(tabsCount))), 0)
    }
    
    var collectionBounds: CGRect {
        return self.collectionView?.bounds ?? .zero
    }
    
    var collectionOffset: CGPoint {
        return self.collectionView?.contentOffset ?? .zero
    }
}
