//
//  UserDeleteViewModel.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 26-12-25.
//

import Foundation

@Observable
final class UserDeleteViewModel {
    private let deleteUserUseCase: DeleteUserUseCase
    
    init(deleteUserUseCase: DeleteUserUseCase = DeleteUserUseCase(UserRepository.shared)) {
        self.deleteUserUseCase = deleteUserUseCase
    }
    
    func fetchUserdelete(userId: UUID) async throws {
        do {
            try await deleteUserUseCase.execute(userId: userId)
        } catch {
            print(error)
        }
    }
}
