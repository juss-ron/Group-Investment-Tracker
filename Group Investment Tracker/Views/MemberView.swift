//
//  MemberView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import SwiftUI

struct MemberView: View {
    @State private var createViewIsPresented: Bool = false
    @Binding var member: Member
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
                                .foregroundStyle(.black)
                            Image(systemName: "chevron.left.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.white)
                                .shadow(radius: 2)
                        }
                    }
                    
                    Image("ProfilePic")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                        .padding(.leading, 5)
                    
                    VStack(alignment: .leading) {
                        Text(member.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(member.email)
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
                                Text(member.investment.description)
                                    .font(Font.title2.bold())
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                            VStack {
                                Text("Interest")
                                    .padding(.bottom, 2)
                                Text(member.interestAccrued.description)
                                    .font(Font.title2.bold())
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                        }
                        
                        HStack {
                            Text("Total")
                                .font(Font.title)
                                .padding(10)
                            Spacer()
                            Text(member.totalInvestment.description)
                                .font(Font.title2.bold())
                                .padding(10)
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                        .padding(.bottom, 10)
                        
                        HStack(spacing: 20) {
                            VStack {
                                Text("Owed")
                                    .padding(.bottom, 2)
                                Text(member.owing.description)
                                    .font(Font.title2.bold())
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                            VStack {
                                Text("In-Hand")
                                    .padding(.bottom, 2)
                                Text(member.interestOwing.description)
                                    .font(Font.title2.bold())
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, 10)
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                        }
                        
                        HStack {
                            Text("Total")
                                .font(Font.title)
                                .padding(10)
                            Spacer()
                            Text(member.totalOwing.description)
                                .font(Font.title2.bold())
                                .padding(10)
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1))
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom)
                }
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
                Spacer()
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
                    TransactionView(isPresented: $createViewIsPresented, member: $member)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
                        .padding()
                }
                .background(.ultraThinMaterial)
            }
        }
    }
}

#Preview {
    MemberView(member: .constant(Member(name: "Ron", email: "ron@example.com")))
}
