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
    var name: String?
    var opponents: [OpponentElement]?
    var serie: Serie?
    var tournament: Tournament?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case id, league
        case name
        case opponents
        case serie
        case tournament
    }
    
    public func getTitle() -> String {
        let leagueName = league?.name
        let serieName = serie?.name
        let plusText = (leagueName != nil && serieName != nil) ? " + " : ""
        return (leagueName ?? "") + plusText + (serieName ?? "")
    }
}

extension Match: Identifiable { }

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
    var opponent: Team?
    var type: String?
}

// MARK: - Serie
struct Serie: Codable {
    var beginAt: Date?
    var endAt: Date?
    var fullName: String?
    var id: Int?
    var leagueID: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case fullName = "full_name"
        case id
        case leagueID = "league_id"
        case name
    }
}

// MARK: - Tournament
struct Tournament: Codable {
    var beginAt: Date?
    var endAt: Date?
    var id: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case id
        case name
    }
}
