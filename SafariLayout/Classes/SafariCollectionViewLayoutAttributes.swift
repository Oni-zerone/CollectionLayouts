//
//  SafariCollectionViewLayoutAttributes.swift
//  SafariLayout
//
//  Created by Andrea Altea on 27/05/2019.
//

import UIKit
/**
 The custom `UICollectionViewLayoutAttributes` subclass used by `SafariCollectionViewLayout`
 */
class SafariCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {

    /**
     Anchor point is the realtive position used to calculate the tilt transformation of the cell.
     
     If you won't use the `SafariCollectionViewCell` as your base cell class remember to override
     
     `func apply(_ layoutAttributes: UICollectionViewLayoutAttributes)` method to pass the anchorPoint property
     to the cell layer.
     */
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    /// Overridden for NSCopying compatibility
    override func copy(with zone: NSZone? = nil) -> Any {
        let attribute = super.copy(with: zone) as! SafariCollectionViewLayoutAttributes
        attribute.anchorPoint = self.anchorPoint
        return attribute

    }

    /// Overridden for Equatable compatibility
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? SafariCollectionViewLayoutAttributes,
            object.anchorPoint == self.anchorPoint else {
                return false
        }
        return super.isEqual(object)
    }
}
