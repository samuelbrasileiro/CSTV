//
//  Routable.swift
//  Core
//
//

import SwiftUI

public protocol Routable {
    associatedtype Route: RouteProtocol
    associatedtype V: View
    
    @ViewBuilder
    func getTransition(to route: Route) -> V
}
