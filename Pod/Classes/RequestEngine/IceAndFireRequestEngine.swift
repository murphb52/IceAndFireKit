//
//  IceAndFireRequestEngine.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

open class IceAndFireRequestEngine
{
    open static let sharedInstance = IceAndFireRequestEngine()
    
    let APIURLString = "http://www.anapioficeandfire.com/api/"
    
    let APIVersion = 1
    
    let ETAG = "iOS_IceAndFireRequestEngine"
    
    /// Fetches a page of objects with an optional page and limit
    open func fetchIceAndFireObjectsWithPage<T:IceAndFireObject>(_ page : Int?, limit : Int?, completionHandler: @escaping (_ iceAndFireObjects : [T]?, _ error: NSError?, _ linkHeaders : IceAndFireLinkHeaders?) -> Void)
    {
        var endpointString = "\(APIURLString)\(T.APIType)"
        
        if page != nil || limit != nil
        {
            endpointString += "?"
            
            if page != nil && limit != nil
            {
                endpointString += "page=\(page!)&limit=\(limit!)"
            }
            else if page != nil
            {
                endpointString += "page=\(page!)"
            }
            else if limit != nil
            {
                endpointString += "limit=\(limit!)"
            }
        }
        
        let url = URL(string: endpointString)
        
        performRequestWithURL(url) { (dictionaryArray : NSArray?, error: NSError?, linkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            guard error == nil && dictionaryArray != nil else
            {
                completionHandler(nil, error, nil)
                return
            }
            
            //** Parse Dictionary into object
            var objectArray : [T] = []
            for dictionary in dictionaryArray!
            {
                let parsedIceAndFireObject = T(dictionary: dictionary as? NSDictionary)
                objectArray.append(parsedIceAndFireObject!)
            }
            
            completionHandler(objectArray, error, linkHeaders)
        }
    }
    
    /// Fetches and returns a detailed object from the API. Will parse based on the completionHander object
    open func fetchIceAndFireObject<T:IceAndFireObject>(_ id: Int, completionHandler: @escaping (_ iceAndFireObject: T?, _ error: NSError?) -> Void)
    {
        //** Create our urlString
        let endpointString = "\(APIURLString)\(T.APIType)/\(id)"
        
        //** Create thr URL
        let url = URL(string: endpointString)
        
        
        performRequestWithURL(url) { (dictionary : NSDictionary?, error: NSError?, linkHeaders : IceAndFireLinkHeaders?) -> Void in
         
            guard error == nil && dictionary != nil else
            {
                completionHandler(nil, error)
                return
            }
            
            //** Parse Dictionary into object
            let parsedIceAndFireObject = T(dictionary: dictionary)
            
            completionHandler(parsedIceAndFireObject, error)
            
        }
    }
    
    /// Populates a minimal object. The Object must have a urlString to be populated
    open func fetchIceAndFireObject<T:IceAndFireObject>(_ object : T!, completionHandler: @escaping (_ iceAndFireObject: T?, _ error: NSError?) -> Void)
    {
        //** Create our urlString
        let endpointString = object.urlString
        
        //** Create thr URL
        let url = URL(string: endpointString!)
        
        performRequestWithURL(url) { (dictionary : NSDictionary?, error : NSError?, linkHeaders : IceAndFireLinkHeaders?) -> Void in
            
            guard error == nil && dictionary != nil else
            {
                completionHandler(nil, error)
                return
            }
            
            //** Parse Dictionary into object
            let parsedIceAndFireObject = T(dictionary: dictionary)
            
            completionHandler(parsedIceAndFireObject, error)

        }
        
    }
    
    fileprivate func performRequestWithURL<T>(_ url : URL!, completionHandler: @escaping (T?, NSError?, IceAndFireLinkHeaders?) -> Void)
    {
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/vnd.anapioficeandfire+json; version=\(APIVersion)", forHTTPHeaderField: "Accept")
        request.setValue(ETAG, forHTTPHeaderField: "If-None-Match")
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            
            //** Gaurd against error
            guard error == nil else
            {
                completionHandler(nil, error as NSError?, nil)
                return
            }
            
            //** Make sure we have a HTTPURLResponse
            guard urlResponse is HTTPURLResponse else
            {
                completionHandler(nil, NSError(type: .httpError), nil)
                return
            }
            
            let httpURLResponse : HTTPURLResponse  = urlResponse as! HTTPURLResponse
            
            //** Make sure we got a 200
            guard httpURLResponse.statusCode == 200 else
            {
                completionHandler(nil, NSError(type: .httpError, forcedLocalizedDescription: HTTPURLResponse.localizedString(forStatusCode: httpURLResponse.statusCode)), nil)
                return
            }
            
            guard data != nil else
            {
                completionHandler(nil, NSError(type: .apiError), nil)
                return
            }
            
            //** Parsing the link headers
            let linkHeaders = IceAndFireLinkHeaders(httpURLResponse: httpURLResponse)
            
            //** Try parse into JSONObject
            do
            {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                //** Make sure it can be parsed into dictionary
                guard jsonResponse is T else
                {
                    completionHandler(nil, NSError(type: .jsonError), nil)
                    return
                }
                
                //** Fire off completion handler
                completionHandler(jsonResponse as? T, nil, linkHeaders)
            }
            catch
            {
                completionHandler(nil, NSError(type: .jsonError), nil)
            }
            
        }
        task.resume()
    }
    
    
}
