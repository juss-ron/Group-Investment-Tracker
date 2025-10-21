//
//  Theme.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 21/10/2025.
//

import SwiftUI

enum Theme: String, Identifiable, CaseIterable {
    var id: String { self.rawValue }
    case light = "Light", dark = "Dark", system = "System"
    
    var color: any View {
        switch self {
        case .light:
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
        case .dark:
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.black)
        case .system:
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
            }
        }
    }
}

var themes: [Theme] = [.dark, .light, .system]

enum AccentColors: CaseIterable {
    case cyan, orange, purple
}
