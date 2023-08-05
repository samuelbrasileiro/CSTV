//
//  CoreFont.swift
//  Core
//
//

import SwiftUI

public enum CoreFont {
    case roboto
    
    public func regular(size: CGFloat) -> UIFont {
        switch self {
        case .roboto: return FontFamily.Roboto.regular.font(size: size)
        }
    }
    
    public func bold(size: CGFloat) -> UIFont {
        switch self {
        case .roboto: return FontFamily.Roboto.bold.font(size: size)
        }
    }
    
    public func medium(size: CGFloat) -> UIFont {
        switch self {
        case .roboto: return FontFamily.Roboto.medium.font(size: size)
        }
    }
}
