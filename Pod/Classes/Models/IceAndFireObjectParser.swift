//
//  IceAndFireObjectParser.swift
//  Pods
//
//  Created by Brian Murphy on 21/02/2016.
//
//

import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class IceAndFireObjectParser
{
    
    class func stringFromDictionary(_ dictionary : NSDictionary, key : String) -> String?
    {
        if dictionary.object(forKey: key) != nil && dictionary.object(forKey: key) is String
        {
            let stringValue = dictionary.object(forKey: key) as? String
            
            guard stringValue?.characters.count > 0 else
            {
                return nil
            }
            
            return stringValue
        }
        
        return nil
    }
    
    class func integerFromDictionary(_ dictionary : NSDictionary, key : String) -> Int?
    {
        if dictionary.object(forKey: key) != nil && dictionary.object(forKey: key) is Int
        {
            return dictionary.object(forKey: key) as? Int
        }
        
        return nil
    }
    
    class func dateFromDictionary(_ dictionary : NSDictionary, key : String) -> Date?
    {
        if dictionary.object(forKey: key) != nil && dictionary.object(forKey: key) is String
        {
            let dateString = dictionary.object(forKey: key) as? String
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone.autoupdatingCurrent
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            return dateFormatter.date(from: dateString!)
        }
        
        return nil
    }
    
    class func arrayFromDictionary<T>(_ dictionary : NSDictionary, key : String!) -> Array<T>?
    {
        if dictionary.object(forKey: key) != nil && dictionary.object(forKey: key) is Array<T>
        {
            return dictionary.object(forKey: key) as? Array<T>
        }
        
        return nil
    }
    
    class func arrayOfIceAndFireObjectsFromArrayOfUrls<T:IceAndFireObject>(_ urls : [String]?) -> [T]?
    {
        guard urls != nil else
        {
            return nil
        }
        
        guard urls?.count > 0 else
        {
            return nil
        }
        
        var array : [T] = []
        for urlString in urls!
        {
            let object = T(urlString: urlString)
            
            guard object != nil else
            {
                continue
            }
            
            array.append(object!)
        }
        
        return array
    }
    
}
