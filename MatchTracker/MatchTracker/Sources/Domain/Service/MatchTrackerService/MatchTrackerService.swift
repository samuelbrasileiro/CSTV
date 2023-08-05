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
    
    func getUpcomingMatches(page: Int, completion: @escaping (Result<MatchesResponse, Error>) -> Void) {
        networkService.fetch(MatchesResponse.self, from: MatchTrackerRequest(.upcomingMatches, page: page)){ result in
            completion(result.flatMapError { serviceError in
                    .failure(serviceError)
            })
        }
    }
    
    func getRunningMatches(completion: @escaping (Result<MatchesResponse, Error>) -> Void) {
        networkService.fetch(MatchesResponse.self, from: MatchTrackerRequest(.runningMatches)){ result in
            completion(result.flatMapError { serviceError in
                    .failure(serviceError)
            })
        }
    }
}
