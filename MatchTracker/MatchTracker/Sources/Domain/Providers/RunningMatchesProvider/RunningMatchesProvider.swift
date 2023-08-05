//
//  RunningMatchesProvider.swift
//  MatchTracker
//
//

import Combine
import Foundation
import Service
import UIKit

class RunningMatchesProvider: RunningMatchesProviderProtocol {
    
    private var service: MatchTrackerServiceProtocol
    private var subscriptions: Set<AnyCancellable> = []
    
    init(service: MatchTrackerServiceProtocol) {
        self.service = service
    }
    
    func execute() async throws -> MatchesResponse {
        return try await withCheckedThrowingContinuation { continuation in
            service.getRunningMatches { result in
                continuation.resume(with: result)
            }
        }
    }
}
