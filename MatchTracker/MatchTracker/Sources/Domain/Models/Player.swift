//
//  Player.swift
//  MatchTracker
//
//

import Foundation

typealias PlayersResponse = [Player]

// MARK: - Player
struct Player: Codable, Identifiable {
    var currentTeam: Team?
    var firstName: String?
    var id: Int?
    var imageURL: String?
    var lastName: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case currentTeam = "current_team"
        case firstName = "first_name"
        case id
        case imageURL = "image_url"
        case lastName = "last_name"
        case name
    }
    
    func getFullName() -> String {
        return (name ?? "") + (lastName ?? "")
    }
}
