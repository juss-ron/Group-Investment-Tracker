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
    
    var totalMembers: Int = 0
    var totalInvestment: Int = 0
    var totalInterest: Int = 0
    var owed: Int = 0
    var totalOwed: Int = 0
    var inHand: Int = 0
}
