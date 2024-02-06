//
//  User.swift
//  Sharegram
//
//  Created by Lucas Hubert on 24/07/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, ModelProtocol {
    var id: String
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
    var currentUser: User? {
        guard let currentUid = Auth.auth().currentUser?.uid else { return nil }
        if currentUid == id {
            return self
        } else {
            return nil
        }
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: NSUUID().uuidString,
            username: "dwight.",
            profileImageURL: nil,
            fullname: "Dwight Schrute",
            bio: "It's your birthday",
            email: "dwight.schrute@office.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "michaelscott",
            profileImageURL: nil,
            fullname: "Michael Scott",
            bio: "World’s best boss",
            email: "m.scott@office.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "pam_pam",
            profileImageURL: nil,
            bio: "",
            email: "beesly.pam@office.com"
        ),
    ]
}
