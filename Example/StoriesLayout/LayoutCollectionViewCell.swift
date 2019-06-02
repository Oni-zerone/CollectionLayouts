//
//  LayoutCollectionViewCell.swift
//  StoriesLayout_Example
//
//  Created by Andrea Altea on 02/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import PowerTools

class LayoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title.text = nil
    }
}

extension LayoutCollectionViewCell: LayoutCell {
    func setupLayoutCell(title: String) {
        self.title.text = title
    }
}

extension LayoutCollectionViewCell {
    
    static let descriptor = String(describing: LayoutCollectionViewCell.self)
    
    struct Descriptor: ItemViewDescriptor {
        let reuseIdentifier = LayoutCollectionViewCell.descriptor
    }
}
