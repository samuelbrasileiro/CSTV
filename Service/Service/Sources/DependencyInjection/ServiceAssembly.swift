//
//  ServiceAssembly.swift
//  Service
//
//

import DependencyInjection

class ServiceAssembly: Assembly {
    open func assemble(container: DependencyContainer) {
        registerNetworkService(container)
    }
    
    private func registerNetworkService(_ container: DependencyContainer) {
        container.register(NetworkServiceProtocol.self) { resolver in
            let session = resolver.resolve(ServiceSessionProtocol.self)
            return NetworkService(session: session)
        }
    }
}

class ApplicationServiceModelsAssembly: Assembly {
    open func assemble(container: DependencyContainer) {
        registerServiceSession(container)
    }
    
    private func registerServiceSession(_ container: DependencyContainer) {
        container.register(ServiceSessionProtocol.self) { _ in
            return ApplicationServiceSession()
        }
    }
}
