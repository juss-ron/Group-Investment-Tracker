//
//  AuthService.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 31/10/2025.
//

import Foundation
import SwiftUI

class AuthService {
    private let baseURL = URL(string: "http://localhost:3000/auth")!
    
    // Create a new user
    func createUser(_ user: User) async throws -> Response {
        let url = baseURL.appendingPathComponent("register")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(user)
        
        // Get data and response
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Validate status code
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        }
        
        let result = try JSONDecoder().decode(Response.self, from: data)
        return result
    }
    
    // Verify that a user exists
    func verifyUser(_ user: User) async throws -> Response {
        let url = baseURL.appendingPathComponent("login")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(user)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        }
        
        let result = try JSONDecoder().decode(Response.self, from: data)
        return result
    }
}
