//
//  Assembly.swift
//  DependencyInjection
//
//

import Foundation

public protocol Assembly {
    func assemble(container: DependencyContainer)
}
