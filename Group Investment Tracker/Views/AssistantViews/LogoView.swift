//
//  LogoView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("Logo")
            .resizable()
            .frame(width: 150, height: 175)
            .padding(.bottom, 30)
    }
}

#Preview {
    LogoView()
}
