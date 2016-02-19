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
    
    //** Create an object from a dictionary
    init?(ditionary: NSDictionary)
    
    //** Can create the object with a url of where to populate it
    init?(urlString: String)
}