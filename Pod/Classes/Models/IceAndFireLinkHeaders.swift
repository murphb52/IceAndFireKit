//
//  IceAndFireLinkHeaders.swift
//  Pods
//
//  Created by Brian Murphy on 18/05/2016.
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


open class IceAndFireLinkHeaders
{
    fileprivate var urlDictionary : [String : URL]!
    
    open var next : URL?
    open var prev : URL?
    open var last : URL?
    open var first : URL?
    
    public required init?(httpURLResponse: HTTPURLResponse?)
    {
        guard httpURLResponse != nil else
        {
            return nil
        }
        
        let responseHeaders = httpURLResponse!.allHeaderFields
        
        guard ((responseHeaders["Link"] as? String) != nil) else
        {
            return nil
        }

        self.urlDictionary = parseLinkHeadersString((responseHeaders["Link"] as! String))
        
        self.next = self.urlDictionary["next"]
        self.prev = self.urlDictionary["prev"]
        self.first = self.urlDictionary["first"]
        self.last = self.urlDictionary["last"]
    }
    
    fileprivate func parseLinkHeadersString(_ string: String) -> [String : URL]?
    {
        var mutableDictionary : [String : URL] = [:]
        
        let commaSeperatedValues = string.components(separatedBy: ",")
        
        for individualStringFor in commaSeperatedValues {
            
            let regexPattern = ".*<(.+)>; rel=\"(.+)\".*"
            
            do
            {
                let regex = try NSRegularExpression(pattern: regexPattern, options: .caseInsensitive)
                
                let result = regex.firstMatch(in: individualStringFor, options: .anchored, range: NSMakeRange(0, individualStringFor.characters.count))
                
                if result != nil
                {
                    var captures : [String] = []
                    
                    var i = 1
                    while i < result?.numberOfRanges
                    {
                        let range = result?.range(at: i)
                        let capture = (individualStringFor as NSString).substring(with: range!)
                        captures.append(capture)
                        
                        i = i + 1
                    }
                    
                    if captures.count != 2
                    {
                        continue
                    }
                    
                    let urlString = captures[0] as String
                    let url = URL(string: urlString)
                    
                    let relationString = captures[1]
                    
                    mutableDictionary[relationString] = url
                }

                
            }
            catch
            {
                print(error)
            }
            
        }
        
        return mutableDictionary
    }
}
