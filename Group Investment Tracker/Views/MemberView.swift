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
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(member.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(member.email)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.bottom, 40)
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Investment")
                            Text("Interest Accrued")
                            Text("Total Investment")
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 30) {
                            Text(String(member.investment))
                            Text(String(member.interestAccrued))
                            Text(String(member.totalInvestment))
                                .foregroundStyle(.green)
                        }
                    }
                    Divider()
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                    HStack {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Amount Owing")
                            Text("Interest Owing")
                            Text("Total Amount Owing")
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 30) {
                            Text(String(member.owing))
                            Text(String(member.interestOwing))
                            Text(String(member.totalOwing))
                                .foregroundStyle(.red)
                        }
                    }
                }
                .font(Font.system(size: 23))
                
                Spacer()
            }
            .padding(20)
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
