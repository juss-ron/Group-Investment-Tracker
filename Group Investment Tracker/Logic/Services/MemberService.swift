//
//  MemberService.swift
//  Group Investment Tracker
//
//  Created by Ron Harifiyati on 31/10/2025.
//

import Foundation
import SwiftUI

class MemberService {
    private let baseURL = URL(string: "http://localhost:3000/members")!
    @AppStorage("token") var token = ""
    
    // Fetch all members
    func fetchMembers(in club: Club) async throws -> [Member] {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(club.id, forHTTPHeaderField: "ClubId")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? "No response body"
            print("❌ Fetch failed — status: \(httpResponse.statusCode), body: \(body)")
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Member].self, from: data)
    }
    
    // Fetch one member
    func fetch(member: Member, from club: Club) async throws -> Member {
        let url = baseURL.appendingPathComponent(member.id)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(club.id, forHTTPHeaderField: "ClubId")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if !(200...299).contains(httpResponse.statusCode) {
            let body = String(data: data, encoding: .utf8) ?? "No response body"
            print("❌ Fetch failed — status: \(httpResponse.statusCode), body: \(body)")
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(Member.self, from: data)
    }
    
    // Create a new member
    func add(_ member: Member, to club: Club) async throws -> Response {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(club.id, forHTTPHeaderField: "ClubId")
        request.httpBody = try JSONEncoder().encode(member)
        
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
    
    // Update a member
    func make(_ transaction: Transaction, for member: Member, in club: Club) async throws -> Response {
        let url = baseURL.appendingPathComponent(member.id)
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(club.id, forHTTPHeaderField: "ClubId")
        request.httpBody = try JSONEncoder().encode(transaction)
        
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
    
    // Delete a member
    func remove(_ member: Member, from club: Club) async throws -> Response {
        let url = baseURL.appendingPathComponent(club.id)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(club.id, forHTTPHeaderField: "ClubId")
        
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
