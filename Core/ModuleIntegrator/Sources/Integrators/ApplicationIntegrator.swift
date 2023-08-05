//
//  ApplicationIntegrator.swift
//  ModuleIntegrator
//
//

import Core
import DependencyInjection
import MatchTracker
import Service

public class ApplicationIntegrator: ModuleIntegrator {
    
    public static func build() -> DependencyResolver {
        let assembler = Assembler()
        let dependencyGraphs: [DependencyGraph] = [
            ServiceDependencyGraph(),
            MatchTrackerDependencyGraph()
        ]
        for graph in dependencyGraphs {
            assembler.addContents(of: graph)
        }
        return assembler.resolver
    }
}
