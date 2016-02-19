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
    var culture : String?
    
    /// The year that this person was born
    var born : String?
    
    /// The year that this person died.
    var died : String?
    
    /// The titles that this character holds.
    var titles : [String]?
    
    /// The aliases that this character goes by.
    var aliases : [String]?
    
    /// The character resource URL of this character's father.
    var fatherURLString : String?
    
    /// The character resource URL of this character's mother.
    var motherURLString : String?
    
    /// The character resource URL of this character's spouse.
    var spouseURLString : String?
    
    /// An array of House resource URLs that this character is loyal to.
    var allegiancesURLStringsArray : [String]?
    
    /// An array of Book resource URLs that this character has been in.
    var booksURLStrings : [String]?
    
    /// An array of Book resource URLs that this character has had a POV-chapter in.
    var povBooksURLStrings : [String]?
    
    /// An array of names of the seasons of Game of Thrones that this character has been in.
    var tvSeries : [String]?
    
    /// An array of actor names that has played this character in the TV show Game Of Thrones.
    var playedBy : [String]?
    
    //MARK: IceAndFireKit Variables. Infered from urls from the API. All objects need to be loaded from the API Seperatly

    /// Father object of the Character, infered from `fatherURLString`. Needs to be loaded from API
    var fatherObject : IceAndFireCharacter?
    
    /// Mother object of the Character, infered from `motherURLString`. Needs to be loaded from API
    var motherObject : IceAndFireCharacter?
    
    /// Spouse object of the Character, infered from `motherURLString`. Needs to be loaded from API
    var spouseObject : IceAndFireCharacter?
    
    /// An array of houses, infered from `allegiancesURLStringsArray`. Each object needs to be loaded from API
    var allegiancesObjectArray : [IceAndFireHouse]?

    /// An array of books, infered from `booksURLStrings`. Each object needs to be loaded from API
    var booksObjectArray : [IceAndFireBook]?
    
    /// An array of books, infered from `povBooksURLStrings`. Each object needs to be loaded from API
    var povBooksObjectArray : [IceAndFireBook]?
    
    
}