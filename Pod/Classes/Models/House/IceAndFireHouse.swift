//
//  IceAndFireHouse.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

open class IceAndFireHouse : IceAndFireObject
{
    open static let APIType = "houses"
    
    public required init?(dictionary: NSDictionary?)
    {
        guard dictionary != nil else
        {
            self.isDetailed = false
            return nil
        }
        
        self.urlString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "url")
        self.name = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "name")
        self.region = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "region")
        self.coatOfArms = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "coatOfArms")
        self.words = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "words")
        self.titles = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "titles")
        self.seats = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "seats")
        self.currentLordURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "currentLord")
        self.currentLordObject = IceAndFireCharacter(urlString: self.currentLordURLString)
        self.heirURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "heir")
        self.heirObject = IceAndFireCharacter(urlString: self.heirURLString)
        self.overlordURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "overlord")
        self.overlord = IceAndFireCharacter(urlString: self.overlordURLString)
        self.founded = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "founded")
        self.founderURLString = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "founder")
        self.founderObject = IceAndFireCharacter(urlString: self.founderURLString)
        self.diedOut = IceAndFireObjectParser.stringFromDictionary(dictionary!, key: "diedOut")
        self.ancestralWeapons = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "ancestralWeapons")
        self.cadetBranchesURLStringsArray = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "cadetBranches")
        self.cadetBranchesObjectsArray = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.cadetBranchesURLStringsArray)
        self.swornMembersURLStrings = IceAndFireObjectParser.arrayFromDictionary(dictionary!, key: "swornMembers")
        self.swornMembersObjectsArray = IceAndFireObjectParser.arrayOfIceAndFireObjectsFromArrayOfUrls(self.swornMembersURLStrings)
        
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
    
    /// Indicates if the object has been fully fetched from the API or is just a url
    open var isDetailed : Bool
    
    /// The hypermedia URL of this resource
    open var urlString : String?
    
    /// The name of this House.
    open var name : String?
    
    /// The region that this house resides in.
    open var region : String?
    
    /// Text describing the coat of arms of this house.
    open var coatOfArms : String?
    
    /// The words of this house.
    open var words : String?
    
    /// The titles that this house holds.
    open var titles : [String]?
    
    /// The seats that this house holds.
    open var seats : [String]?
    
    /// The Character resource URL of this house's current lord.
    open var currentLordURLString : String?
    
    /// The Character resource URL of this house's heir.
    open var heirURLString : String?
    
    /// The House resource URL that this house answers to.
    open var overlordURLString : String?
    
    /// The year that this house was founded.
    open var founded : String?
    
    /// The Character resource URL that founded this house.
    open var founderURLString : String?
    
    /// The year that this house died out.
    open var diedOut : String?
    
    /// An array of names of the noteworthy weapons that this house owns.
    open var ancestralWeapons : [String]?
    
    /// An array of House resource URLs that was founded from this house.
    open var cadetBranchesURLStringsArray : [String]?
    
    /// An array of Character resource URLs that are sworn to this house.
    open var swornMembersURLStrings : [String]?

    //MARK: IceAndFireKit Variables. Infered from urls from the API. All objects need to be loaded from the API Seperatly

    /// Created from the `currentLordURLString`. Needs to be loaded from the API for details
    open var currentLordObject : IceAndFireCharacter?
    
    /// Created from the `heirURLString. Needs to be loaded from the API for details
    open var heirObject : IceAndFireCharacter?
    
    /// Created from the `overlordURLString`. Needs to be loaded from the API for details
    open var overlord : IceAndFireCharacter?
    
    /// Created from the `founderURLString`. Needs to be loaded from the API for details
    open var founderObject : IceAndFireCharacter?
    
    /// Created from the `cadetBranchesURLStringsArray`. Needs to be loaded from the API for details
    open var cadetBranchesObjectsArray : [IceAndFireHouse]?
    
    /// Created from the `swornMembersURLStrings`. Needs to be loaded from the API for details
    open var swornMembersObjectsArray : [IceAndFireCharacter]?
    
}
