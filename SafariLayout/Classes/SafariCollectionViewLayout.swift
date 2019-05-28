//
//  SafariCollectionViewLayout.swift
//  Pods
//
//  Created by Andrea Altea on 27/05/2019.
//

import UIKit

public class SafariCollectionViewLayout: UICollectionViewLayout {

    private var _tabsCount: Int = 6
    public var tabsCount: Int {
        set {
            _tabsCount = max(newValue, 1)
        }
        get {
            return _tabsCount
        }
    }
    
    var angle: CGFloat = CGFloat.pi * -0.25
    
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
        guard let collection = collectionView,
            let dataSource = collection.dataSource else {
                return nil
        }
        
        let cellsCount = dataSource.collectionView(collection, numberOfItemsInSection: 0)
        let firstItem = max(Int(collection.contentOffset.y / (collection.bounds.height / CGFloat(_tabsCount))), 0)
        
        var attributes = [UICollectionViewLayoutAttributes]()
        (firstItem ..< min(firstItem + _tabsCount + 1, cellsCount)).forEach { index in
            guard let cellAttributes = layoutAttributesForItem(at: IndexPath(item: index, section: 0)) else { return }
            attributes.append(cellAttributes)
        }
        return attributes
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collection = collectionView else { return nil }
        let attributes = SafariCollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = CGRect(x: 0,
                                  y: CGFloat(indexPath.item) * (collection.bounds.height / CGFloat(_tabsCount)),
                                  width: collection.bounds.width,
                                  height: collection.bounds.height)
        
        let tilt = (((attributes.center.y - collection.contentOffset.y) / collection.bounds.height) * 0.8) + 0.1
        var perspective = CATransform3DIdentity
        perspective.m34 = -1/1000
        
        let rotation = CATransform3DRotate(perspective, tilt * angle, 1.0, 0.0, 0.0)
        let translation = CATransform3DMakeTranslation(0.0, collection.bounds.height / -2, 0.0)
        attributes.transform3D = CATransform3DConcat(rotation, translation)
        attributes.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        
        return attributes
    }
    
    public override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
