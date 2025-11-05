//
//  TransactionView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 14/10/2025.
//

import SwiftUI

struct TransactionView: View {
    @Binding var isPresented: Bool
    @Binding var member: Member
    @State private var investment: Int?
    @State private var interest: Int?
    @State private var debt: Int?
    @State private var loan: Int?
    
    var body: some View{
        VStack(spacing: 20) {
            Text(member.username)
                .font(Font.largeTitle)
            HStack {
                Text("Pay Investment: ")
                TextField("0", value: $investment, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Pay Interest:       ")
                TextField("0", value: $interest, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Pay Debt:           ")
                TextField("0", value: $debt, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Take Loan:         ")
                TextField("0", value: $loan, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Spacer()
                Button {
                    cancel()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1)
                        Text("Cancel")
                    }
                }
                Button {
                    newTransaction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).stroke(.accent, lineWidth: 1)
                        Text("Create")
                    }
                }
            }
            .padding(.leading, 40)
            .frame(height: 50)
        }
        .padding(20)
    }
}


extension TransactionView {
    func cancel() {
        isPresented.toggle()
    }
    
    func newTransaction() {
        member.payInvestment(investment ?? 0)
        member.payInterest(interest ?? 0)
        member.reduceLoan(by: debt ?? 0)
        member.loan(loan ?? 0)
        isPresented.toggle()
    }
}

#Preview {
    TransactionView(isPresented: .constant(true), member: .constant(Member(username: "Jack Sparrow", email: "sparrow@gmail.com")))
}


