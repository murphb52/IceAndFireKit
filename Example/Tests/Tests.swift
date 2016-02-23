import UIKit
import XCTest
import IceAndFireKit

class Tests: XCTestCase
{
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testFetchingBook()
    {
        let testExpectation = expectationWithDescription("TextExample")
        
        var bookObject : IceAndFireBook?
        
        IceAndFireRequestEngine.sharedInstance.getIceAndFireObject(1) { (iceAndFireObject : IceAndFireBook?, errorMessage : String?) -> Void in
            
            bookObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(bookObject)
            
        }

    }
    
    func testFetchingCharacter()
    {
        let testExpectation = expectationWithDescription("testFetchingCharacter")
        
        var charObject : IceAndFireCharacter?
        
        IceAndFireRequestEngine.sharedInstance.getIceAndFireObject(1) { (iceAndFireObject : IceAndFireCharacter?, errorMessage : String?) -> Void in
            
            charObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(charObject)
            
        }
    }
    
    func testFetchingHouse()
    {
        let testExpectation = expectationWithDescription("testFetchingHouse")
        
        var houseObject : IceAndFireHouse?
        
        IceAndFireRequestEngine.sharedInstance.getIceAndFireObject(1) { (iceAndFireObject : IceAndFireHouse?, errorMessage : String?) -> Void in
            
            houseObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(houseObject)
            
        }

    }
    
    func testPopulatingBook()
    {
        let testExpectation = expectationWithDescription("testPopulatingBook")
        
        var book = IceAndFireBook(urlString: "http://anapioficeandfire.com/api/books/2")
        XCTAssertFalse(book!.isDetailed)
        
        IceAndFireRequestEngine.sharedInstance.populateIceAndFireObject(book) { (iceAndFireObject : IceAndFireBook?, errorMessage : String?) -> Void in
            
            book = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(book)
            XCTAssertNotNil(book?.name)
            XCTAssertTrue(book!.isDetailed)
        }
    }
    
    func testPopulatingCharacter()
    {
        let testExpectation = expectationWithDescription("testPopulatingCharacter")
        
        var character = IceAndFireCharacter(urlString: "http://anapioficeandfire.com/api/characters/2")
        XCTAssertFalse(character!.isDetailed)
        
        IceAndFireRequestEngine.sharedInstance.populateIceAndFireObject(character) { (iceAndFireObject : IceAndFireCharacter?, errorMessage : String?) -> Void in
            
            character = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(character)
            XCTAssertNotNil(character?.name)
            XCTAssertTrue(character!.isDetailed)
        }
    }
    
    func testPopulatingHouse()
    {
        let testExpectation = expectationWithDescription("testPopulatingHouse")

        var house = IceAndFireHouse(urlString: "http://anapioficeandfire.com/api/houses/2")
        XCTAssertFalse(house!.isDetailed)
        
        IceAndFireRequestEngine.sharedInstance.populateIceAndFireObject(house) { (iceAndFireObject : IceAndFireHouse?, errorMessage : String?) -> Void in
            
            house = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(house)
            XCTAssertNotNil(house?.name)
            XCTAssertTrue(house!.isDetailed)
        }
    }
    
}
