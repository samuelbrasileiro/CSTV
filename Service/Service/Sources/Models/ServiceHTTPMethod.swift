//
//  ServiceHTTPMethod.swift
//  Service
//
//

import Foundation

public enum ServiceHTTPMethod: String {
    case get
    case post
    case update
    case delete
    
    public var rawValue: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .update: return "UPDATE"
        case .delete: return "DELETE"
        }
    }
}
