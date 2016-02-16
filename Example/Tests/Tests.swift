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
        let testExpectation = expectationWithDescription("testExample")
        
        IceAndFireRequestEngine.sharedInstance.getCharacter()
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            
            
            
        }
    }
    
}
