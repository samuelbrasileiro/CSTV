//
//  CoreImage.swift
//  Core
//
//

import SwiftUI

public enum CoreColor {
    case primary
    case secondary
    case primaryBackground
    case secondaryBackground
    
    public var color: Color {
        return getColorAsset().swiftUIColor
    }
    
    public var uiColor: UIColor {
        return getColorAsset().color
    }
    
    private func getColorAsset() -> ColorAsset {
        switch self {
        case .primary: return Asset.primaryColor
        case .secondary: return Asset.secondaryColor
        case .primaryBackground: return Asset.primaryBackgroundColor
        case .secondaryBackground: return Asset.secondaryBackgroundColor
        }
    }
}
