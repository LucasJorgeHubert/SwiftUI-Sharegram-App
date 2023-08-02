//
//  User.swift
//  Sharegram
//
//  Created by Lucas Hubert on 24/07/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: NSUUID().uuidString,
            username: "michaelross",
            profileImageURL: "userImage",
            fullname: "Michael Ross",
            bio: "A super smart lawyer from Suits Series",
            email: "michaelross@mail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "harveyspecter",
            profileImageURL: "userImage",
            fullname: "Harvey Specter",
            bio: "The master negotiator from Suits Series",
            email: "harveyspecter@mail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "donnapaulsen",
            profileImageURL: "userImage",
            fullname: "Donna Paulsen",
            bio: "The wonderfull secretary from Suits Series",
            email: "donnapaulsen@mail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "louislitt",
            profileImageURL: "userImage",
            fullname: "Louis Litt",
            bio: "A singular lawyer from Suits Series",
            email: "louislitt@mail.com"
        )
    ]
}
