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
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(1, limit: 10) { (iceAndFireObjects : [IceAndFireCharacter]?, errorMessage : String?) -> Void in
            
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
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(1, limit: 10) { (iceAndFireObjects : [IceAndFireBook]?, errorMessage : String?) -> Void in
            
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
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(1, limit: 10) { (iceAndFireObjects : [IceAndFireHouse]?, errorMessage : String?) -> Void in
            
            housesArray = iceAndFireObjects
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
        }
    }

}
