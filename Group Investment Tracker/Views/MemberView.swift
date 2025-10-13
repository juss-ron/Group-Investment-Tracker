//
//  MemberView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import SwiftUI

struct MemberView: View {
    @Binding var member: Member
    
    var body: some View {
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
                        Text(String(member.investment))
                        Text(String(member.interestAccrued))
                        Text(String(member.totalInvestment))
                            .foregroundStyle(.red)
                    }
                }
            }
            .font(Font.system(size: 23))
        }
        .padding(20)
        Spacer()
    }
}

#Preview {
    MemberView(member: .constant(Member(name: "Ron", email: "ron@example.com")))
}
