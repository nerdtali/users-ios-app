//
//  GetUserListUseCase.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation

struct GetUserListUseCase {
    private let userRepository: UserRepositoryProtocol
    
    init(_ userRepository: UserRepositoryProtocol){
        self.userRepository = userRepository
    }
    
    func execute() async throws -> [User] {
        return try await userRepository.getUsers()
    }
}
