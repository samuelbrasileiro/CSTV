//
//  DependencyGraph.swift
//  DependencyInjection
//
//

import Foundation

public protocol DependencyGraph: AnyObject {
    func build() -> [Assembly]
}
