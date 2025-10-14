//
//  Entity.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 14/10/2025.
//

import SwiftUI

extension Binding {
    /// Converts a non-optional binding to an optional binding.
    func optional() -> Binding<Value?> {
        return Binding<Value?>(
            get: { self.wrappedValue },
            set: { self.wrappedValue = $0! } // Force unwrap is acceptable here
        )                                    // since we're setting a non-optional from an optional.
    }
}
