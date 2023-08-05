//
//  View+showError.swift
//  Core
//
//

import Service
import SwiftUI

public extension View {
    @ViewBuilder
    func showError(_ error: Error? = nil, isPresented: Binding<Bool>) -> some View {
        if let error {
            let serviceError = ServiceError.map(error)
            self.alert(isPresented: isPresented) {
                Alert(
                    title: Text(serviceError.errorDescription ?? ""),
                    message: serviceError.failureReason.map { Text($0) },
                    dismissButton: .default(Text("OK"))
                )
            }
        } else {
            self
        }
    }
}
