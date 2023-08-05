//
//  MatchesViewModel.swift
//  MatchTracker
//
//

import Combine
import Commons
import Core
import Foundation
import UIKit

class MatchesViewModel: ObservableObject {
    
    // MARK: - PUBLIC PROPERTIES
    
    let changeViewState: PassthroughSubject<MatchesViewState, Never> = .init()
    
    var matches: [Match] = []
    @Published public var isFetchingNextPage = false

    // MARK: - PRIVATE PROPERTIES
    
    private let upcomingMatchesProvider: UpcomingMatchesProviderProtocol
    private let runningMatchesProvider: RunningMatchesProviderProtocol
    
    private var isFetchingAll = false
    private var currentPage = 1
    
    // MARK: - INITIALIZERS
    
    init(upcomingMatchesProvider: UpcomingMatchesProviderProtocol,
         runningMatchesProvider: RunningMatchesProviderProtocol) {
        self.upcomingMatchesProvider = upcomingMatchesProvider
        self.runningMatchesProvider = runningMatchesProvider
        setup()
    }
    
    // MARK: - PUBLIC METHODS
    
    func setup() {
        changeViewState.send(.loading)
        Task {
            await retrieveMatches()
        }
    }
    
    @Sendable
    func retrieveMatches() async {
        guard !isFetchingAll else { return }
        isFetchingAll = true
        
        do {
            let upcomingMatches = try await upcomingMatchesProvider.execute(page: 1)
            let runningMatches = try await runningMatchesProvider.execute()

            handleMatchesSuccess(runningMatches: runningMatches,
                                 upcomingMatches: upcomingMatches)
        } catch {
            changeViewState.send(.error(error))
        }
        isFetchingAll = false
    }
    
    @Sendable
    func retrievePaginationMatches() async {
        guard !isFetchingNextPage, !isFetchingAll else { return }
        DispatchQueue.main.async { [weak self] in
            self?.isFetchingNextPage = true
        }
        do {
            let matches = try await upcomingMatchesProvider.execute(page: currentPage)
            
            handlePaginationMatchesSuccess(matches: matches)
        } catch {
            changeViewState.send(.error(error))
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.isFetchingNextPage = false
        }
    }
    
    // MARK: - PRIVATE METHODS
    
    private func handleMatchesSuccess(runningMatches: MatchesResponse,
                                      upcomingMatches: MatchesResponse) {
        currentPage = 2
        matches = runningMatches + upcomingMatches
        changeViewState.send(.success)
    }
    
    private func handlePaginationMatchesSuccess(matches: MatchesResponse) {
        currentPage += 1
        self.matches += matches
        changeViewState.send(.success)
    }
}
