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
                    HStack {
                        Text("Clubs")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Group {
                            Button {
                                
                            } label: {
                                Image(systemName: "message")
                                    .resizable()
                                    .frame(width: 30, height: 25)
                            }
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 27, height: 25)
                                    .padding(.horizontal, 20)
                            }
                        }
                        .foregroundStyle(.accent)
                    }
                    .padding(.bottom)
                    .background(Color(.systemGray6))
                    
                    ScrollView {
                        ForEach($clubs) { $club in
                            NavigationLink {
                                ClubView(club: $club)
                            } label: {
                                HStack {
                                    Image("GroupProfilePic")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .shadow(radius: 5)
                                        .padding()
                                    
                                    Text(club.name)
                                    
                                    Spacer()
                                    
                                    Text(club.inHand.description)
                                        .padding()
                                }
                                .background(Color(.systemGray6))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent))
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                
                addbuttonView
                
                if createViewIsPresented {
                    createNewClub
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

//Assistant Views
extension ClubsView {
    var addbuttonView: some View {
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
                        .foregroundStyle(.accent)
                }
            }
        }
    }
    
    var createNewClub: some View {
        ZStack {
            Color.clear
            
            CreateNewView(itemToCreate: .club, clubs: $clubs.optional(), members: .constant(nil), isPresented: $createViewIsPresented)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.accentColor, lineWidth: 2))
                .padding()
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    ClubsView()
}


