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
    
    let apiURLString = "http://www.anapioficeandfire.com/api/"
    
    //** Fetch Object with id
    
    //** Fetch list of objects with id
    
    //** Populate object
    
    //** Paginate objects etc
    
    public func getIceandFireObject<T:IceAndFireObject>(type : T.Type, id: Int, completionHandler: (iceAndFireObject: T?, errorMessage: String?) -> Void)
    {
        //** Create our urlString
        let endpointString = "\(apiURLString)\(type.APIType)/\(id)"
        
        //** Create thr URL
        let url = NSURL(string: endpointString)
        
        
        performRequestWithURL(url!, type: type) { (iceAndFireObject, errorString) -> Void in
            
            completionHandler(iceAndFireObject: iceAndFireObject, errorMessage: errorString)
            
        }
    }
    
    private func performRequestWithURL<T:IceAndFireObject>(url : NSURL!, type : T.Type, completionHandler: (T?, String?) -> Void)
    {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data: NSData?, urlResponse : NSURLResponse?, error : NSError?) -> Void in
            
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
                guard jsonResponse is [String : AnyObject] else
                {
                    completionHandler(nil, "Serialization error")
                    return
                }
                
                let jsonDictionaryResponse =  jsonResponse as! [String : AnyObject]
                
                //** Parse Dictionary into object
                let iceAndFireObject = T(ditionary: jsonDictionaryResponse)
                
                //** Fire off completion handler
                completionHandler(iceAndFireObject, nil)
            }
            catch
            {
                completionHandler(nil, "JSON Parsing error")
            }
            

            
        }.resume()

    }
}