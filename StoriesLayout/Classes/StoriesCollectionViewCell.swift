//
//  StoriesCollectionViewCell.swift
//  StoriesLayout
//
//  Created by Andrea Altea on 25/05/2019.
//

import UIKit

open class StoriesCollectionViewCell: UICollectionViewCell {
    
    override open func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let storiesAttributes = layoutAttributes as? StoriesLayoutAttributes else { return }
        self.layer.anchorPoint = storiesAttributes.anchorPoint
    }
}
