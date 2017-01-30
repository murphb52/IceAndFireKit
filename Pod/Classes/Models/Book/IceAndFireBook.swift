//
//  IceAndFireBook.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

open class IceAndFireBook : IceAndFireObject
{
    open static let APIType = "books"
    
    public required init?(dictionary: NSDictionary?)
    {
        guard dictionary != nil else
        {
            self.isDetailed = false
            return nil
        }
        
        self.urlString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "url")
        self.name = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "name")
        self.isbn = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "isbn")
        self.numberOfPages = IceAndFireObjectParser.integerFromDictionary(dictionary!, key: "numberOfPages")
        self.country = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "country")
        self.authors = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "authors")
        self.mediaType = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "mediaType")
        self.released = IceAndFireObjectParser.dateFromDictionary(dictionary!, key: "released")
        self.characterURLStrings = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "characters")
        self.povCharacterURLStrings = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "povCharacters")

        //** Populating character objects
        self.characterObjects = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.characterURLStrings)
        self.povCharacterObjects = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.povCharacterURLStrings)
        
        self.isDetailed = true
    }
    
    public required init?(urlString: String?)
    {
        guard urlString != nil else
        {
            self.isDetailed = false
            return nil
        }
        
        self.urlString = urlString
        
        self.isDetailed = false
    }
    
    //MARK: Properties from API
    
    /// Indicates if the object has been fully fetched from the API or is just a url
    open var isDetailed : Bool
    
    /// The hypermedia URL of this resource
    open var urlString : String?
    
    /// The name of this Book.
    open var name : String?
    
    /// The International Standard Book Number that uniquely identifies this book. The format used is ISBN-13.
    open var isbn : String?
    
    /// An array of names of the authors that wrote this book.
    open var authors : [String]?
    
    /// The number of pages in this book.
    open var numberOfPages : Int?
    
    /// The company that published this book.
    open var publisher : String?
    
    /// The country which this book was published in.
    open var country : String?
    
    /// The type of media this book was released in. Possible values are: Hardback, Hardcover, GraphicNovel and Paperback.
    open var mediaType : String?
    
    /// The date, in ISO 8601 format, which this book was released
    open var released : Date?
    
    /// array of string	An array of Character resource URLs that has been in this book.
    open var characterURLStrings : [String]?
    
    /// array of string	An array of Character resource URLs that has had a POV-chapter in this book.
    open var povCharacterURLStrings : [String]?
    
    //MARK: IceAndFireKit variables. Infered from urls from the API. All objects need to be loaded from the API Seperatly
    
    /// An array of character objects. This is created from the `characterURLStrings`. Base objects that need to be loaded for their information
    open var characterObjects : [IceAndFireCharacter]?
    
    /// An array of character objects. This is created from the `characterURLStrings`. Base objects that need to be loaded for their information
    open var povCharacterObjects : [IceAndFireCharacter]?
}
