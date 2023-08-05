//
//  PlayersProviderProtocol.swift
//  MatchTracker
//
//

import Foundation

protocol PlayersProviderProtocol {
    func execute(teamId: Int) async throws -> PlayersResponse
}
