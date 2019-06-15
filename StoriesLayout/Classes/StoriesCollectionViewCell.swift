//
//  StoriesCollectionViewCell.swift
//  StoriesLayout
//
//  Created by Andrea Altea on 25/05/2019.
//

import UIKit
import CoreGraphics

/**
 StoriesCollectionViewCell is a base class that you could use to create your custom cells with the Instagram Stories experience.
 */
open class StoriesCollectionViewCell: UICollectionViewCell {
    
    public weak var gradientLayer: CAGradientLayer?
    
    internal func getGradientLayer() -> CAGradientLayer {
        
        if let gradientLayer = gradientLayer {
            return gradientLayer
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.opacity = 0.0
        gradientLayer.colors = [UIColor.black.cgColor,
                                UIColor.black.withAlphaComponent(0.2).cgColor]
        gradientLayer.actions = ["opacity": NSNull()]
        self.layer.addSublayer(gradientLayer)
        self.gradientLayer = gradientLayer
        return gradientLayer
    }
    
    override open func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let storiesAttributes = layoutAttributes as? StoriesLayoutAttributes else { return }
        self.layer.anchorPoint = storiesAttributes.anchorPoint
        guard let gradient = storiesAttributes.gradient else {
                self.gradientLayer?.opacity = 0.0
                return
        }
        let gradientLayer = getGradientLayer()
        gradientLayer.frame = self.bounds
        switch gradient {
            case .left(let percent):
                gradientLayer.frame = self.bounds
                gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.opacity = percent
            case .right(let percent):
                gradientLayer.frame = self.bounds
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.opacity = percent
        }
    }
}
