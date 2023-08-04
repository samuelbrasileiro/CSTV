//
//  RouteProtocol.swift
//  Core
//
//

import Foundation

public enum NavigationTranisitionStyle {
    case push
    case presentModally
    case presentFullscreen
}

public enum NavigationBarStyle {
    case automatic
    case normal
    case large
}

public protocol RouteProtocol {
    var id: String { get }
    
    var transitionStyle: NavigationTranisitionStyle { get }
    
    var barStyle: NavigationBarStyle { get }
}

public extension RouteProtocol {
    var id: String {
        String(describing: self)
    }
    
    var transitionStyle: NavigationTranisitionStyle {
        return .push
    }
    
    var barStyle: NavigationBarStyle {
        return .normal
    }
}
