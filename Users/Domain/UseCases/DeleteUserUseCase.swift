//
//  DeleteUserUseCase.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 26-12-25.
//

import Foundation

struct DeleteUserUseCase {
    
    private let userRepository: UserRepositoryProtocol
    
    init(_ userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func execute(userId: UUID) async throws {
        try await userRepository.deleteUserById(userId: userId)
    }
}
