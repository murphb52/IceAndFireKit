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
    
    //** Fetch Object with id
    
    //** Fetch list of objects with id
    
    //** Populate object
    
    //** Paginate objects etc
    
    public func fetchIceAndFireObjectsWithPage<T:IceAndFireObject>(page : Int, limit : Int, completionHandler: (iceAndFireObjects : [T]?, errorMessage: String?) -> Void)
    {
        let endpointString = "\(APIURLString)\(T.APIType)?page=\(page)&limit=\(limit)"
        
        let url = NSURL(string: endpointString)
        
        performRequestWithURL(url) { (dictionaryArray : NSArray?, errorMessage : String?) -> Void in
            
            //** Parse Dictionary into object
            var objectArray : [T] = []
            for dictionary in dictionaryArray!
            {
                let parsedIceAndFireObject = T(dictionary: dictionary as? NSDictionary)
                objectArray.append(parsedIceAndFireObject!)
            }
            
            completionHandler(iceAndFireObjects: objectArray, errorMessage: errorMessage)
        }
    }
    
    public func getIceAndFireObject<T:IceAndFireObject>(id: Int, completionHandler: (iceAndFireObject: T?, errorMessage: String?) -> Void)
    {
        //** Create our urlString
        let endpointString = "\(APIURLString)\(T.APIType)/\(id)"
        
        //** Create thr URL
        let url = NSURL(string: endpointString)
        
        
        performRequestWithURL(url) { (dictionary : NSDictionary?, errorMessage : String?) -> Void in
            
            //** Parse Dictionary into object
            let parsedIceAndFireObject = T(dictionary: dictionary)
            
            completionHandler(iceAndFireObject: parsedIceAndFireObject, errorMessage: errorMessage)
            
        }
    }
    
    public func populateIceAndFireObject<T:IceAndFireObject>(object : T?, completionHandler: (iceAndFireObject: T?, errorMessage: String?) -> Void)
    {
        guard object != nil else
        {
            completionHandler(iceAndFireObject: nil, errorMessage: "An Object is required")
            return
        }
        
        //** Create our urlString
        let endpointString = object!.urlString
        
        //** Create thr URL
        let url = NSURL(string: endpointString!)
        
        performRequestWithURL(url) { (dictionary : NSDictionary?, errorMessage : String?) -> Void in
            
            //** Parse Dictionary into object
            let parsedIceAndFireObject = T(dictionary: dictionary)
            
            completionHandler(iceAndFireObject: parsedIceAndFireObject, errorMessage: errorMessage)

        }
        
    }
    
    private func performRequestWithURL<T>(url : NSURL!, completionHandler: (T?, String?) -> Void)
    {
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.addValue("application/vnd.anapioficeandfire+json; version=\(APIVersion)", forHTTPHeaderField: "Accept")
        request.setValue(ETAG, forHTTPHeaderField: "If-None-Match")

        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, urlResponse : NSURLResponse?, error : NSError?) -> Void in
            
            //** Gaurd against error
            guard error == nil else
            {
                completionHandler(nil, error?.description)
                return
            }
            
            //** Make sure we have a HTTPURLResponse
            guard urlResponse is NSHTTPURLResponse else
            {
                completionHandler(nil, "Serialization error")
                return
            }
            
            let httpURLResponse : NSHTTPURLResponse  = urlResponse as! NSHTTPURLResponse
            
            //** Make sure we got a 200
            guard httpURLResponse.statusCode == 200 else
            {
                completionHandler(nil, NSHTTPURLResponse.localizedStringForStatusCode(httpURLResponse.statusCode))
                return
            }
            
            guard data != nil else
            {
                completionHandler(nil, "Nil response from API")
                return
            }
            
            //** Try parse into JSONObject
            do
            {
                let jsonResponse = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                //** Make sure it can be parsed into dictionary
                guard jsonResponse is T else
                {
                    completionHandler(nil, "Serialization error")
                    return
                }
                
                //** Fire off completion handler
                completionHandler(jsonResponse as? T, nil)
            }
            catch
            {
                completionHandler(nil, "JSON Parsing error")
            }
            

            
        }.resume()

    }
}