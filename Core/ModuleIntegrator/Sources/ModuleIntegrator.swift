//
//  ModuleIntegrator.swift
//  ModuleIntegrator
//
//

import DependencyInjection

protocol ModuleIntegrator {
    static func build() -> DependencyResolver
}
