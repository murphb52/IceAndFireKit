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
        
        IceAndFireRequestEngine.sharedInstance.getIceAndFireObject(IceAndFireBook.self, id: 1) { (iceAndFireObject, errorMessage) -> Void in
            
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
        
        IceAndFireRequestEngine.sharedInstance.getIceAndFireObject(IceAndFireCharacter.self, id: 1) { (iceAndFireObject, errorMessage) -> Void in
            
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
        
        IceAndFireRequestEngine.sharedInstance.getIceAndFireObject(IceAndFireHouse.self, id: 1) { (iceAndFireObject, errorMessage) -> Void in
            
            houseObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(houseObject)
            
        }

    }
    
}
