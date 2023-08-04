//
//  DependencyResolver.swift
//  DependencyInjection
//
//

import Foundation

public protocol DependencyResolver {
    func resolve<Value>(_ dependency: Value.Type) -> Value
    func resolve<Value, Parameters>(_ dependency: Value.Type, argument: Parameters) -> Value
}
