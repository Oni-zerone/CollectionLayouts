//
//  UICollectionDataSourceMock.swift
//  StoriesLayout_Tests
//
//  Created by Andrea Altea on 29/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class UICollectionViewDataSourceMock: NSObject, UICollectionViewDataSource {
    
    //MARK: - collectionView
    
    var collectionViewNumberOfItemsInSectionCallsCount = 0
    var collectionViewNumberOfItemsInSectionCalled: Bool {
        return collectionViewNumberOfItemsInSectionCallsCount > 0
    }
    var collectionViewNumberOfItemsInSectionReceivedArguments: (collectionView: UICollectionView, section: Int)?
    var collectionViewNumberOfItemsInSectionReceivedInvocations: [(collectionView: UICollectionView, section: Int)] = []
    var collectionViewNumberOfItemsInSectionReturnValue: Int!
    var collectionViewNumberOfItemsInSectionClosure: ((UICollectionView, Int) -> Int)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewNumberOfItemsInSectionCallsCount += 1
        collectionViewNumberOfItemsInSectionReceivedArguments = (collectionView: collectionView, section: section)
        collectionViewNumberOfItemsInSectionReceivedInvocations.append((collectionView: collectionView, section: section))
        return collectionViewNumberOfItemsInSectionClosure.map({ $0(collectionView, section) }) ?? collectionViewNumberOfItemsInSectionReturnValue
    }
    
    //MARK: - collectionView
    
    var collectionViewCellForItemAtCallsCount = 0
    var collectionViewCellForItemAtCalled: Bool {
        return collectionViewCellForItemAtCallsCount > 0
    }
    var collectionViewCellForItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    var collectionViewCellForItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    var collectionViewCellForItemAtReturnValue: UICollectionViewCell!
    var collectionViewCellForItemAtClosure: ((UICollectionView, IndexPath) -> UICollectionViewCell)?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionViewCellForItemAtCallsCount += 1
        collectionViewCellForItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewCellForItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewCellForItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewCellForItemAtReturnValue
    }
    
    //MARK: - numberOfSections
    
    var numberOfSectionsInCallsCount = 0
    var numberOfSectionsInCalled: Bool {
        return numberOfSectionsInCallsCount > 0
    }
    var numberOfSectionsInReceivedCollectionView: UICollectionView?
    var numberOfSectionsInReceivedInvocations: [UICollectionView] = []
    var numberOfSectionsInReturnValue: Int!
    var numberOfSectionsInClosure: ((UICollectionView) -> Int)?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfSectionsInCallsCount += 1
        numberOfSectionsInReceivedCollectionView = collectionView
        numberOfSectionsInReceivedInvocations.append(collectionView)
        return numberOfSectionsInClosure.map({ $0(collectionView) }) ?? numberOfSectionsInReturnValue
    }
    
    //MARK: - collectionView
    
    var collectionViewViewForSupplementaryElementOfKindAtCallsCount = 0
    var collectionViewViewForSupplementaryElementOfKindAtCalled: Bool {
        return collectionViewViewForSupplementaryElementOfKindAtCallsCount > 0
    }
    var collectionViewViewForSupplementaryElementOfKindAtReceivedArguments: (collectionView: UICollectionView, kind: String, indexPath: IndexPath)?
    var collectionViewViewForSupplementaryElementOfKindAtReceivedInvocations: [(collectionView: UICollectionView, kind: String, indexPath: IndexPath)] = []
    var collectionViewViewForSupplementaryElementOfKindAtReturnValue: UICollectionReusableView!
    var collectionViewViewForSupplementaryElementOfKindAtClosure: ((UICollectionView, String, IndexPath) -> UICollectionReusableView)?
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionViewViewForSupplementaryElementOfKindAtCallsCount += 1
        collectionViewViewForSupplementaryElementOfKindAtReceivedArguments = (collectionView: collectionView, kind: kind, indexPath: indexPath)
        collectionViewViewForSupplementaryElementOfKindAtReceivedInvocations.append((collectionView: collectionView, kind: kind, indexPath: indexPath))
        return collectionViewViewForSupplementaryElementOfKindAtClosure.map({ $0(collectionView, kind, indexPath) }) ?? collectionViewViewForSupplementaryElementOfKindAtReturnValue
    }
    
    //MARK: - collectionView
    
    var collectionViewCanMoveItemAtCallsCount = 0
    var collectionViewCanMoveItemAtCalled: Bool {
        return collectionViewCanMoveItemAtCallsCount > 0
    }
    var collectionViewCanMoveItemAtReceivedArguments: (collectionView: UICollectionView, indexPath: IndexPath)?
    var collectionViewCanMoveItemAtReceivedInvocations: [(collectionView: UICollectionView, indexPath: IndexPath)] = []
    var collectionViewCanMoveItemAtReturnValue: Bool!
    var collectionViewCanMoveItemAtClosure: ((UICollectionView, IndexPath) -> Bool)?
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        collectionViewCanMoveItemAtCallsCount += 1
        collectionViewCanMoveItemAtReceivedArguments = (collectionView: collectionView, indexPath: indexPath)
        collectionViewCanMoveItemAtReceivedInvocations.append((collectionView: collectionView, indexPath: indexPath))
        return collectionViewCanMoveItemAtClosure.map({ $0(collectionView, indexPath) }) ?? collectionViewCanMoveItemAtReturnValue
    }
    
    //MARK: - collectionView
    
    var collectionViewMoveItemAtToCallsCount = 0
    var collectionViewMoveItemAtToCalled: Bool {
        return collectionViewMoveItemAtToCallsCount > 0
    }
    var collectionViewMoveItemAtToReceivedArguments: (collectionView: UICollectionView, sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)?
    var collectionViewMoveItemAtToReceivedInvocations: [(collectionView: UICollectionView, sourceIndexPath: IndexPath, destinationIndexPath: IndexPath)] = []
    var collectionViewMoveItemAtToClosure: ((UICollectionView, IndexPath, IndexPath) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        collectionViewMoveItemAtToCallsCount += 1
        collectionViewMoveItemAtToReceivedArguments = (collectionView: collectionView, sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath)
        collectionViewMoveItemAtToReceivedInvocations.append((collectionView: collectionView, sourceIndexPath: sourceIndexPath, destinationIndexPath: destinationIndexPath))
        collectionViewMoveItemAtToClosure?(collectionView, sourceIndexPath, destinationIndexPath)
    }
    
    //MARK: - indexTitles
    
    var indexTitlesForCallsCount = 0
    var indexTitlesForCalled: Bool {
        return indexTitlesForCallsCount > 0
    }
    var indexTitlesForReceivedCollectionView: UICollectionView?
    var indexTitlesForReceivedInvocations: [UICollectionView] = []
    var indexTitlesForReturnValue: [String]?
    var indexTitlesForClosure: ((UICollectionView) -> [String]?)?
    
    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        indexTitlesForCallsCount += 1
        indexTitlesForReceivedCollectionView = collectionView
        indexTitlesForReceivedInvocations.append(collectionView)
        return indexTitlesForClosure.map({ $0(collectionView) }) ?? indexTitlesForReturnValue
    }
    
    //MARK: - collectionView
    
    var collectionViewIndexPathForIndexTitleAtCallsCount = 0
    var collectionViewIndexPathForIndexTitleAtCalled: Bool {
        return collectionViewIndexPathForIndexTitleAtCallsCount > 0
    }
    var collectionViewIndexPathForIndexTitleAtReceivedArguments: (collectionView: UICollectionView, title: String, index: Int)?
    var collectionViewIndexPathForIndexTitleAtReceivedInvocations: [(collectionView: UICollectionView, title: String, index: Int)] = []
    var collectionViewIndexPathForIndexTitleAtReturnValue: IndexPath!
    var collectionViewIndexPathForIndexTitleAtClosure: ((UICollectionView, String, Int) -> IndexPath)?
    
    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        collectionViewIndexPathForIndexTitleAtCallsCount += 1
        collectionViewIndexPathForIndexTitleAtReceivedArguments = (collectionView: collectionView, title: title, index: index)
        collectionViewIndexPathForIndexTitleAtReceivedInvocations.append((collectionView: collectionView, title: title, index: index))
        return collectionViewIndexPathForIndexTitleAtClosure.map({ $0(collectionView, title, index) }) ?? collectionViewIndexPathForIndexTitleAtReturnValue
    }
    
}
