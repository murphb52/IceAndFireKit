//
//  IceAndFireObjectParser.swift
//  Pods
//
//  Created by Brian Murphy on 21/02/2016.
//
//

import Foundation

class IceAndFireObjectParser
{
    
    class func stringFromDictionary(dictionary : NSDictionary, key : String) -> String?
    {
        if dictionary.objectForKey(key) != nil && dictionary.objectForKey(key) is String
        {
            let stringValue = dictionary.objectForKey(key) as? String
            return stringValue
        }
        
        return nil
    }
    
    class func integerFromDictionary(dictionary : NSDictionary, key : String) -> Int?
    {
        if dictionary.objectForKey(key) != nil && dictionary.objectForKey(key) is Int
        {
            return dictionary.objectForKey(key) as? Int
        }
        
        return nil
    }
    
    class func dateFromDictionary(dictionary : NSDictionary, key : String) -> NSDate?
    {
        if dictionary.objectForKey(key) != nil && dictionary.objectForKey(key) is String
        {
            let dateString = dictionary.objectForKey(key) as? String
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
            dateFormatter.timeZone = NSTimeZone.localTimeZone()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            return dateFormatter.dateFromString(dateString!)
        }
        
        return nil
    }
    
    class func arrayFromDictionary<T>(dictionary : NSDictionary, key : String!) -> Array<T>?
    {
        if dictionary.objectForKey(key) != nil && dictionary.objectForKey(key) is Array<T>
        {
            return dictionary.objectForKey(key) as? Array<T>
        }
        
        return nil
    }
    
    class func arrayOfIceAndFireObjectsFromArrayOfUrls<T:IceAndFireObject>(urls : [String]?) -> [T]?
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