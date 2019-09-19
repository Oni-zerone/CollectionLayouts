//
//  MySafariCollectionViewCell.swift
//  StoriesLayout_Example
//
//  Created by Andrea Altea on 27/05/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SafariLayout
import PowerTools

class MySafariCollectionViewCell: SafariCollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.layer.cornerRadius = 8.0
    }

}

extension MySafariCollectionViewCell {
    
    static let identifier = String(describing: MySafariCollectionViewCell.self)
    
    struct Descriptor: ItemViewDescriptor {
        var reuseIdentifier: String = MySafariCollectionViewCell.identifier
    }
}

extension MySafariCollectionViewCell: ImageCell {
    
    func set(image: UIImage) {
        self.imageView.image = image
    }
    
    func set(index: Int) {
        self.label.text = "\(index)"
    }
}
