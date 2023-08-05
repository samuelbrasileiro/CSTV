//
//  PlayersProvider.swift
//  MatchTracker
//
//

import Combine
import Foundation
import Service
import UIKit

class PlayersProvider: PlayersProviderProtocol {
    
    private var service: MatchTrackerServiceProtocol
    private var subscriptions: Set<AnyCancellable> = []
    
    init(service: MatchTrackerServiceProtocol) {
        self.service = service
    }
    
    func execute(teamId: Int) async throws -> PlayersResponse {
        return try await withCheckedThrowingContinuation { continuation in
            service.getPlayers(teamId: teamId) { result in
                continuation.resume(with: result)
            }
        }
    }
}
