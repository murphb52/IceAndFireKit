//
//  FetchingArraysTests.swift
//  IceAndFireKit
//
//  Created by Brian Murphy on 23/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import IceAndFireKit

class FetchingArraysTests: XCTestCase {

    func testFetchingCharactersArray()
    {
        let testExpectation = expectationWithDescription("testFetchingCharactersArray")
        
        var charactersArray : [IceAndFireCharacter]?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireCharacter]?, error : NSError?) -> Void in
            
            charactersArray = iceAndFireObjects
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(charactersArray)
        }
    }
    
    func testFetchingBooksArray()
    {
        let testExpectation = expectationWithDescription("testFetchingBooksArray")
        
        var booksArray : [IceAndFireBook]?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireBook]?, error : NSError?) -> Void in
            
            booksArray = iceAndFireObjects
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(booksArray)
        }
    }
    
    func testFetchingHousesArray()
    {
        let testExpectation = expectationWithDescription("testFetchingHousesArray")
        
        var housesArray : [IceAndFireHouse]?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireHouse]?, error : NSError?) -> Void in
            
            housesArray = iceAndFireObjects
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
        }
    }
    
    func testFetchingHousesWithPages()
    {
        let testExpectation = expectationWithDescription("testFetchingHousesWithPages")
        
        var housesArray : [IceAndFireHouse]?
        
        let page : Int? = 2
        let limit : Int? = 10
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(page, limit: limit) { (iceAndFireObjects : [IceAndFireHouse]?, error : NSError?) -> Void in
            
            housesArray = iceAndFireObjects
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
        }
    }

}
