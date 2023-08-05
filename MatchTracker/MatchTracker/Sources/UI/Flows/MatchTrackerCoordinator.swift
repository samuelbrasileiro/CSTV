//
//  MatchTrackerCoordinator.swift
//  MatchTracker
//
//

import Core
import DependencyInjection
import UIKit
import SwiftUI

public protocol MatchTrackerCoordinatorDelegate: AnyObject { }

public final class MatchTrackerCoordinator: CoreCoordinator {
    
    public enum Route: RouteProtocol {

    }
    
    // MARK: - PUBLIC PROPERTIES
    
    public var navigationController: UINavigationController
    weak public var parentCoordinator: (any Coordinator)?
    public var childCoordinators: [any Coordinator] = []
    
    public weak var delegate: MatchTrackerCoordinatorDelegate?
    let resolver: DependencyResolver
    
    // MARK: - INITIALIZER
    
    public required init(resolver: DependencyResolver,
                         navigationController: UINavigationController) {
        self.resolver = resolver
        self.navigationController = navigationController
    }
    
    // MARK: - PUBLIC METHODS
    
    public func start() {
        startToRoute()
    }

    public func startToRoute(_ route: Route? = nil) { 
        navigate(to: route)
    }
    
    @ViewBuilder
    public func getTransition(to route: Route) -> some View {
        EmptyView()
    }
}