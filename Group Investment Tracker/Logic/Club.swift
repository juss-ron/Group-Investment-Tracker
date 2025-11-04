//
//  Club.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import Foundation

struct Club: Codable, Identifiable {
    var id: String = ""
    var title: String
    var members: [Member] = []
    
    var totalMembers: Int { members.count }
    var totalInvestment: Int { members.reduce(0) { $0 + $1.investment } }
    var totalInterest: Int {members.reduce(0) { $0 + $1.interestAccrued} }
    var owed: Int { members.reduce(0) { $0 + $1.owing} }
    var totalOwed: Int { members.reduce(0) { $0 + $1.totalOwing} }
    var inHand: Int { totalInvestment + totalInterest - owed }
}
