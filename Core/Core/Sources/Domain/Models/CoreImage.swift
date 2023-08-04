//
//  CoreImage.swift
//  Core
//
//

import SwiftUI

public enum CoreImage {
    case unavailableImage
    
    public var image: Image {
        getImageAsset().swiftUIImage
    }
    
    private func getImageAsset() -> ImageAsset {
        switch self {
        case .unavailableImage: return Asset.unavailableImage
        }
    }
}
