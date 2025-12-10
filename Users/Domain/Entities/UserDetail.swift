//
//  UserDetail.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 09-12-25.
//

import Foundation

struct UserDetail: Identifiable, Codable {
    let id: UUID
    let username: String
    let email: String
    let status: String
    let firstName: String
    let lastName: String
    let nickname: String
    let gender: String
    let birthDate: String
    let avatarURL: URL?
    

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case status
        case firstName = "first_name"
        case lastName = "last_name"
        case nickname
        case gender
        case birthDate = "birth_date"
        case avatarURL = "avatar_url"
        
    }
}
