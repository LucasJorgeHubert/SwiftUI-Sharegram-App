//
//  UserService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        let snap = try await Firestore.firestore().collection("users").getDocuments()
        return snap.documents.compactMap { try? $0.data(as: User.self) }
    }
}
