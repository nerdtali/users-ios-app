//
//  UserRepositoryProtocol.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUsers() async throws -> [User]
}
