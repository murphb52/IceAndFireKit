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
    
    case unknown =      1
    case httpError =    2
    case apiError =     3
    case jsonError =    4
    
    func localizedUserInfo(_ forcedLocalizedDescription : String?) -> [String: String]
    {
        var localizedDescription: String = ""
        var localizedFailureReasonError: String = ""
        var localizedRecoverySuggestionError: String = ""
        
        switch self
        {
        case .unknown:
            localizedFailureReasonError = "Unknown reason"
            localizedDescription = "Unknown reason"
            localizedRecoverySuggestionError = "Please investigate and try again"
        case .httpError:
            localizedFailureReasonError = "Received response code other than 200"
            localizedDescription = "Bad response received"
            localizedRecoverySuggestionError = "Please investigate URL Response"
        case .apiError:
            localizedFailureReasonError = "Received error from the API"
            localizedDescription = "Please check request and try again"
            localizedRecoverySuggestionError = "Please investigate URL Request"
        case .jsonError:
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
