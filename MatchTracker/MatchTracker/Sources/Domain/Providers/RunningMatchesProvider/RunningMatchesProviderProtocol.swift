//
//  RunningMatchesProviderProtocol.swift
//  MatchTracker
//
//

import Foundation

protocol RunningMatchesProviderProtocol {
    func execute() async throws -> MatchesResponse
}
