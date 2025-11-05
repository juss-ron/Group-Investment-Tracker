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
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? "No response body"
            print("❌ Fetch failed — status: \(httpResponse.statusCode), body: \(body)")
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Club].self, from: data)
    }
    
    // Create a new club
    func create(_ club: Club) async throws -> Response {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(club)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? "No response body"
            print("❌ Creation failed — status: \(httpResponse.statusCode), body: \(body)")
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
    // Update a club
    func update(_ club: Club) async throws -> Response {
        let url = baseURL.appendingPathComponent("\(club.id)")
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(club)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? "No response body"
            print("❌ Update failed — status: \(httpResponse.statusCode), body: \(body)")
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Response.self, from: data)
    }
    
    // Delete a club
    func delete(_ club: Club) async throws -> Response {
        let url = baseURL.appendingPathComponent(club.id)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? "No response body"
            print("❌ Delete failed — status: \(httpResponse.statusCode), body: \(body)")
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(Response.self, from: data)
    }
}
