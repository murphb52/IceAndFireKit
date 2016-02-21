//
//  IceAndFireCharacter.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

public class IceAndFireCharacter : IceAndFireObject
{
    public static let APIType = "characters"
    
    public required init?(dictionary: NSDictionary?)
    {
        guard dictionary != nil else
        {
            return nil
        }
        
        self.urlString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "url")
        self.name = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "name")
        self.culture = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "culture")
        self.born = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "born")
        self.died = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "died")
        self.fatherURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "father")
        self.motherURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "mother")
        self.spouseURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "spouse")
        self.allegiancesURLStringsArray = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "allegiances")
        self.booksURLStrings = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "books")
        self.povBooksURLStrings = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "povBooks")
        self.tvSeries = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "tvSeries")
        self.playedBy = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "playedBy")
        
        //** Create objects from URLS
        self.fatherObject = IceAndFireCharacter(urlString: self.fatherURLString)
        self.motherObject = IceAndFireCharacter(urlString: self.motherURLString)
        self.spouseObject = IceAndFireCharacter(urlString: self.spouseURLString)
        
        
        self.allegiancesObjectArray = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.allegiancesURLStringsArray)
        self.booksObjectArray = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.booksURLStrings)
        self.povBooksObjectArray = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.povBooksURLStrings)

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
    
    /// The name of this Character.
    public var name : String?
    
    /// The culture that this character belongs to.
    public var culture : String?
    
    /// The year that this person was born
    public var born : String?
    
    /// The year that this person died.
    public var died : String?
    
    /// The titles that this character holds.
    public var titles : [String]?
    
    /// The aliases that this character goes by.
    public var aliases : [String]?
    
    /// The character resource URL of this character's father.
    public var fatherURLString : String?
    
    /// The character resource URL of this character's mother.
    public var motherURLString : String?
    
    /// The character resource URL of this character's spouse.
    public var spouseURLString : String?
    
    /// An array of House resource URLs that this character is loyal to.
    public var allegiancesURLStringsArray : [String]?
    
    /// An array of Book resource URLs that this character has been in.
    public var booksURLStrings : [String]?
    
    /// An array of Book resource URLs that this character has had a POV-chapter in.
    public var povBooksURLStrings : [String]?
    
    /// An array of names of the seasons of Game of Thrones that this character has been in.
    public var tvSeries : [String]?
    
    /// An array of actor names that has played this character in the TV show Game Of Thrones.
    public var playedBy : [String]?
    
    //MARK: IceAndFireKit Variables. Infered from urls from the API. All objects need to be loaded from the API Seperatly

    /// Father object of the Character, infered from `fatherURLString`. Needs to be loaded from API
    public var fatherObject : IceAndFireCharacter?
    
    /// Mother object of the Character, infered from `motherURLString`. Needs to be loaded from API
    public var motherObject : IceAndFireCharacter?
    
    /// Spouse object of the Character, infered from `motherURLString`. Needs to be loaded from API
    public var spouseObject : IceAndFireCharacter?
    
    /// An array of houses, infered from `allegiancesURLStringsArray`. Each object needs to be loaded from API
    public var allegiancesObjectArray : [IceAndFireHouse]?

    /// An array of books, infered from `booksURLStrings`. Each object needs to be loaded from API
    public var booksObjectArray : [IceAndFireBook]?
    
    /// An array of books, infered from `povBooksURLStrings`. Each object needs to be loaded from API
    public var povBooksObjectArray : [IceAndFireBook]?
    
    
}