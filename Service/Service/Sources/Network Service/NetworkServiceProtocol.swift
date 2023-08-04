//
//  NetworkServiceProtocol.swift
//  Service
//
//

import UIKit

public protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ type: T.Type,
                             from request: ServiceRequest,
                             completion: @escaping (Result<T, ServiceError>) -> Void)
}
