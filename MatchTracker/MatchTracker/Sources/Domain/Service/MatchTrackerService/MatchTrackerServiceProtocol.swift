//
//  MatchTrackerServiceProtocol.swift
//  MatchTracker
//
//

import Foundation

protocol MatchTrackerServiceProtocol {
    func getPlayers(teamId: Int, completion: @escaping (Result<PlayersResponse, Error>) -> Void)
}
