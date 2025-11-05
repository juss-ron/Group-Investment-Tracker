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
    
    ///Adds to the investment the member has made
    mutating func payInvestment(_ amount: Int) {
        investment += amount
    }
    
    ///Pays interest, reducing amount of interest owed and increasing interest accrued
    mutating func payInterest(_ amount: Int) {
        if interestOwing > 0 {
            if amount < interestOwing {
                interestOwing -= amount
            } else {
                interestOwing = 0
            }
        }
        interestAcrued += amount
    }
    
    ///Reduces amount a user owes
    mutating func reduceLoan(by amount: Int) {
        owing -= amount
    }
    
    ///Increases the amount a user owes
    mutating func loan(_ amount: Int) {
        owing += amount
        interestOwing += amount / 10
    }
}
