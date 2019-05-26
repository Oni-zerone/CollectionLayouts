//
//  StoriesCollectionViewCell+Descriptor.swift
//  StoriesLayout_Example
//
//  Created by Andrea Altea on 26/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import PowerTools
import StoriesLayout

class MyStoriesCollectionViewCell: StoriesCollectionViewCell {
    
    static let sIdentifier = String(describing: MyStoriesCollectionViewCell.self)
    
    struct Descriptor: ItemViewDescriptor {
        var reuseIdentifier: String = MyStoriesCollectionViewCell.sIdentifier
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
}

extension MyStoriesCollectionViewCell: ImageCell {
    
    func set(image: UIImage) {
        self.imageView.image = image
    }
}
