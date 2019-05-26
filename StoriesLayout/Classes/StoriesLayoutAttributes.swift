//
//  StoriesLayoutAttributes.swift
//  StoriesLayout
//
//  Created by Andrea Altea on 25/05/2019.
//

import UIKit

public class StoriesLayoutAttributes: UICollectionViewLayoutAttributes {
    
    public enum Gradient: Equatable {
        case left(percent: Float)
        case right(percent: Float)
    }
    
    var anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5)
    var gradient: Gradient?
    
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
