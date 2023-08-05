//
//  MatchTrackerCoordinator+Matches.swift
//  MatchTracker
//
//

import Foundation
import SwiftUI

extension MatchTrackerCoordinator {
    func makeMatchesView() -> some View {
        let viewModel = resolver.resolve(MatchesViewModel.self)
        var view = MatchesView(viewModel: viewModel)
        view.delegate = self
        return view.environmentObject(viewModel)
    }
}

extension MatchTrackerCoordinator: MatchesViewDelegate {
    func matchesView(_ view: MatchesView, goToMatch match: Match) {
        navigate(to: .matchDetails(match: match))
    }
}
