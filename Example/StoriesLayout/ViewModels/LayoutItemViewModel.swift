//
//  LayouutItemViewModel.swift
//  StoriesLayout_Example
//
//  Created by Andrea Altea on 02/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import PowerTools

protocol LayoutCell {
    func setupLayoutCell(title: String)
}

class LayoutItemViewModel<Layout: UICollectionViewLayout>: GridItemViewModel {
    
    typealias LayoutInitializer = () -> Layout
    
    var descriptor: ItemViewDescriptor
    var layoutInitializer: LayoutInitializer
    
    private(set) var layoutName: String = {
        String(describing: Layout.self)
    }()
    
    var hashValue: Int {
        return layoutName.hashValue
    }
    
    init(descriptor: ItemViewDescriptor, layoutInitializer: @escaping LayoutInitializer) {
        self.descriptor = descriptor
        self.layoutInitializer = layoutInitializer
    }
    
    func setup(_ view: UIView, in containerView: UIView, at indexPath: IndexPath) {
        (view as? LayoutCell)?.setupLayoutCell(title: layoutName)
    }
}
