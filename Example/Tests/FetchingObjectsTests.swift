//
//  FetchingObjectsTests.swift
//  IceAndFireKit
//
//  Created by Brian Murphy on 23/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import IceAndFireKit

class FetchingObjectsTests: XCTestCase {

    func testFetchingBook()
    {
        let testExpectation = expectation(description: "TextExample")
        
        var bookObject : IceAndFireBook?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(1) { (iceAndFireObject : IceAndFireBook?, error : NSError?) -> Void in
            
            bookObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(bookObject)
            
        }
        
    }
    
    func testFetchingCharacter()
    {
        let testExpectation = expectation(description: "testFetchingCharacter")
        
        var charObject : IceAndFireCharacter?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(1) { (iceAndFireObject : IceAndFireCharacter?, error : NSError?) -> Void in
            
            charObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(charObject)
            
        }
    }
    
    func testFetchingHouse()
    {
        let testExpectation = expectation(description: "testFetchingHouse")
        
        var houseObject : IceAndFireHouse?
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(1) { (iceAndFireObject : IceAndFireHouse?, error : NSError?) -> Void in
            
            houseObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(houseObject)
            
        }
        
    }
    
    func testPopulatingBook()
    {
        let testExpectation = expectation(description: "testPopulatingBook")
        
        var book = IceAndFireBook(urlString: "http://anapioficeandfire.com/api/books/2")
        XCTAssertFalse(book!.isDetailed)
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(book) { (iceAndFireObject : IceAndFireBook?, error : NSError?) -> Void in
            
            book = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(book)
            XCTAssertNotNil(book?.name)
            XCTAssertTrue(book!.isDetailed)
        }
    }
    
    func testPopulatingCharacter()
    {
        let testExpectation = expectation(description: "testPopulatingCharacter")
        
        var character = IceAndFireCharacter(urlString: "http://anapioficeandfire.com/api/characters/2")
        XCTAssertFalse(character!.isDetailed)
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(character) { (iceAndFireObject : IceAndFireCharacter?, error : NSError?) -> Void in
            
            character = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(character)
            XCTAssertNotNil(character?.name)
            XCTAssertTrue(character!.isDetailed)
        }
    }
    
    func testPopulatingHouse()
    {
        let testExpectation = expectation(description: "testPopulatingHouse")
        
        var house = IceAndFireHouse(urlString: "http://anapioficeandfire.com/api/houses/2")
        XCTAssertFalse(house!.isDetailed)
        
        IceAndFireRequestEngine.sharedInstance.fetchIceAndFireObject(house) { (iceAndFireObject : IceAndFireHouse?, error : NSError?) -> Void in
            
            house = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) -> Void in
            
            XCTAssertNotNil(house)
            XCTAssertNotNil(house?.name)
            XCTAssertTrue(house!.isDetailed)
        }
    }
    

}
