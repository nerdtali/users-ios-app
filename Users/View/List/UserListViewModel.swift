//
//  UserListViewModel.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation

@Observable
final class UserListViewModel {
    private let getUserListUseCase: GetUserListUseCase
    
    var userList: [User] = []
    
    init(getUserListUseCase: GetUserListUseCase =  GetUserListUseCase(UserRepository.shared)) {
        self.getUserListUseCase = getUserListUseCase
    }
    
    func fetchUserList() async throws{
        do {
            userList = try await getUserListUseCase.execute()
            
          /*  do {
                let data = try JSONEncoder().encode(userList)
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response UserListViewModel:")
                    print(jsonString)
                }
            } catch {
                print("Failed to encode users to JSON for logging: \(error)")
            }*/
        }catch{
            print(error)
        }
    }
}
