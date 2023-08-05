//
//  Team.swift
//  MatchTracker
//
//

import Foundation

// MARK: - Team
struct Team: Codable {
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
