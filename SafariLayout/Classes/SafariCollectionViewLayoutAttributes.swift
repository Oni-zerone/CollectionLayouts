//
//  SafariCollectionViewLayoutAttributes.swift
//  SafariLayout
//
//  Created by Andrea Altea on 27/05/2019.
//

import UIKit

class SafariCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {

    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let attribute = super.copy(with: zone) as! SafariCollectionViewLayoutAttributes
        attribute.anchorPoint = self.anchorPoint
        return attribute

    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? SafariCollectionViewLayoutAttributes,
            object.anchorPoint == self.anchorPoint else {
                return false
        }
        return super.isEqual(object)
    }
}
