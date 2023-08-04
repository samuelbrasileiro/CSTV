//
//  DependencyKey.swift
//  DependencyInjection
//
//

import Foundation

struct DependencyKey {
    let key: String
    let parameters: String?
}

extension DependencyKey: Hashable {
    static func == (lhs: DependencyKey, rhs: DependencyKey) -> Bool {
        lhs.key == rhs.key && lhs.parameters == rhs.parameters
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
        hasher.combine(parameters)
    }
}
