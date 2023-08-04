//
//  CoreFont.swift
//  Core
//
//

import SwiftUI

public enum CoreFont {
    case roboto
    
    public func regular(size: CGFloat) -> SwiftUI.Font {
        switch self {
        case .roboto: return FontFamily.Roboto.regular.swiftUIFont(size: size)
        }
    }
    
    public func bold(size: CGFloat) -> SwiftUI.Font {
        switch self {
        case .roboto: return FontFamily.Roboto.bold.swiftUIFont(size: size)
        }
    }
}
