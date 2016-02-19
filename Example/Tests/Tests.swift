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
    
    func testExample()
    {
        let testExpectation = expectationWithDescription("TextExample")
        
        var bookObject : IceAndFireBook?
        
        IceAndFireRequestEngine.sharedInstance.getIceandFireObject(IceAndFireBook.self, id: 1) { (iceAndFireObject, errorMessage) -> Void in
            
            bookObject = iceAndFireObject
            
            testExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            XCTAssertNotNil(bookObject)
            
        }

    }
    
}
