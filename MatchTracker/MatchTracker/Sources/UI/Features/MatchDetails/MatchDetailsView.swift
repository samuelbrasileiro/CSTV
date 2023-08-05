//
//  MatchDetailsView.swift
//  MatchTracker
//
//

import Core
import SwiftUI
import SDWebImageSwiftUI

protocol MatchDetailsViewDelegate: AnyObject { }

struct MatchDetailsView: View {
    @ObservedObject private var viewModel: MatchDetailsViewModel
    @State private var isLoading = true
    @State private var isRefreshing = false
    
    @State private var showErrorAlert = false
    @State private var error: Error?
    
    weak var delegate: MatchDetailsViewDelegate?
    
    init(viewModel: MatchDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    MatchTeamsView(match: $viewModel.match)
                    if let date = viewModel.match.beginAt?.formattedDate() {
                        Text(date)
                            .font(CoreFont.roboto.bold(size: 12))
                            .foregroundColor(CoreColor.primary.color)
                    }
                    HStack(spacing: 12) {
                        TeamPlayersView(players: $viewModel.firstTeamPlayers, isLeftAligned: true)
                        TeamPlayersView(players: $viewModel.secondTeamPlayers, isLeftAligned: false)
                    }
                }
            }
            .background(CoreColor.primaryBackground.color)
            .navigationBarTitle(viewModel.getTitle())
            .showError(error, isPresented: $showErrorAlert)
            .refreshable(action: viewModel.retrievePlayers)
            .onAppear {
                UIRefreshControl.appearance().tintColor = CoreColor.primary.uiColor
            }
            .onReceive(viewModel.changeViewState.receive(on: DispatchQueue.main)) { viewState in
                handleViewState(viewState)
            }
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: CoreColor.primary.color))
                    .scaleEffect(2.0)
            }
        }
    }
    
    private func handleViewState(_ viewState: MatchDetailsViewState) {
        switch viewState {
        case .loading:
            isLoading = true
        case .success:
            isLoading = false
            viewModel.objectWillChange.send()
        case .error(let error):
            isLoading = false
            self.error = error
            showErrorAlert = true
        }
        isRefreshing = false
    }
}
