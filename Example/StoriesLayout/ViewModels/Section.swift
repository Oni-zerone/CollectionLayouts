//
//  Section.swift
//  StoriesLayout_Example
//
//  Created by Andrea Altea on 02/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import PowerTools

struct ConcreteSection: SectionViewModel {
    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?
    
    init(items: [ItemViewModel]) {
        self.header = nil
        self.items = items
        self.footer = nil
    }
}


struct ConcreteGridSection: SectionViewModel, GridSection {
    
    var header: ItemViewModel?
    
    var items: [ItemViewModel]
    
    var footer: ItemViewModel?

    init(items: [ItemViewModel]) {
        self.header = nil
        self.items = items
        self.footer = nil
    }

    var lineItems: Int? = 1
    var sectionInsets: UIEdgeInsets = .zero
    var sectionVerticalItemSpacing: CGFloat = 0.0
    var sectionHorizontalItemSpacing: CGFloat = 0.0
}
