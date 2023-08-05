//
//  MatchTrackerDomainAssembler.swift
//  MatchTracker
//
//

import DependencyInjection
import Service

class MatchTrackerDomainAssembly: Assembly {
    open func assemble(container: DependencyContainer) {
        registerPlayersProvider(container)
    }

    private func registerPlayersProvider(_ container: DependencyContainer) {
        container.register(PlayersProviderProtocol.self) { resolver in
            let service = resolver.resolve(MatchTrackerServiceProtocol.self)
            return PlayersProvider(service: service)
        }
    }
}
