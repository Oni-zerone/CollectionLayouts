//
//  ViewController.swift
//  StoriesLayout
//
//  Created by oni.zerone@gmail.com on 05/25/2019.
//  Copyright (c) 2019 oni.zerone@gmail.com. All rights reserved.
//

import UIKit
import PowerTools
import StoriesLayout

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource: CollectionBinderDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        setupDataSource()
    }
    
    func setupCells() {
        collectionView.register(UINib(nibName: MyStoriesCollectionViewCell.sIdentifier,
                                      bundle: .main), forCellWithReuseIdentifier: MyStoriesCollectionViewCell.sIdentifier)
        collectionView.register(UINib(nibName: MySafariCollectionViewCell.identifier,
                                      bundle: .main), forCellWithReuseIdentifier: MySafariCollectionViewCell.identifier)
    }
    
    func setupDataSource() {
        let section = ConcreteSection(items: [
            ImageViewModel(imageNamed: "storiesLayout/001"),
            ImageViewModel(imageNamed: "storiesLayout/002"),
            ImageViewModel(imageNamed: "storiesLayout/003"),
            ImageViewModel(imageNamed: "storiesLayout/004"),
            ImageViewModel(imageNamed: "storiesLayout/005"),
            ImageViewModel(imageNamed: "storiesLayout/006"),
            ImageViewModel(imageNamed: "storiesLayout/001"),
            ImageViewModel(imageNamed: "storiesLayout/002"),
            ImageViewModel(imageNamed: "storiesLayout/003"),
            ImageViewModel(imageNamed: "storiesLayout/004"),
            ImageViewModel(imageNamed: "storiesLayout/005"),
            ImageViewModel(imageNamed: "storiesLayout/006")
            ])
        
        dataSource = CollectionBinderDataSource(view: collectionView, model: [section])
     }
}

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
