//
//  IceAndFireRequestEngine.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation
import Alamofire

public class IceAndFireRequestEngine
{
    public static let sharedInstance = IceAndFireRequestEngine()
    
    public func getHouse(completionHander: (houseArray: Array<IceAndFireHouse>?) -> Void)
    {
        
    }
    
//    public func getCharacter(completionHandler: (characterArray: Array<IceAndFireCharacter>?) -> Void)
//    {
//        Alamofire.request(.GET , "http://www.anapioficeandfire.com/api/characters") .responseJSON { (response : Response<AnyObject, NSError>) -> Void in
//            
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            var characterArray : Array<IceAndFireCharacter>? = Array<IceAndFireCharacter>()
//            
//            guard response.result.value is NSMutableArray else
//            {
//                completionHandler(characterArray: nil)
//                return
//            }
//            
//            guard response.response?.statusCode == 200 else
//            {
//                completionHandler(characterArray: nil)
//                return
//            }
//            
//            if let jsonArray = response.result.value as! [NSDictionary]?
//            {
//                print("JSON: \(jsonArray)")
//                
//                for dictionary : NSDictionary in jsonArray
//                {
//                    let iceAndFireObject = IceAndFireCharacter(ditionary: dictionary)!
//                    characterArray?.append(iceAndFireObject)
//                }
//
//            }
//
//            completionHandler(characterArray: characterArray)
//        }
//    }
//    
//    public func getBook(completionHandler: (success: Bool) -> Void)
//    {
//        Alamofire.request(.GET , "http://www.anapioficeandfire.com/api/books") .responseJSON { (response : Response<AnyObject, NSError>) -> Void in
//            
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            print(response.data)     // server data
//            print(response.result)   // result of response serialization
//            
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
//            
//            guard response.response?.statusCode == 200 else
//            {
//                completionHandler(success: false)
//                return
//            }
//            
//            completionHandler(success: true)
//            
//        }
//
//    }
}