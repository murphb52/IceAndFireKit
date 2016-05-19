//
//  IceAndFireLinkHeaders.swift
//  Pods
//
//  Created by Brian Murphy on 18/05/2016.
//
//

import Foundation

public class IceAndFireLinkHeaders
{
    private var urlDictionary : [String : NSURL]?
    
    public required init?(httpURLResponse: NSHTTPURLResponse?)
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
    }
    
    private func parseLinkHeadersString(string: String) -> [String : NSURL]?
    {
        var mutableDictionary : [String : NSURL]? = [:]
        
        let commaSeperatedValues = string.componentsSeparatedByString(",")
        
        for individualStringFor in commaSeperatedValues {
            
            let regexPattern = ".*<(.+)>; rel=\"(.+)\".*"
            
            do
            {
                let regex = try NSRegularExpression(pattern: regexPattern, options: .CaseInsensitive)
                
                let result = regex.firstMatchInString(individualStringFor, options: .Anchored, range: NSMakeRange(0, individualStringFor.characters.count))
                
                if result != nil
                {
                    var captures : [String] = []
                    
                    var i = 1
                    while i < result?.numberOfRanges
                    {
                        let range = result?.rangeAtIndex(i)
                        let capture = (individualStringFor as NSString).substringWithRange(range!)
                        captures.append(capture)
                        
                        i = i + 1
                    }
                    
                    if captures.count != 2
                    {
                        continue
                    }
                    
                    let urlString = captures[0] as String
                    let url = NSURL(string: urlString)
                    
                    let relationString = captures[1]
                    
                    mutableDictionary![relationString] = url
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