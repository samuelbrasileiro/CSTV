//
//  MatchTrackerDependencyGraph.swift
//  MatchTracker
//
//

import DependencyInjection

public class MatchTrackerDependencyGraph: DependencyGraph {
    
    private var assemblies: [Assembly] = [
        MatchTrackerDomainAssembly(),
        MatchTrackerUIAssembly()
    ]
    
    public init() { }
    
    public func build() -> [Assembly] {
        return assemblies
    }
}
