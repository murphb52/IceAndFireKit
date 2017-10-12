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
        let testExpectation = expectation(description: "testFetchingCharactersArray")
        
        var charactersArray : [IceAndFireCharacter]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireCharacter]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            charactersArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(charactersArray)
            XCTAssertNotNil(linkHeaders)
            XCTAssertNotNil(linkHeaders?.first)
            XCTAssertNotNil(linkHeaders?.last)
            XCTAssertNotNil(linkHeaders?.next)
            XCTAssertNotNil(linkHeaders?.prev)
        }
    }
    
    func testFetchingBooksArray()
    {
        let testExpectation = expectation(description: "testFetchingBooksArray")
        
        var booksArray : [IceAndFireBook]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(1, limit: 10) { (iceAndFireObjects : [IceAndFireBook]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            booksArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(booksArray)
            XCTAssertNotNil(linkHeaders)
            XCTAssertNotNil(linkHeaders?.first)
            XCTAssertNotNil(linkHeaders?.last)
            XCTAssertNotNil(linkHeaders?.next)
            
            XCTAssertNil(linkHeaders?.prev) // There is no previous with the first page
        }
    }
    
    func testFetchingHousesArray()
    {
        let testExpectation = expectation(description: "testFetchingHousesArray")
        
        var housesArray : [IceAndFireHouse]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(2, limit: 10) { (iceAndFireObjects : [IceAndFireHouse]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            housesArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
            XCTAssertNotNil(linkHeaders)
            XCTAssertNotNil(linkHeaders?.first)
            XCTAssertNotNil(linkHeaders?.last)
            XCTAssertNotNil(linkHeaders?.next)
            XCTAssertNotNil(linkHeaders?.prev)
        }
    }
    
    func testFetchingHousesWithPages()
    {
        let testExpectation = expectation(description: "testFetchingHousesWithPages")
        
        var housesArray : [IceAndFireHouse]?
        var linkHeaders : IceAndFireLinkHeaders?
        
        let page : Int? = 2
        let limit : Int? = 10
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObjectsWithPage(page, limit: limit) { (iceAndFireObjects : [IceAndFireHouse]?, error : NSError?, returnedLinkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            housesArray = iceAndFireObjects
            linkHeaders = returnedLinkHeaders
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(housesArray)
            XCTAssertNotNil(linkHeaders)
            XCTAssertNotNil(linkHeaders?.first)
            XCTAssertNotNil(linkHeaders?.last)
            XCTAssertNotNil(linkHeaders?.next)
            XCTAssertNotNil(linkHeaders?.prev)
        }
    }

}
