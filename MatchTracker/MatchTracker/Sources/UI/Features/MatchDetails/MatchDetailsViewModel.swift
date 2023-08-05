//
//  MatchDetailsViewModel.swift
//  MatchTracker
//
//

import Combine
import Commons
import Core
import Foundation
import UIKit

class MatchDetailsViewModel: ObservableObject {
    
    // MARK: - PUBLIC PROPERTIES
    
    let changeViewState: PassthroughSubject<MatchDetailsViewState, Never> = .init()
    
    var match: Match
    
    @Published var firstTeamPlayers: [Player] = []
    @Published var secondTeamPlayers: [Player] = []

    // MARK: - PRIVATE PROPERTIES
    
    private let playersProvider: PlayersProviderProtocol
    
    // MARK: - INITIALIZERS
    
    init(match: Match,
         playersProvider: PlayersProviderProtocol) {
        self.match = match
        self.playersProvider = playersProvider
        setup()
    }
    
    // MARK: - PUBLIC METHODS
    
    func setup() {
        changeViewState.send(.loading)
        Task {
            await retrievePlayers()
        }
    }
    
    func getTitle() -> String {
        return match.getTitle()
    }
    
    @Sendable
    func retrievePlayers() async {
        do {
            guard let opponentsIds = match.opponents?.compactMap({ $0.opponent?.id }),
                  opponentsIds.count == 2,
                  let firstTeamId = opponentsIds[safe: 0],
                  let secondTeamId = opponentsIds[safe: 1] else { return }

            // Execute the first team's playersProvider and await its result
            let firstTeamPlayers = try await playersProvider.execute(teamId: firstTeamId)

            // Execute the second team's playersProvider and await its result
            let secondTeamPlayers = try await playersProvider.execute(teamId: secondTeamId)

            handlePlayersSuccess(firstTeamPlayers: firstTeamPlayers,
                                 secondTeamPlayers: secondTeamPlayers)
        } catch {
            changeViewState.send(.error(error))
        }
    }

    
    // MARK: - PRIVATE METHODS
    
    private func handlePlayersSuccess(firstTeamPlayers: [Player],
                                      secondTeamPlayers: [Player]) {
        DispatchQueue.main.async { [weak self] in
            self?.firstTeamPlayers = firstTeamPlayers
            self?.secondTeamPlayers = secondTeamPlayers
            self?.changeViewState.send(.success)
        }
    }
}
