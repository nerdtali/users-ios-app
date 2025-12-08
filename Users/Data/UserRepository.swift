//
//  UserRepository.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation

struct UserRepository: UserRepositoryProtocol {
    
    static let shared = UserRepository()
    
    private let userDataSource: UserDataSourceProtocol
    
    init(userDataSource: UserDataSourceProtocol = UserDataSource()){
        self.userDataSource = userDataSource
    }
    
    func getUsers() async throws -> [User] {
        return try await userDataSource.getAllUsers()
    }
}
