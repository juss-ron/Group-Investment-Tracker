//
//  ClubView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import SwiftUI

struct ClubView: View {
    @Binding var club: Club
    
    var body: some View {
        VStack {
            Text(club.name)
        }
    }
}

#Preview {
    ClubView(club: .constant(Club(name: "Res")))
}
