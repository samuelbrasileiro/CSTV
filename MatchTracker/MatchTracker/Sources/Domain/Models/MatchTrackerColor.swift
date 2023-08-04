//
//  MatchTrackerColor.swift
//  MatchTracker
//
//

import SwiftUI

public enum MatchTrackerColor {
    case online
    case offline
    
    public var color: Color {
        return getColorAsset().swiftUIColor
    }
    
    public var uiColor: UIColor {
        return getColorAsset().color
    }
    
    private func getColorAsset() -> ColorAsset {
        switch self {
        case .online: return Asset.onlineColor
        case .offline: return Asset.offlineColor
        }
    }
}
