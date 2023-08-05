//
//  SceneDelegate.swift
//  Application
//
//

import Core
import ModuleIntegrator
import MatchTracker
import UIKit

public class SceneDelegate: CoreSceneDelegate {
    public override func setupEnvironment() {
        let navigationController = UINavigationController()
        let resolver = ApplicationIntegrator.build()
        let coordinator = MatchTrackerCoordinator(resolver: resolver,
                                                  navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.coordinator = coordinator
    }
}

extension SceneDelegate: MatchTrackerCoordinatorDelegate { }
