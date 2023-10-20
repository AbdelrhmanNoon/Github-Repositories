//
//  ErrorHandler.swift
//  BeutiCustomer
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import Foundation

enum ErrorHandler: Error {
    case invalidAuthorization
    case network
    case serializationError
}

extension ErrorHandler {
    var message: String {
        switch self {
            
        case .network:
            return "Network Error"
        case .serializationError:
            return "Somthing Wrong"
        case .invalidAuthorization:
            return "Auth Error"
        }
    }
    
    var isInvalidAuthorization: Bool {
        if case .invalidAuthorization = self {
            return true
        } else {
            return false
        }
    }
    
    var isNetwork: Bool {
        if case .network = self {
            return true
        } else {
            return false
        }
    }
    
    var isSerialization: Bool {
        if case .serializationError = self {
            return true
        } else {
            return false
        }
    }
}

extension Error {
    var message: String {
        return (self as? ErrorHandler)?.message ?? "Somthing Wrong"
    }
    
    var isInvalidAuthorization: Bool {
        return (self as? ErrorHandler)?.isInvalidAuthorization ?? false
    }
    
    var isNetwork: Bool {
        return (self as? ErrorHandler)?.isNetwork ?? false
    }
    
    var isSerialization: Bool {
        return (self as? ErrorHandler)?.isSerialization ?? false
    }
}
