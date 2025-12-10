//
//  GetUserDetailUseCase.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 09-12-25.
//

import Foundation

struct GetUserDetailUseCase {
    
    private let userRepository: UserRepositoryProtocol
    
    init(_ userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func execute(id: UUID) async throws -> UserDetail {
        return try await userRepository.getUserById(id: id)
        
    }
}
