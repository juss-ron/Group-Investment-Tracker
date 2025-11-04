//
//  ClubService.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 31/10/2025.
//

import Foundation
import SwiftUI

class ClubService {
    private let baseURL = URL(string: "http://localhost:3000/clubs")!
    @AppStorage("token") var token = ""
    
    // Fetch all clubs
    func fetchClubs() async throws -> [Club] {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        print("📦 Raw response:", String(data: data, encoding: .utf8) ?? "nil")
        
        return try JSONDecoder().decode([Club].self, from: data)
    }
    
    // Create a new club
    func createClub(_ club: Club) async throws -> Response {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(club)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
    // Update a todo
    func updateTodo(_ club: Club) async throws -> Response {
        let url = baseURL.appendingPathComponent("/todos/\(club.id)")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(club)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
//    // Delete a todo
//    func deleteTodo(id: Int) async throws {
//        let url = baseURL.appendingPathComponent("/todos/\(id)")
//        var request = URLRequest(url: url)
//        request.httpMethod = "DELETE"
//        _ = try await URLSession.shared.data(for: request)
//    }
}
