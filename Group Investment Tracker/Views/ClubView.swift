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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack(spacing: 10) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.accent)
                                Image(systemName: "chevron.left.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(Color(.systemGray4))
                                    .shadow(radius: 2)
                            }
                        }
                        
                        Image("GroupProfilePic")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                            .padding(.leading, 5)
                        
                        VStack(alignment: .leading) {
                            Text(club.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(club.members.count.description + " Members")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "message")
                                .resizable()
                                .frame(width: 30, height: 25)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    
                    ScrollView {
                        //Details about the group
                        VStack {
                            HStack {
                                Text("Information")
                                    .padding(.horizontal, 20)
                                    .font(.title2)
                                    .padding(.vertical, 10)
                                
                                Spacer()
                            }
                            .fontWeight(.bold)
                            
                            VStack(spacing: 20) {
                                HStack(spacing: 20) {
                                    VStack {
                                        Text("Investment")
                                            .padding(.bottom, 2)
                                        Text(club.totalInvestment.description)
                                            .font(Font.title2.bold())
                                    }
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                                    VStack {
                                        Text("Interest")
                                            .padding(.bottom, 2)
                                        Text(club.totalInterest.description)
                                            .font(Font.title2.bold())
                                    }
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                                }
                                HStack(spacing: 20) {
                                    VStack {
                                        Text("Owed")
                                            .padding(.bottom, 2)
                                        Text(club.totalOwed.description)
                                            .font(Font.title2.bold())
                                    }
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                                    VStack {
                                        Text("In-Hand")
                                            .padding(.bottom, 2)
                                        Text(club.inHand.description)
                                            .font(Font.title2.bold())
                                    }
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 10)
                                    .frame(maxWidth: .infinity)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                                }
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom)
                        }
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                        
                        //List of members in the group
                        VStack {
                            HStack {
                                Text("Members")
                                    .padding(.horizontal, 20)
                                    .font(.title2)
                                    .padding(.vertical, 10)
                                
                                Spacer()
                            }
                            .fontWeight(.bold)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                                ForEach($club.members) { $member in
                                    NavigationLink {
                                        MemberView(member: $member)
                                    } label: {
                                        VStack(alignment: .leading) {
                                            Text(member.name)
                                                .font(Font.title2.bold())
                                                .padding(.bottom, 5)
                                            
                                            VStack {
                                                HStack {
                                                    Text("Interest")
                                                    Spacer()
                                                    Text(member.interestAccrued.description)
                                                }
                                                HStack {
                                                    Text("Owing")
                                                    Spacer()
                                                    Text(member.totalOwing.description)
                                                }
                                            }
                                            .font(.callout)
                                            .padding(.horizontal, 5)
                                        }
                                        .padding(.vertical, 20)
                                        .padding(.horizontal, 10)
                                        .frame(maxWidth: .infinity)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom)
                        }
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                    }
                }
                
                
                newMemberButton
                
                
                if createViewIsPresented {
                    addMemberView
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//Assistant views
extension ClubView {
    var newMemberButton: some View {
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
    
    var addMemberView: some View {
        ZStack {
            Color.clear
            CreateNewView(itemToCreate: .member, clubs: .constant(nil), members: $club.members.optional(), isPresented: $createViewIsPresented)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.accentColor, lineWidth: 2))
                .padding()
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    ClubView(club: .constant(Club(name: "Res", members: [
        Member(name: "John", email: "john@gmail.com"),
        Member(name: "Emily", email: "emily@apple.com")
    ])))
}
