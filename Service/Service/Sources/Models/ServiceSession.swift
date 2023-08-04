//
//  ServiceSession.swift
//  Service
//
//

import Foundation

public protocol ServiceSessionProtocol {
    var baseURL: String { get }
    func buildFinalPath(from request: ServiceRequest) -> String
}

struct ApplicationServiceSession: ServiceSessionProtocol {
    var baseURL: String {
        return "https://api.pandascore.co/"
    }
    
    func buildFinalPath(from request: ServiceRequest) -> String {
        return baseURL + request.path
    }
}
