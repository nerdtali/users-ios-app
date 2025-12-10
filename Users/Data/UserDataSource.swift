
//
//  UsersDataSource.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation

struct UserDataSource: UserDataSourceProtocol {
    
    func getAllUsers() async throws-> [User] {
        
        guard let url = URL(string: "http://localhost:8080/users") else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode([User].self, from: data)
        }catch{
            throw ServiceError.invalidData
        }
    }
    
    func getUser(id: UUID) async throws-> UserDetail {
        
        guard let url = URL(string: "http://localhost:8080/user/\(id)") else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(UserDetail.self, from: data)
        }catch{
            throw ServiceError.invalidData
        }
    }
}

enum ServiceError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
