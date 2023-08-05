//
//  MatchTrackerServiceProtocol.swift
//  MatchTracker
//
//

import Foundation

protocol MatchTrackerServiceProtocol {
    func getPlayers(teamId: Int, completion: @escaping (Result<PlayersResponse, Error>) -> Void)
    func getUpcomingMatches(page: Int, completion: @escaping (Result<MatchesResponse, Error>) -> Void)
    func getRunningMatches(completion: @escaping (Result<MatchesResponse, Error>) -> Void)
}
