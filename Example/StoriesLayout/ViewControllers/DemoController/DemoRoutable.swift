//
//  DemoRoutable.swift
//  StoriesLayout_Example
//
//  Created by Andrea Altea on 02/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import PowerTools

class DemoRoutable: Builder<UIViewController> {
    
    var layout: UICollectionViewLayout
    var descriptor: ItemViewDescriptor
    
    init(layout: UICollectionViewLayout, descriptor: ItemViewDescriptor) {
        self.layout = layout
        self.descriptor = descriptor
    }
    
    override func build(_ context: UIViewController) -> UIViewController? {
        return DemoController(layout: layout,
                              cellDescriptor: descriptor)
    }
}
