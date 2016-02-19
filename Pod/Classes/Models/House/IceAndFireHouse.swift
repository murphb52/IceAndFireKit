//
//  IceAndFireHouse.swift
//  Pods
//
//  Created by Brian Murphy on 16/02/2016.
//
//

import Foundation

public class IceAndFireHouse : IceAndFireObject
{
    public static let APIType = "houses"
    
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
    
    /// The hypermedia URL of this resource
    public var urlString : String?
    
    /// The name of this House.
    public var name : String?
    
    /// The region that this house resides in.
    var region : String?
    
    /// Text describing the coat of arms of this house.
    var coatOfArms : String?
    
    /// The words of this house.
    var words : String?
    
    /// The titles that this house holds.
    var titles : [String]?
    
    /// The seats that this house holds.
    var seats : [String]?
    
    /// The Character resource URL of this house's current lord.
    var currentLordURLString : String?
    
    /// The Character resource URL of this house's heir.
    var heirURLString : String?
    
    /// The House resource URL that this house answers to.
    var overlordURLString : String?
    
    /// The year that this house was founded.
    var founded : String?
    
    /// The Character resource URL that founded this house.
    var founderURLString : String?
    
    /// The year that this house died out.
    var diedOut : String?
    
    /// An array of names of the noteworthy weapons that this house owns.
    var ancestralWeapons : [String]?
    
    /// An array of House resource URLs that was founded from this house.
    var cadetBranchesURLStringsArray : [String]?
    
    /// An array of Character resource URLs that are sworn to this house.
    var swornMembersURLStrings : [String]?

    //MARK: IceAndFireKit Variables. Infered from urls from the API. All objects need to be loaded from the API Seperatly

    /// Created from the `currentLordURLString`. Needs to be loaded from the API for details
    var currentLordObject : IceAndFireCharacter?
    
    /// Created from the `heirURLString. Needs to be loaded from the API for details
    var heirObject : IceAndFireCharacter?
    
    /// Created from the `overlordURLString`. Needs to be loaded from the API for details
    var overlord : IceAndFireCharacter?
    
    /// Created from the `founderURLString`. Needs to be loaded from the API for details
    var founderObject : IceAndFireCharacter?
    
    /// Created from the `cadetBranchesURLStringsArray`. Needs to be loaded from the API for details
    var cadetBranchesObjectsArray : [IceAndFireHouse]?
    
    /// Created from the `swornMembersURLStrings`. Needs to be loaded from the API for details
    var swornMembersObjectsArray : [IceAndFireCharacter]?
    
}