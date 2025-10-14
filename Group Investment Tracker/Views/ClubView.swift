//
//  ClubView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import SwiftUI

struct ClubView: View {
    @Binding var club: Club
    @State private var createViewIsPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    HStack {
                        Text("Information")
                            .padding(.horizontal, 20)
                            .font(.title2)
                            .padding(.vertical, 10)
                        Spacer()
                    }
                    .fontWeight(.bold)
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Members")
                            Text("Total Investment")
                            Text("Total Interest")
                            Text("Total Owed")
                            Text("Amount In-Hand")
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 10) {
                            Text(club.totalMembers.description)
                            Text(club.totalInvestment.description)
                            Text(club.totalInterest.description)
                            Text(club.totalOwed.description)
                            Text(club.inHand.description)
                        }
                    }
                    .padding(.horizontal, 20)
                    VStack(alignment: .leading) {
                        Text("Members")
                            .font(.title2)
                            .fontWeight(.bold)
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                            ForEach($club.members) { $member in
                                NavigationLink {
                                    MemberView(member: $member)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 7).foregroundStyle(.gray.opacity(0.2))
                                        VStack(alignment: .leading) {
                                            Text(member.name)
                                                .font(.headline)
                                                .padding(.bottom, 5)
                                            HStack {
                                                Text("Interest")
                                                Spacer()
                                                Text(member.interestAccrued.description)
                                            }
                                            .font(.callout)
                                            HStack {
                                                Text("Owing")
                                                Spacer()
                                                Text(member.totalOwing.description)
                                            }
                                            .font(.callout)
                                        }
                                        .padding(20)
                                    }
                                    .frame(height: 100)
                                    .backgroundStyle(.gray.opacity(0.2))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .padding(20)
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
                                .foregroundStyle(.black)
                        }
                    }
                }
                if createViewIsPresented {
                    ZStack {
                        Color.clear
                        CreateNewView(itemToCreate: .member, clubs: .constant(nil), members: $club.members.optional(), isPresented: $createViewIsPresented)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
                            .padding()
                    }
                    .background(.ultraThinMaterial)
                }
            }
        }
        .navigationTitle(club.name)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ClubView(club: .constant(Club(name: "Res", members: [
        Member(name: "John", email: "john@gmail.com"),
        Member(name: "Emily", email: "emily@apple.com")
    ])))
}
