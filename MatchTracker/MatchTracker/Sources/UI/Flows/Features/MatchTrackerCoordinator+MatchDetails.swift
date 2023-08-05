//
//  MatchTrackerCoordinator+MatchDetails.swift
//  MatchTracker
//
//

import Foundation
import SwiftUI

extension MatchTrackerCoordinator {
    func makeMatchDetailsView(match: Match) -> some View {
        let viewModel = resolver.resolve(MatchDetailsViewModel.self,
                                         argument: match)
        var view = MatchDetailsView(viewModel: viewModel)
        view.delegate = self
        return view.environmentObject(viewModel)
    }
}

extension MatchTrackerCoordinator: MatchDetailsViewDelegate { }
