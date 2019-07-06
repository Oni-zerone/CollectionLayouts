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
        }
        
        context("check default values") {
            xit("must have base transformation") {
                expect(sut.baseTransform.m34).to(equal(1.0 / 1000))
            }
        }
        
        context("collection interaction") {
            beforeEach {
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
            
            it("it reloads") {
                collectionView.reloadData()
            }
            
            it("should always invalidate layout") {
                let shouldInvalidate = sut.shouldInvalidateLayout(forBoundsChange: collectionView.bounds)
                expect(shouldInvalidate).to(beTrue())
            }
            
            it("must return first cell in default position") {
                collectionView.contentOffset = .zero
                let indexPath = IndexPath(item: 0, section: 0)
                guard let attributes = sut.layoutAttributesForItem(at: indexPath) as? StoriesLayoutAttributes else {
                    XCTFail("Should be StoruesLayoutAttributes")
                    return
                }
                expect(attributes.indexPath).to(equal(indexPath))
                expect(attributes.frame).to(equal(collectionView.bounds))
                expect(attributes.anchorPoint).to(equal(CGPoint(x: 0.5, y: 0.5)))
                expect(attributes.transform3D).to(equal(CATransform3DIdentity))
            }
            
            it("must return first cell half folded") {
                collectionView.contentOffset = CGPoint(x: collectionView.bounds.width / 2, y: 0)
                let indexPath = IndexPath(item: 0, section: 0)
                guard let attributes = sut.layoutAttributesForItem(at: indexPath) as? StoriesLayoutAttributes else {
                    XCTFail("Should be StoruesLayoutAttributes")
                    return
                }
                expect(attributes.indexPath).to(equal(indexPath))
                expect(attributes.bounds).to(equal(CGRect(origin: .zero, size: collectionView.bounds.size)))
                expect(attributes.anchorPoint).to(equal(CGPoint(x: 1, y: 0.5)))
                expect(attributes.transform3D).toNot(equal(CATransform3DIdentity))
            }
            
            it("must return first cell half folded") {
                collectionView.contentOffset = CGPoint(x: -collectionView.bounds.width / 2, y: 0)
                let indexPath = IndexPath(item: 0, section: 0)
                guard let attributes = sut.layoutAttributesForItem(at: indexPath) as? StoriesLayoutAttributes else {
                    fail("Should be StoruesLayoutAttributes")
                    return
                }
                expect(attributes.indexPath).to(equal(indexPath))
                expect(attributes.bounds).to(equal(CGRect(origin: .zero, size: collectionView.bounds.size)))
                expect(attributes.anchorPoint).to(equal(CGPoint(x: 0.0, y: 0.5)))
                expect(attributes.transform3D).toNot(equal(CATransform3DIdentity))
            }

            it("must return only first item") {
                collectionView.contentOffset = .zero
                guard let attributes = sut.layoutAttributesForElements(in: collectionView.bounds) as? [StoriesLayoutAttributes] else {
                    fail("Should be StoriesLayoutAttributes")
                    return
                }
                expect(attributes.count).to(equal(1))
                expect(attributes.filter { $0.indexPath == IndexPath(item: 0, section: 0) }.count).to(equal(1))
            }
            
            it("must return first and second item") {
                collectionView.contentOffset = CGPoint(x: 10, y: 0)
                guard let attributes = sut.layoutAttributesForElements(in: collectionView.bounds) as? [StoriesLayoutAttributes] else {
                    fail("Should be StoriesLayoutAttributes")
                    return
                }
                expect(attributes.count).to(equal(2))
                expect(attributes.filter { $0.indexPath == IndexPath(item: 0, section: 0) }.count).to(equal(1))
                expect(attributes.filter { $0.indexPath == IndexPath(item: 1, section: 0) }.count).to(equal(1))
            }

            it("must return only first item") {
                collectionView.contentOffset = CGPoint(x: -10, y: 0)
                guard let attributes = sut.layoutAttributesForElements(in: collectionView.bounds) as? [StoriesLayoutAttributes] else {
                    fail("Should be StoriesLayoutAttributes")
                    return
                }
                expect(attributes.count).to(equal(1))
                expect(attributes.filter { $0.indexPath == IndexPath(item: 0, section: 0) }.count).to(equal(1))
            }

            it("must return only first item") {
                collectionView.contentOffset = CGPoint(x: collectionView.bounds.width * 1.5, y: 0)
                guard let attributes = sut.layoutAttributesForElements(in: collectionView.bounds) as? [StoriesLayoutAttributes] else {
                    fail("Should be StoriesLayoutAttributes")
                    return
                }
                expect(attributes.count).to(equal(2))
                expect(attributes.filter { $0.indexPath == IndexPath(item: 1, section: 0) }.count).to(equal(1))
                expect(attributes.filter { $0.indexPath == IndexPath(item: 2, section: 0) }.count).to(equal(1))
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
