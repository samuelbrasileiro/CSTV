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
        case matches
        case matchDetails(match: Match)
        
        public var barStyle: NavigationBarStyle {
            switch self {
            case .matches: return .large
            default: return .normal
            }
        }
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
    
    func setupNavigationUI() {
        navigationController.navigationBar.tintColor = CoreColor.primary.uiColor
        navigationController.navigationBar.barTintColor = CoreColor.primaryBackground.uiColor
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor : CoreColor.primary.uiColor]
        navigationController.navigationBar.largeTitleTextAttributes = [.foregroundColor : CoreColor.primary.uiColor]
        
        let backButtonImage = UIImage(systemName: "arrow.left")
        navigationController.navigationBar.backIndicatorImage = backButtonImage
        navigationController.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationController.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    public func startToRoute(_ route: Route? = nil) { 
        navigate(to: route ?? .matches)
        setupNavigationUI()
    }
    
    @ViewBuilder
    public func getTransition(to route: Route) -> some View {
        switch route {
        case .matches: makeMatchesView()
        case .matchDetails(let match): makeMatchDetailsView(match: match)
        }
    }
}
