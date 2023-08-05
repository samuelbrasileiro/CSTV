//
//  MatchTrackerDomainAssembler.swift
//  MatchTracker
//
//

import DependencyInjection
import Service

class MatchTrackerDomainAssembly: Assembly {
    open func assemble(container: DependencyContainer) {
        registerMatchTrackerService(container)
        
        registerPlayersProvider(container)
        registerRunningMatchesProvider(container)
        registerUpcomingMatchesProvider(container)
    }

    private func registerMatchTrackerService(_ container: DependencyContainer) {
        container.register(MatchTrackerServiceProtocol.self) { resolver in
            let networkService = resolver.resolve(NetworkServiceProtocol.self)
            return MatchTrackerService(networkService: networkService)
        }
    }
    
    private func registerPlayersProvider(_ container: DependencyContainer) {
        container.register(PlayersProviderProtocol.self) { resolver in
            let service = resolver.resolve(MatchTrackerServiceProtocol.self)
            return PlayersProvider(service: service)
        }
    }
    
    private func registerUpcomingMatchesProvider(_ container: DependencyContainer) {
        container.register(UpcomingMatchesProviderProtocol.self) { resolver in
            let service = resolver.resolve(MatchTrackerServiceProtocol.self)
            return UpcomingMatchesProvider(service: service)
        }
    }
    
    private func registerRunningMatchesProvider(_ container: DependencyContainer) {
        container.register(RunningMatchesProviderProtocol.self) { resolver in
            let service = resolver.resolve(MatchTrackerServiceProtocol.self)
            return RunningMatchesProvider(service: service)
        }
    }
}
