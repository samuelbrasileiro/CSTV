//
//  MatchTrackerService.swift
//  MatchTracker
//
//

import Service

class MatchTrackerService: MatchTrackerServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getPlayers(teamId: Int,
                    completion: @escaping (Result<PlayersResponse, Error>) -> Void) {
        networkService.fetch(PlayersResponse.self, from: MatchTrackerRequest(.players(teamId: teamId))){ result in
            completion(result.flatMapError { serviceError in
                    .failure(serviceError)
            })
        }
    }
}
