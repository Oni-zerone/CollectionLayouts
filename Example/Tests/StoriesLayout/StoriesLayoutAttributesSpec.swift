//
//  StoriesLayoutAttributesSpec.swift
//  StoriesLayout_Tests
//
//  Created by Andrea Altea on 29/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import StoriesLayout

class StoriesLayoutAttributesSpec: QuickSpec {
    
    override func spec() {
        var sut: StoriesLayoutAttributes!
        
        beforeEach {
           sut = StoriesLayoutAttributes(forCellWith: IndexPath(item: 0, section: 0))
        }
        
        context("test default values") {
            it("should have alpha value") {
                expect(sut.anchorPoint).to(equal(CGPoint(x: 0.5, y: 0.5)))
            }
    
            it("should not have gradient value") {
                expect(sut.gradient).to(beNil())
            }
        }
        
        context("test parameters NSCopying") {
            it("must copy IndexPath") {
                let indexPath = IndexPath(item: 1, section: 2)
                sut.indexPath = indexPath
                
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                expect(sutCopy.indexPath).to(equal(indexPath))
            }
            
            it("must copy anchor value") {
                let anchor = CGPoint(x: 0.7, y: 0.3)
                sut.anchorPoint = anchor
                
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                expect(sutCopy.anchorPoint).to(equal(anchor))
            }
            
            it("must copy anchor value") {
                let gradient = StoriesLayoutAttributes.Gradient.left(percent: 0.6)
                sut.gradient = gradient
                
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                expect(sutCopy.gradient).to(equal(gradient))
            }
        }
        
        context("test equality between attributes") {
            it("copied attributes without gradient should be equal") {
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                expect(sutCopy).to(equal(sut))
            }
            
            it("copied attributes with gradient should be equal") {
                sut.gradient = .left(percent: 0.4)
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                expect(sutCopy).to(equal(sut))
            }
            
            it("copied attributes with different gradient should not be equal") {
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                sut.gradient = .left(percent: 0.4)
                expect(sutCopy).toNot(equal(sut))
            }
            
            it("copied attributes with different anchorPoint should not be equal") {
                guard let sutCopy = sut.copy() as? StoriesLayoutAttributes else {
                    return fail("should be copied")
                }
                sut.anchorPoint = CGPoint(x: 0.3, y: 0.1)
                expect(sutCopy).toNot(equal(sut))
            }
        }
    }
}
