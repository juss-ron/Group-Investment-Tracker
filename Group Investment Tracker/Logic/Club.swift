//
//  Club.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import Foundation

struct Club: Identifiable {
    var id: UUID = UUID()
    var name: String
    var members: [Member] = []
    
    var totalMembers: Int { members.count }
    var totalInvestment: Int { members.reduce(0) { $0 + $1.investment } }
    var totalInterest: Int {members.reduce(0) { $0 + $1.interestAccrued} }
    var totalOwed: Int { members.reduce(0) { $0 + $1.totalOwing} }
}
