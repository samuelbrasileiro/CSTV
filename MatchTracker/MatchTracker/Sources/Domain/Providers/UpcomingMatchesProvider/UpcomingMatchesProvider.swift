//
//  UpcomingMatchesProvider.swift
//  MatchTracker
//
//

import Combine
import Foundation
import Service
import UIKit

class UpcomingMatchesProvider: UpcomingMatchesProviderProtocol {
    
    private var service: MatchTrackerServiceProtocol
    private var subscriptions: Set<AnyCancellable> = []
    
    init(service: MatchTrackerServiceProtocol) {
        self.service = service
    }
    
    func execute(page: Int) async throws -> MatchesResponse {
        return try await withCheckedThrowingContinuation { continuation in
            service.getUpcomingMatches(page: page) { result in
                continuation.resume(with: result)
            }
        }
    }
}
