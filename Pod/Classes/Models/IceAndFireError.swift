//
//  IceAndFireError.swift
//  Pods
//
//  Created by Brian Murphy on 23/02/2016.
//
//

import Foundation

public let ProjectErrorDomain = "IceAndFireKitError"

public enum IceAndFireErrorType: Int {
    
    case Unknown =      1
    case HTTPError =    2
    case APIError =     3
    case JSONError =    4
    
    func localizedUserInfo(forcedLocalizedDescription : String?) -> [String: String]
    {
        var localizedDescription: String = ""
        var localizedFailureReasonError: String = ""
        var localizedRecoverySuggestionError: String = ""
        
        switch self
        {
        case Unknown:
            localizedFailureReasonError = "Unknown reason"
            localizedDescription = "Unknown reason"
            localizedRecoverySuggestionError = "Please investigate and try again"
        case HTTPError:
            localizedFailureReasonError = "Received response code other than 200"
            localizedDescription = "Bad response received"
            localizedRecoverySuggestionError = "Please investigate URL Response"
        case .APIError:
            localizedFailureReasonError = "Received error from the API"
            localizedDescription = "Please check request and try again"
            localizedRecoverySuggestionError = "Please investigate URL Request"
        case .JSONError:
            localizedFailureReasonError = "Error parsing JSON Into specified response type"
            localizedDescription = "Bad response received"
            localizedRecoverySuggestionError = "Check JSON Response type"
        }
        
        if forcedLocalizedDescription != nil
        {
            localizedDescription = forcedLocalizedDescription!
        }
        
        return [
            NSLocalizedDescriptionKey: localizedDescription,
            NSLocalizedFailureReasonErrorKey: localizedFailureReasonError,
            NSLocalizedRecoverySuggestionErrorKey: localizedRecoverySuggestionError
        ]
    }
}

extension NSError
{
    
    public convenience init(type: IceAndFireErrorType)
    {
        self.init(domain: ProjectErrorDomain, code: type.rawValue, userInfo: type.localizedUserInfo(nil))
    }
    
    public convenience init(type : IceAndFireErrorType, forcedLocalizedDescription : String?)
    {
        self.init(domain: ProjectErrorDomain, code: type.rawValue, userInfo: type.localizedUserInfo(forcedLocalizedDescription))
    }
}