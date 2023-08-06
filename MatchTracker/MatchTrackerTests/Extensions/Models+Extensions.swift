//
//  Models+Extensions.swift
//  MatchTrackerTests
//
//

import Foundation
@testable import MatchTracker

extension Player: Equatable {
    public static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
}

extension Match: Equatable {
    public static func == (lhs: Match, rhs: Match) -> Bool {
        lhs.id == rhs.id
    }
}

extension MatchDetailsViewState: Equatable {
    public static func ==(lhs: MatchDetailsViewState, rhs: MatchDetailsViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case let (.error(error1), .error(error2)):
            return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
}

extension MatchesViewState: Equatable {
    public static func ==(lhs: MatchesViewState, rhs: MatchesViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case let (.error(error1), .error(error2)):
            return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
}
