//
//  User.swift
//  Users
//
//  Created by Neftalí Madariaga Castro on 08-12-25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    let firstName: String
    let avatarURL: URL?
    let status: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case avatarURL = "avatar_url"
        case status
    }
}
