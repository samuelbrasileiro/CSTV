//
//  MatchTrackerServiceMock.swift
//  MatchTrackerTests
//
//

import Foundation
@testable import MatchTracker

class MatchTrackerServiceMock: MatchTrackerServiceProtocol {
    
    func getPlayers(teamId: Int, completion: @escaping (Result<[Player], Error>) -> Void) {
        let player1 = Player(firstName: "John",
                             imageURL: "https://example.com/john.png",
                             name: "John Doe")

        let player2 = Player(firstName: "Jane",
                             imageURL: "https://example.com/jane.png",
                             name: "Jane Smith")

        let mockPlayers = [player1, player2]
        
        completion(.success(mockPlayers))
    }
    
    func getRunningMatches(completion: @escaping (Result<[Match], Error>) -> Void) {
        
        let match1 = Match(beginAt: .now - 60 * 60,
                           endAt: .now + 60 * 60,
                          name: "Partida de exemplo",
                          opponents: [
                            OpponentElement(opponent: Team(acronym: "T1",
                                                           id: 1,
                                                           imageURL: "https://example.com/t1.png",
                                                           location: "City A",
                                                           name: "Team 1"),
                                            type: "home"),
                            OpponentElement(opponent: Team(acronym: "T2",
                                                           id: 2,
                                                           imageURL: "https://example.com/t2.png",
                                                           location: "City B",
                                                           name: "Team 2"),
                                            type: "away")
                          ])
        
        let mockRunningMatches = [match1]
        
        completion(.success(mockRunningMatches))
    }
    
    func getUpcomingMatches(page: Int, completion: @escaping (Result<[Match], Error>) -> Void) {
        let match1 = Match(beginAt: .now + 60 * 60,
                           endAt: .now + 3 * 60 * 60,
                          id: 2002,
                          league: League(id: 200,
                                         imageURL: "https://example.com/league.png",
                                         name: "Liga B",
                                         url: "https://example.com/league"),
                          name: "Partida de exemplo 2",
                          opponents: [
                            OpponentElement(opponent: Team(acronym: "T3",
                                                           id: 3,
                                                           imageURL: "https://example.com/t3.png",
                                                           location: "City C",
                                                           name: "Team 3"),
                                            type: "home"),
                            OpponentElement(opponent: Team(acronym: "T4",
                                                           id: 4,
                                                           imageURL: "https://example.com/t4.png",
                                                           location: "City D",
                                                           name: "Team 4"),
                                            type: "away")
                          ],
                          serie: Serie(beginAt: Date(),
                                       endAt: Date(),
                                       fullName: "Série Principal 2",
                                       id: 600,
                                       leagueID: 200,
                                       name: "Principal 2"),
                          tournament: Tournament(beginAt: Date(),
                                                 endAt: Date(),
                                                 id: 2000,
                                                 name: "Torneio Principal 2"))
        
        let mockUpcomingMatches = [match1]
        
        completion(.success(mockUpcomingMatches))
    }
}

enum MockError: Error {
    case mockError
}

class MatchTrackerServiceErrorMock: MatchTrackerServiceProtocol {
    func getPlayers(teamId: Int, completion: @escaping (Result<[Player], Error>) -> Void) {
        completion(.failure(MockError.mockError))
    }

    func getRunningMatches(completion: @escaping (Result<[Match], Error>) -> Void) {
        completion(.failure(MockError.mockError))
    }

    func getUpcomingMatches(page: Int, completion: @escaping (Result<[Match], Error>) -> Void) {
        completion(.failure(MockError.mockError))
    }
}

class MatchTrackerServiceEmptyDataMock: MatchTrackerServiceProtocol {
    func getPlayers(teamId: Int, completion: @escaping (Result<[Player], Error>) -> Void) {
        completion(.success([]))
    }

    func getRunningMatches(completion: @escaping (Result<[Match], Error>) -> Void) {
        completion(.success([]))
    }

    func getUpcomingMatches(page: Int, completion: @escaping (Result<[Match], Error>) -> Void) {
        completion(.success([]))
    }
}

class MatchTrackerServiceMultipleItemsMock: MatchTrackerServiceProtocol {
    func getPlayers(teamId: Int, completion: @escaping (Result<[Player], Error>) -> Void) {
        // Return multiple players
        let player1 = Player(firstName: "John", lastName: "Doe")
        let player2 = Player(firstName: "Jane", lastName: "Smith")
        let players = [player1, player2]
        completion(.success(players))
    }

    func getRunningMatches(completion: @escaping (Result<[Match], Error>) -> Void) {
        // Return multiple running matches
        let match1 = Match(name: "Match 1")
        let match2 = Match(name: "Match 2")
        let matches = [match1, match2]
        completion(.success(matches))
    }

    func getUpcomingMatches(page: Int, completion: @escaping (Result<[Match], Error>) -> Void) {
        // Return multiple upcoming matches
        let match1 = Match(name: "Upcoming Match 1")
        let match2 = Match(name: "Upcoming Match 2")
        let matches = [match1, match2]
        completion(.success(matches))
    }
}

class MatchTrackerServiceCachingMock: MatchTrackerServiceProtocol {
    
    public var callCount = 0

    private var cachedPlayers: [Player]?
    private var cachedRunningMatches: [Match]?
    private var cachedUpcomingMatches: [Match]?
    
    func getPlayers(teamId: Int, completion: @escaping (Result<[Player], Error>) -> Void) {
        if let cachedPlayers = cachedPlayers {
            completion(.success(cachedPlayers))
        } else {
            callCount += 1
            let player1 = Player(firstName: "John", lastName: "Doe")
            let player2 = Player(firstName: "Jane", lastName: "Smith")
            let players = [player1, player2]
            cachedPlayers = players
            completion(.success(players))
        }
    }

    func getRunningMatches(completion: @escaping (Result<[Match], Error>) -> Void) {
        if let cachedRunningMatches = cachedRunningMatches {
            completion(.success(cachedRunningMatches))
        } else {
            callCount += 1
            let match1 = Match(name: "Running Match 1")
            let match2 = Match(name: "Running Match 2")
            let matches = [match1, match2]
            cachedRunningMatches = matches
            completion(.success(matches))
        }
    }

    func getUpcomingMatches(page: Int, completion: @escaping (Result<[Match], Error>) -> Void) {
        if let cachedUpcomingMatches = cachedUpcomingMatches {
            completion(.success(cachedUpcomingMatches))
        } else {
            callCount += 1
            let match1 = Match(name: "Upcoming Match 1")
            let match2 = Match(name: "Upcoming Match 2")
            let matches = [match1, match2]
            cachedUpcomingMatches = matches
            completion(.success(matches))
        }
    }
}

