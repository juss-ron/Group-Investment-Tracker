//
//  Validator.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 3/11/2025.
//

import Foundation
import SwiftUI

// Checks if email is valid and if password meets standards
struct Validator {
    static func isPasswordValid(_ password: String) -> Bool {
        // At least one letter, one number, one special character, and 8+ characters long
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
    }
    
    static func isEmailValid(_ email: String) -> Bool {
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)
    }
}
