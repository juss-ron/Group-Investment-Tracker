//
//  Member.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import Foundation

/// This is for each individual member within a club
struct Member: Codable, Identifiable {
    var id: String = ""
    var username: String
    var email: String
    
    var investment: Int = 0
    var interestAcrued: Int = 0
    var totalInvestment: Int = 0
    
    var owing: Int = 0
    var interestOwing: Int = 0
    var totalOwing: Int = 0
}
