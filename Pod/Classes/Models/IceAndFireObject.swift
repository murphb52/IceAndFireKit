//
//  IceAndFireObject.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

public protocol IceAndFireObject
{
    static var APIType : String { get }
    
    /// Create an object from a dictionary
    init?(dictionary: NSDictionary?)
    
    /// Can create the object with a url of where to populate it
    init?(urlString: String?)
    
    /// The hypermedia URL of this resource
    var urlString : String? { get set }
    
    /// The name of object from the API.
    var name : String? { get set }
    
    /// Indicates if the object has been fully fetched from the API or is just a url
    var isDetailed : Bool { get }
}