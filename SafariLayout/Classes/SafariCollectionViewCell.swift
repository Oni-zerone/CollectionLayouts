//
//  SafariCollectionViewCell.swift
//  SafariLayout
//
//  Created by Andrea Altea on 27/05/2019.
//

import UIKit

/**
 SafariCollectionViewCell is a base class that you could use to create your custom cells with the tilted tab experience.
*/
open class SafariCollectionViewCell: UICollectionViewCell {
    
    override open func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let storiesAttributes = layoutAttributes as? SafariCollectionViewLayoutAttributes else { return }
        self.layer.anchorPoint = storiesAttributes.anchorPoint
    }
}
