//
//  TransactionView.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 14/10/2025.
//

import SwiftUI

struct TransactionView: View {
    @Binding var isPresented: Bool
    var member: Member = Member(username: "", email: "")
    @State private var transaction: Transaction = Transaction()
    let service = MemberService()
    var club: Club = Club(title: "")
    
    var body: some View{
        VStack(spacing: 20) {
            Text(member.username)
                .font(Font.largeTitle)
            HStack {
                Text("Pay Investment: ")
                TextField("0", value: $transaction.investAmount, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Pay Interest:       ")
                TextField("0", value: $transaction.interestAmount, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Pay Debt:           ")
                TextField("0", value: $transaction.payLoanAmount, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            HStack {
                Text("Take Loan:         ")
                TextField("0", value: $transaction.loanAmount, formatter: NumberFormatter())
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

//Logic
extension TransactionView {
    func cancel() {
        isPresented.toggle()
    }
    
    func newTransaction() {
        Task {
            do {
                let response = try await service.make(transaction, for: member, in: club)
                print(response)
                isPresented.toggle()
            } catch {
                print("Failed to create transaction: \(error)")
            }
        }
    }
}

#Preview {
    TransactionView(isPresented: .constant(true))
}


