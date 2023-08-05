//
//  MatchTrackerUIAssembly.swift
//  MatchTracker
//
//

import Core
import DependencyInjection

class MatchTrackerUIAssembly: Assembly {
    func assemble(container: DependencyContainer) {
        registerMatchesViewModel(container)
        registerMatchDetailsViewModel(container)
    }

    private func registerMatchesViewModel(_ container: DependencyContainer) {
        container.register(MatchesViewModel.self) { (container) in
            let upcomingMatchesProvider = container.resolve(UpcomingMatchesProviderProtocol.self)
            let runningMatchesProvider = container.resolve(RunningMatchesProviderProtocol.self)
            return MatchesViewModel(upcomingMatchesProvider: upcomingMatchesProvider,
                                    runningMatchesProvider: runningMatchesProvider)
        }
    }
    
    private func registerMatchDetailsViewModel(_ container: DependencyContainer) {
        container.register(MatchDetailsViewModel.self) { (resolver: DependencyResolver, match: Match) in
            let playersProvider = container.resolve(PlayersProviderProtocol.self)
            return MatchDetailsViewModel(match: match,
                                         playersProvider: playersProvider)
        }
    }
}
