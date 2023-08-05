//
//  MatchTrackerRequest.swift
//  MatchTracker
//
//

import Foundation
import Service

class MatchTrackerRequest: ServiceRequest {
    
    private let apiKey = "8W5hiMUWA5ayeWjPI55YDqxM1kc3kIPhLPKVtJ3XJxbwnUjPOmE"
    
    enum Request {
        case players(teamId: Int)
        case upcomingMatches
        case runningMatches
    }
    
    let req: Request
    let page: Int
    
    init(_ req: Request, page: Int = 1) {
        self.req = req
        self.page = page
    }
    
    var path: String {
        switch req {
        case .players: return "players"
        case .runningMatches: return "matches/running"
        case .upcomingMatches: return "matches/upcoming"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        var parameters: [URLQueryItem] = []
        parameters.append(.init(name: "token", value: apiKey))
        parameters.append(.init(name: "page", value: String(page)))
        switch req {
        case .players(let teamId):
            parameters.append(.init(name: "filter[team_id]", value: String(teamId)))
        case .runningMatches,
                .upcomingMatches:
            parameters.append(.init(name: "sort", value: "begin_at"))
        }
        return parameters
        
    }
    var method: Service.ServiceHTTPMethod {
        switch req {
        case .players,
                .runningMatches,
                .upcomingMatches: return .get
        }
    }
}
