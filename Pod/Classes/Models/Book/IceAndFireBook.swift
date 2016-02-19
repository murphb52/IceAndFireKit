//
//  IceAndFireBook.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

public class IceAndFireBook : IceAndFireObject
{
    public static let APIType = "books"
    
    public required init?(dictionary: NSDictionary?)
    {
        guard dictionary == nil else
        {
            return nil
        }
    }
    
    public required init?(urlString: String?)
    {
        guard urlString == nil else
        {
            return nil
        }
    }
    
    //MARK: Properties from API
    
    /// The hypermedia URL of this resource
    public var urlString : String?
    
    /// The name of this Book.
    public var name : String?
    
    /// The International Standard Book Number that uniquely identifies this book. The format used is ISBN-13.
    public var isbn : String?
    
    /// An array of names of the authors that wrote this book.
    public var authors : [String]?
    
    /// The number of pages in this book.
    public var numberOfPages : Int?
    
    /// The company that published this book.
    public var publisher : String?
    
    /// The country which this book was published in.
    public var country : String?
    
    /// The type of media this book was released in. Possible values are: Hardback, Hardcover, GraphicNovel and Paperback.
    public var mediaType : String?
    
    /// The date, in ISO 8601 format, which this book was released
    public var released : NSDate?
    
    /// array of string	An array of Character resource URLs that has been in this book.
    public var characterURLStrings : [String]?
    
    /// array of string	An array of Character resource URLs that has had a POV-chapter in this book.
    public var povCharacterURLStrings : [String]?
    
    //MARK: IceAndFireKit variables. Infered from urls from the API. All objects need to be loaded from the API Seperatly
    
    /// An array of character objects. This is created from the `characterURLStrings`. Base objects that need to be loaded for their information
    public var characterObjects : [IceAndFireCharacter]?
    
    /// An array of character objects. This is created from the `characterURLStrings`. Base objects that need to be loaded for their information
    public var povCharacterObjects : [IceAndFireCharacter]?
}