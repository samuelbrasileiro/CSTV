//
//  Assembler.swift
//  DependencyInjection
//
//

import Foundation

public final class Assembler {
    public var resolver: DependencyResolver {
        return container
    }
    
    private let container: DependencyContainer
    
    public init() {
        container = DependencyContainer()
    }
    
    public init(_ container: DependencyContainer) {
        self.container = container
    }
    
    public func addContents(of graph: DependencyGraph) {
        for assembly in graph.build() {
            assembly.assemble(container: container)
        }
    }
}
