//
//  User.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 17/10/2025.
//

import Foundation

// Handles authentication
struct User: Codable {
    var id: UUID = UUID()
    var username: String
    var email: String
    var password: String
}
