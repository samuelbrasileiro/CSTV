//
//  Navigatable.swift
//  Core
//
//

import SwiftUI

public typealias CoreCoordinator = Coordinator & Navigatable & Routable

public protocol Navigatable {
    associatedtype Route: RouteProtocol
    func navigate(to route: Route)
    func goBack(animated: Bool)
}

public extension Navigatable where Self: Coordinator,
                                   Self: Routable {
    func navigate(to route: Route) {
        let view = getTransition(to: route)
        let viewController = UIHostingController(rootView: view)

        switch route.barStyle {
        case .automatic:
            viewController.navigationItem.largeTitleDisplayMode = .automatic
        case .normal:
            viewController.navigationItem.largeTitleDisplayMode = .never
        case .large:
            navigationController.navigationBar.prefersLargeTitles = true
            viewController.navigationItem.largeTitleDisplayMode = .always
        }
        
        switch route.transitionStyle {
        case .push:
            navigationController.pushViewController(viewController, animated: true)
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(viewController, animated: true)
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: true)
        }
    }
    
    func goBack(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
}
