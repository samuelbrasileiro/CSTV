//
//  MatchesView.swift
//  MatchTracker
//
//

import Core
import SDWebImageSwiftUI
import SwiftUI

protocol MatchesViewDelegate: AnyObject {
    func matchesView(_ view: MatchesView, goToMatch match: Match)
}

struct MatchesView: View {
    @ObservedObject private var viewModel: MatchesViewModel
    @State private var isLoading = true
    @State private var isRefreshing = false
    
    @State private var showErrorAlert = false
    @State private var error: Error?
    
    weak var delegate: MatchesViewDelegate?
    
    init(viewModel: MatchesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach($viewModel.matches, id: \.id) { $match in
                        MatchItemView(match: $match)
                            .onAppear {
                                if isLastMatch(match) {
                                    fetchNextPage()
                                }
                            }
                            .onTapGesture {
                                delegate?.matchesView(self, goToMatch: match)
                            }
                            .padding(.horizontal, 24)
                    }
                    
                    if viewModel.isFetchingNextPage {
                        LazyVStack {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: CoreColor.primary.color))
                                .padding()
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .background(CoreColor.primaryBackground.color)
            .navigationBarTitle("Partidas")
            .showError(error, isPresented: $showErrorAlert)
            .refreshable(action: viewModel.retrieveMatches)
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
    
    private func handleViewState(_ viewState: MatchesViewState) {
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
    
    private func isLastMatch(_ match: Match) -> Bool {
        guard let lastMatch = viewModel.matches.last else {
            return false
        }
        return match.id == lastMatch.id
    }
    
    private func fetchNextPage() {
        Task {
            await viewModel.retrievePaginationMatches()
        }
    }
}
