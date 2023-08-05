//
//  Match.swift
//  MatchTracker
//
//

import Foundation

typealias MatchesResponse = [Match]

// MARK: - Match
public struct Match: Codable {
    var beginAt: Date?
    var endAt: Date?
    public var id: Int?
    var league: League?
    var leagueID: Int?
    var matchType: String?
    var name: String?
    var opponents: [OpponentElement]?
    var serie: Serie?
    var serieID: Int?
    var tournament: Tournament?
    var tournamentID: Int?
    var winner: Winner?
    var winnerID: Int?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case id, league
        case leagueID = "league_id"
        case matchType = "match_type"
        case name
        case opponents
        case serie
        case serieID = "serie_id"
        case tournament
        case tournamentID = "tournament_id"
        case winner
        case winnerID = "winner_id"
    }
    
    public func getTitle() -> String {
        let leagueName = league?.name
        let serieName = serie?.name
        let plusText = (leagueName != nil && serieName != nil) ? " + " : ""
        return (leagueName ?? "") + plusText + (serieName ?? "")
    }
}

extension Match: Identifiable { }

// MARK: - Winner
struct Winner: Codable {
    var id: Int?
    var type: String?
}

// MARK: - League
struct League: Codable {
    var id: Int?
    var imageURL: String?
    var name: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case name, url
    }
}

// MARK: - OpponentElement
struct OpponentElement: Codable {
    var opponent: Opponent?
    var type: String?
}

// MARK: - OpponentOpponent
struct Opponent: Codable {
    var acronym: String?
    var id: Int?
    var imageURL: String?
    var location: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case acronym, id
        case imageURL = "image_url"
        case location
        case name
    }
}

// MARK: - Serie
struct Serie: Codable {
    var beginAt: Date?
    var endAt: Date?
    var fullName: String?
    var id: Int?
    var leagueID: Int?
    var name: String?
    var winnerID: String?
    var winnerType: String?
    var year: Int?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case fullName = "full_name"
        case id
        case leagueID = "league_id"
        case name
        case winnerID = "winner_id"
        case winnerType = "winner_type"
        case year
    }
}

// MARK: - Tournament
struct Tournament: Codable {
    var beginAt: Date?
    var endAt: Date?
    var id, leagueID: Int?
    var liveSupported: Bool?
    var modifiedAt: Date?
    var name: String?
    var prizepool: String?
    var serieID: Int?
    var winnerID: String?
    var winnerType: String?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case id
        case leagueID = "league_id"
        case liveSupported = "live_supported"
        case modifiedAt = "modified_at"
        case name, prizepool
        case serieID = "serie_id"
        case winnerID = "winner_id"
        case winnerType = "winner_type"
    }
}
