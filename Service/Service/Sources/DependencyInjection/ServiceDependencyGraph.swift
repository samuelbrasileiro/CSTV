//
//  ServiceDependencyGraph.swift
//  Service
//
//

import DependencyInjection

public class ServiceDependencyGraph: DependencyGraph {
    
    private var assemblies: [Assembly] = [
        ServiceAssembly(),
        ApplicationServiceModelsAssembly()
    ]
    
    public init() { }
    
    public func build() -> [Assembly] {
        return assemblies
    }
}
