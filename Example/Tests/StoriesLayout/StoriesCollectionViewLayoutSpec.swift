//
//  StoriesCollectionViewLayoutSpec.swift
//  StoriesLayout_Tests
//
//  Created by Andrea Altea on 29/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import StoriesLayout

class StoriesCollectionViewLayoutSpec: QuickSpec {
    
    override func spec() {
        let cellIdentifier = "testCell"
        
        var sut: StoriesCollectionViewLayout!
        var collectionViewSize: CGRect!
        var collectionView: UICollectionView!
        
        var dataSource: UICollectionViewDataSourceMock!
        
        beforeEach {
            sut = StoriesCollectionViewLayout()
            collectionViewSize = CGRect(origin: .zero, size: CGSize(width: 320, height: 650))
            collectionView = UICollectionView(frame: collectionViewSize,
                                              collectionViewLayout: sut)
            collectionView.register(StoriesCollectionViewCell.self,
                                    forCellWithReuseIdentifier: cellIdentifier)
            dataSource = .create(sections: 1,
                                 items: 10,
                                 cellIdentifier: cellIdentifier)
            collectionView.dataSource = dataSource
        }
        
        context("must work") {
            it("it reloads") {
                collectionView.reloadData()
            }
        }
    }
}

extension UICollectionViewDataSourceMock {
    
    static func create(sections: Int, items: Int, cellIdentifier identifier: String) -> UICollectionViewDataSourceMock {
        
        let dataSource = UICollectionViewDataSourceMock()
        dataSource.numberOfSectionsInClosure = { _ in return sections }
        dataSource.collectionViewNumberOfItemsInSectionClosure = { _, _ in return items }
        dataSource.collectionViewCellForItemAtClosure = { collection, indexPath in
            return collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        }
        return dataSource
    }
}
