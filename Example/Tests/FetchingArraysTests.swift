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
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireCharacter]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            charactersArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(charactersArray)
            XCTAssertNotNil(linkHeaders)
        }
    }
    
    func testFetchingBooksArray()
    {
        let testExpectation = expectationWithDescription("testFetchingBooksArray")
        
        var booksArray : [IceAndFireBook]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireBook]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            booksArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(booksArray)
            XCTAssertNotNil(linkHeaders)
        }
    }
    
    func testFetchingHousesArray()
    {
        let testExpectation = expectationWithDescription("testFetchingHousesArray")
        
        var housesArray : [IceAndFireHouse]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireHouse]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            housesArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
            XCTAssertNotNil(linkHeaders)
        }
    }
    
    func testFetchingHousesWithPages()
    {
        let testExpectation = expectationWithDescription("testFetchingHousesWithPages")
        
        var housesArray : [IceAndFireHouse]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        let page : Int? = 2
        let limit : Int? = 10
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(page, limit: limit) { (iceAndFireObjects : [IceAndFireHouse]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            housesArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
            XCTAssertNotNil(linkHeaders)
        }
    }

}
