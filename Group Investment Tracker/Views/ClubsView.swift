//
//  ClubsView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import SwiftUI

struct ClubsView: View {
    @State private var clubs: [Club] = [
        Club(name: "MCRI", members: [Member(name: "Jane", email: "jane@gmail.com")]),
        Club(name: "Res", members: [
            Member(name: "John", email: "john@gmail.com"),
            Member(name: "Emily", email: "emily@apple.com")
        ])
    ]
    @State private var createViewIsPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Clubs")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                    
                    ScrollView {
                        ForEach($clubs) { $club in
                            NavigationLink {
                                ClubView(club: $club)
                            } label: {
                                HStack {
                                    Text(club.name)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 20)
                                    Spacer()
                                    Text(club.inHand.description)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 20)
                                }
                                .background(.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                            }
                            .buttonStyle(.plain)
                            
                        }
                    }
                }
                VStack() {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            createViewIsPresented.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(20)
                        }
                    }
                }
                if createViewIsPresented {
                    ZStack {
                        Color.clear
                        CreateNewView(itemToCreate: .club, clubs: $clubs.optional(), members: .constant(nil), isPresented: $createViewIsPresented)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
                            .padding()
                    }
                    .background(.ultraThinMaterial)
                }
            }
        }
    }
}

#Preview {
    ClubsView()
}


