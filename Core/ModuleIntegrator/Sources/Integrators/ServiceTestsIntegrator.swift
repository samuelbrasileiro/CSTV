//
//  ServiceIntegrator.swift
//  ModuleIntegrator
//
//

import DependencyInjection
import Service

public class ServiceTestsIntegrator: ModuleIntegrator {
    
    public static func build() -> DependencyResolver {
        let assembler = Assembler()
        let dependencyGraphs: [DependencyGraph] = [
            ServiceDependencyGraph()
        ]
        for graph in dependencyGraphs {
            assembler.addContents(of: graph)
        }
        return assembler.resolver
    }
}
