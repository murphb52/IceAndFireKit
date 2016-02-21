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
        guard dictionary != nil else
        {
            return nil
        }
        
        if dictionary?.objectForKey("url") != nil && dictionary?.objectForKey("url") is String
        {
            self.urlString = dictionary?.objectForKey("url") as? String
        }
        
        if dictionary?.objectForKey("name") != nil && dictionary?.objectForKey("name") is String
        {
            self.name = dictionary?.objectForKey("name") as? String
        }
        
        if dictionary?.objectForKey("isbn") != nil && dictionary?.objectForKey("isbn") is String
        {
            self.isbn = dictionary?.objectForKey("isbn") as? String
        }
        
        if dictionary?.objectForKey("authors") != nil && dictionary?.objectForKey("authors") is [String]
        {
            self.authors = dictionary?.objectForKey("authors") as? [String]
        }
        
        if dictionary?.objectForKey("numberOfPages") != nil && dictionary?.objectForKey("numberOfPages") is Int
        {
            self.numberOfPages = dictionary?.objectForKey("numberOfPages") as? Int
        }
        
        if dictionary?.objectForKey("country") != nil && dictionary?.objectForKey("country") is String
        {
            self.country = dictionary?.objectForKey("country") as? String
        }
        
        if dictionary?.objectForKey("mediaType") != nil && dictionary?.objectForKey("mediaType") is String
        {
            self.mediaType = dictionary?.objectForKey("mediaType") as? String
        }
        
        if dictionary?.objectForKey("released") != nil && dictionary?.objectForKey("released") is String
        {
            let releaseString = dictionary?.objectForKey("released") as? String
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
            dateFormatter.timeZone = NSTimeZone.localTimeZone()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            self.released =  dateFormatter.dateFromString(releaseString!)
        }
        
        if dictionary?.objectForKey("characters") != nil && dictionary?.objectForKey("characters") is [String]
        {
            self.characterURLStrings = dictionary?.objectForKey("characters") as? [String]
            
            self.characterObjects = []
            for characterURLString in self.characterURLStrings!
            {
                let iceAndFireChar = IceAndFireCharacter(urlString: characterURLString)
                self.characterObjects?.append(iceAndFireChar!)
            }
        }
        
        if dictionary?.objectForKey("povCharacters") != nil && dictionary?.objectForKey("povCharacters") is [String]
        {
            self.povCharacterURLStrings = dictionary?.objectForKey("povCharacters") as? [String]
            
            self.povCharacterObjects = []
            for povCharacterURLString in self.povCharacterURLStrings!
            {
                let iceAndFireChar = IceAndFireCharacter(urlString: povCharacterURLString)
                self.povCharacterObjects?.append(iceAndFireChar!)
            }
        }
        
    }
    
    public required init?(urlString: String?)
    {
        guard urlString != nil else
        {
            return nil
        }
        
        self.urlString = urlString
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