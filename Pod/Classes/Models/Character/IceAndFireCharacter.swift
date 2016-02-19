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