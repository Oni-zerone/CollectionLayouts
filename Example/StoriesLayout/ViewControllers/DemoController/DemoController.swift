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

class DemoController: UIViewController {

    var defaultImages = ["storiesLayout/001",
                         "storiesLayout/002",
                         "storiesLayout/003",
                         "storiesLayout/004",
                         "storiesLayout/005",
                         "storiesLayout/006",
                         "storiesLayout/001",
                         "storiesLayout/002",
                         "storiesLayout/003",
                         "storiesLayout/004",
                         "storiesLayout/005",
                         "storiesLayout/006"]
    
    var layout: UICollectionViewLayout
    var cellDescriptor: ItemViewDescriptor
    
    weak var collectionView: UICollectionView!
    var dataSource: CollectionBinderDataSource!
    
    init(layout: UICollectionViewLayout, cellDescriptor: ItemViewDescriptor) {
        self.layout = layout
        self.cellDescriptor = cellDescriptor
        self.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("you should not create from xib")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("you should not create from xib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupCells()
        setupDataSource()
    }
    
    func setupCollection() {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collection)
        
        self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: collection.topAnchor).isActive = true
        self.view.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: collection.leftAnchor).isActive = true
        self.view.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: collection.rightAnchor).isActive = true
        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collection.bottomAnchor).isActive = true
    }
    
    func setupCells() {
        collectionView.register(UINib(nibName: MyStoriesCollectionViewCell.sIdentifier,
                                      bundle: .main), forCellWithReuseIdentifier: MyStoriesCollectionViewCell.sIdentifier)
        collectionView.register(UINib(nibName: MySafariCollectionViewCell.identifier,
                                      bundle: .main), forCellWithReuseIdentifier: MySafariCollectionViewCell.identifier)
    }
    
    func setupDataSource() {
        let section = ConcreteSection(items:
            defaultImages.map { ImageViewModel(imageNamed: $0, cellDescriptor: self.cellDescriptor) })
        
        dataSource = CollectionBinderDataSource(view: collectionView, model: [section])
     }
}
