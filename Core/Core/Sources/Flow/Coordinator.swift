//
//  Coordinator.swift
//  Core
//
//

import DependencyInjection
import UIKit

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: (any Coordinator)? { get set }
    var childCoordinators: [any Coordinator] { get set }
    
    init(resolver: DependencyResolver, navigationController: UINavigationController)
    func start()
    
    func removeCoordinator(_ coordinator: some Coordinator)
}

public extension Coordinator {
    func removeCoordinator(_ coordinator: some Coordinator) {
        for (index, value) in childCoordinators.enumerated() {
            if value === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
