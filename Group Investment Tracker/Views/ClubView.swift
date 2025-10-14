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
        NavigationStack {
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
