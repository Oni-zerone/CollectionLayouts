//
//  StoriesLayoutAttributes.swift
//  StoriesLayout
//
//  Created by Andrea Altea on 25/05/2019.
//

import UIKit
/**
 The custom `UICollectionViewLayoutAttributes` subclass used by `StoriesCollectionViewLayout`
 */
public class StoriesLayoutAttributes: UICollectionViewLayoutAttributes {

    /**
     The gradient informations used by the `StoriesCollectionViewCell`
     */
    public enum Gradient: Equatable {
        case left(percent: Float)
        case right(percent: Float)
    }
    
    /**
     Anchor point is the realtive position used to calculate the rotation transformation of the cell.
     
     If you won't use the `StoriesCollectionViewCell` as your base cell class remember to override
     
     `func apply(_ layoutAttributes: UICollectionViewLayoutAttributes)` method to pass the anchorPoint property
     to the cell layer.
     */
    public var anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5)

    /**
     Gradient informations to render the `CAGradientLayer` over the `UICollectionViewCell`.
     
     If you won't use the `StoriesCollectionViewCell` as your base cell class remember to override
     
     `func apply(_ layoutAttributes: UICollectionViewLayoutAttributes)` method to draw the `CAGradientLayer` if you want to show it.
     */
    public var gradient: Gradient?
    
    override public func copy(with zone: NSZone? = nil) -> Any {
        let attribute = super.copy(with: zone) as! StoriesLayoutAttributes
        attribute.anchorPoint = self.anchorPoint
        attribute.gradient = gradient
        return attribute
    }
    
    override public func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? StoriesLayoutAttributes,
            object.anchorPoint == self.anchorPoint,
            object.gradient == self.gradient else { return false }
        return super.isEqual(object)
    }
}
