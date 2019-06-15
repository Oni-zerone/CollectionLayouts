//
//  SafariCollectionViewLayout.swift
//  Pods
//
//  Created by Andrea Altea on 27/05/2019.
//

import UIKit

/**
 A concrete layout object that reproduce the look and feel of the Safari tab bars.
 
 The items will be shown in a single column aligned as cards with the same dimension of the screen tilted in relation to the position in the collection.
 
 Actually there isn't a specific delegate to customize layout behviors of the cells.
 */
@IBDesignable
public class SafariCollectionViewLayout: UICollectionViewLayout {

    private var _tabsCount: Int = 4

    /**
    The maximum number of tabs shown on the screen.
     
     Line spacing between the cells will be calculated based on this parameter.
     
     Default value of this property is 4
    */
    @IBInspectable public var tabsCount: Int {
        set {
            _tabsCount = max(newValue, 1)
            collectionView?.reloadData()
        }
        get {
            return _tabsCount
        }
    }
    
    /**
     The angle that the cell assumes at the center of the collection.
     
     This is the main value used to tune the cell position in the collection.
     Define the overall orientation of the cell and the appearance in the collection.
     
     Default value of this property is 114 degrees.
     */
    var defaultAngle: CGFloat = CGFloat.pi * 0.2
    
    /**
     The angle variation between the top and the center of the collection.
     
     This is the value used to realize the tilting effect when the cell moves in the collection.
     Define the overall orientation of the cell and the appearance in the collection.
     
     Default value of this property is 180 degrees.
     */
    var variationAngle: CGFloat = CGFloat.pi * 0.2
    
    /**
     Defines the contentSize of the collectionView
     
     Actually SafariCollectionViewLayout can handle a single section and the cell size is determined as the same of the collection, but tilted.
     
     Line spacing between the cells is defined by the tabs count.
     */
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
        attributes.frame = frameForItem(at: indexPath)
        
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
    
    func sectionInset(for section: Int) -> UIEdgeInsets {
        guard let collection = collectionView,
            let insets = (collection.delegate as? UICollectionViewDelegateFlowLayout)?
            .collectionView?(collection, layout: self, insetForSectionAt: section) else {
            return collectionView?.contentInset ?? .zero
        }
        return insets
    }
    
    func frameForItem(at indexPath: IndexPath) -> CGRect {
        let insets = sectionInset(for: indexPath.section)
        return CGRect(x: insets.left,
                      y: CGFloat(indexPath.item) * (collectionBounds.height / CGFloat(tabsCount)) + insets.top,
                      width: collectionBounds.width - (insets.left + insets.right),
                      height: collectionBounds.height - (insets.top + insets.bottom))
    }
}
