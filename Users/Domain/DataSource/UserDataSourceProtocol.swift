//
//  DataSourceProtocol.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation


protocol UserDataSourceProtocol {
    func getAllUsers() async throws -> [User]
    func getUser(id: UUID) async throws -> UserDetail
}
