//
//  UserDetailViewModel.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 09-12-25.
//

import Foundation

@Observable
final class UserDetailViewModel {
    
    private let getUserUseCase: GetUserDetailUseCase
    
    var userDetail: UserDetail?
    
    init(getUserUseCase: GetUserDetailUseCase = GetUserDetailUseCase(UserRepository.shared)) {
        self.getUserUseCase = getUserUseCase
    }
    
    func fetchUserDetail(id: UUID) async throws {
        do {
            userDetail = try await getUserUseCase.execute(id: id)
            do {
                let data = try JSONEncoder().encode(userDetail)
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response UserDetailViewModel:")
                    print(jsonString)   
                }
            } catch {
                print("Failed to encode users to JSON for logging: \(error)")
            }
        } catch {
            print(error)
        }
    }
    
}
