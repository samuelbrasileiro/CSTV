//
//  UpcomingMatchesProviderProtocol.swift
//  MatchTracker
//
//

import Foundation

protocol UpcomingMatchesProviderProtocol {
    func execute(page: Int) async throws -> MatchesResponse
}
