//
//  Member.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 13/10/2025.
//

import Foundation

/// This is for each individual member within a club
struct Member {
    var name: String
    var email: String
    
    var investment: Int = 0
    var interestAccrued: Int = 0
    var totalInvestment: Int { investment + interestAccrued }
    
    var owing: Int = 0
    var interestOwing: Int = 0
    var totalOwing: Int { owing + interestOwing }
    
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
        interestAccrued += amount
    }
    
    ///Reduces amount a user owes
    mutating func reduceLoan(by amount: Int) {
        owing -= amount
    }
    
    ///Increases the amount a user owes
    mutating func loan(_ amount: Int) {
        owing += amount
    }
}
