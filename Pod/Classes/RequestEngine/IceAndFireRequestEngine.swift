//
//  IceAndFireRequestEngine.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

public class IceAndFireRequestEngine
{
    public static let sharedInstance = IceAndFireRequestEngine()
    
    let APIURLString = "http://www.anapioficeandfire.com/api/"
    
    let APIVersion = 1
    
    let ETAG = "iOS_IceAndFireRequestEngine"
    
    /// Fetches a page of objects with an optional page and limit
    public func fetchIceAndFireObjectsWithPage<T:IceAndFireObject>(page : Int?, limit : Int?, completionHandler: (iceAndFireObjects : [T]?, error: NSError?) -> Void)
    {
        var endpointString = "\(APIURLString)\(T.APIType)?page=\(page)&limit=\(limit)"
        
        if page != nil || limit != nil
        {
            endpointString += "?"
            
            if page != nil && limit != nil
            {
                endpointString += "page=\(page)&limit=\(limit)"
            }
            else if page != nil
            {
                endpointString += "page=\(page)"
            }
            else if limit != nil
            {
                endpointString += "limit=\(limit)"
            }
        }
        
        let url = NSURL(string: endpointString)
        
        performRequestWithURL(url) { (dictionaryArray : NSArray?, error: NSError?) -> Void in
            
            guard error == nil && dictionaryArray != nil else
            {
                completionHandler(iceAndFireObjects: nil, error: error)
                return
            }
            
            //** Parse Dictionary into object
            var objectArray : [T] = []
            for dictionary in dictionaryArray!
            {
                let parsedIceAndFireObject = T(dictionary: dictionary as? NSDictionary)
                objectArray.append(parsedIceAndFireObject!)
            }
            
            completionHandler(iceAndFireObjects: objectArray, error : error)
        }
    }
    
    /// Fetches and returns a detailed object from the API. Will parse based on the completionHander object
    public func fetchIceAndFireObject<T:IceAndFireObject>(id: Int, completionHandler: (iceAndFireObject: T?, error: NSError?) -> Void)
    {
        //** Create our urlString
        let endpointString = "\(APIURLString)\(T.APIType)/\(id)"
        
        //** Create thr URL
        let url = NSURL(string: endpointString)
        
        
        performRequestWithURL(url) { (dictionary : NSDictionary?, error: NSError?) -> Void in
         
            guard error == nil && dictionary != nil else
            {
                completionHandler(iceAndFireObject: nil, error: error)
                return
            }
            
            //** Parse Dictionary into object
            let parsedIceAndFireObject = T(dictionary: dictionary)
            
            completionHandler(iceAndFireObject: parsedIceAndFireObject, error : error)
            
        }
    }
    
    /// Populates a minimal object. The Object must have a urlString to be populated
    public func fetchIceAndFireObject<T:IceAndFireObject>(object : T!, completionHandler: (iceAndFireObject: T?, error: NSError?) -> Void)
    {
        //** Create our urlString
        let endpointString = object.urlString
        
        //** Create thr URL
        let url = NSURL(string: endpointString!)
        
        performRequestWithURL(url) { (dictionary : NSDictionary?, error : NSError?) -> Void in
            
            guard error == nil && dictionary != nil else
            {
                completionHandler(iceAndFireObject: nil, error: error)
                return
            }
            
            //** Parse Dictionary into object
            let parsedIceAndFireObject = T(dictionary: dictionary)
            
            completionHandler(iceAndFireObject: parsedIceAndFireObject, error: error)

        }
        
    }
    
    private func performRequestWithURL<T>(url : NSURL!, completionHandler: (T?, NSError?) -> Void)
    {
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.addValue("application/vnd.anapioficeandfire+json; version=\(APIVersion)", forHTTPHeaderField: "Accept")
        request.setValue(ETAG, forHTTPHeaderField: "If-None-Match")

        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, urlResponse : NSURLResponse?, error : NSError?) -> Void in
            
            //** Gaurd against error
            guard error == nil else
            {
                completionHandler(nil, error)
                return
            }
            
            //** Make sure we have a HTTPURLResponse
            guard urlResponse is NSHTTPURLResponse else
            {
                completionHandler(nil, NSError(type: .HTTPError))
                return
            }
            
            let httpURLResponse : NSHTTPURLResponse  = urlResponse as! NSHTTPURLResponse
            
            //** Make sure we got a 200
            guard httpURLResponse.statusCode == 200 else
            {
                completionHandler(nil, NSError(type: .HTTPError, forcedLocalizedDescription: NSHTTPURLResponse.localizedStringForStatusCode(httpURLResponse.statusCode)))
                return
            }
            
            guard data != nil else
            {
                completionHandler(nil, NSError(type: .APIError))
                return
            }
            
            //** Try parse into JSONObject
            do
            {
                let jsonResponse = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                //** Make sure it can be parsed into dictionary
                guard jsonResponse is T else
                {
                    completionHandler(nil, NSError(type: .JSONError))
                    return
                }
                
                //** Fire off completion handler
                completionHandler(jsonResponse as? T, nil)
            }
            catch
            {
                completionHandler(nil, NSError(type: .JSONError))
            }
            
        }.resume()

    }
}