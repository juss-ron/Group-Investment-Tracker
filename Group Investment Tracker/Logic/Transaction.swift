//
//  Transaction.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 5/11/2025.
//

struct Transaction: Codable, Identifiable {
    var id: String = ""
    var investAmount: Int?
    var interestAmount: Int?
    var payLoanAmount: Int?
    var loanAmount: Int?
}
