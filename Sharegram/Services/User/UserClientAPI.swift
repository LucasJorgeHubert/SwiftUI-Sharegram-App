//
//  UserClientAPI.swift
//  Sharegram
//
//  Created by Lucas Hubert on 19/01/24.
//

import Foundation

protocol UserClientProtocol {
    func getUser(byId id: String) async throws -> User
    func getAllUsers() async throws -> [User]
}

class UserClient: UserClientProtocol {
    let dispatcher = APIDispatcher()
    
    func getUser(byId id: String) async throws -> User {
        let request: User = try await dispatcher.getObjectWithParam(apiRouter: .getUserById(userId: id))
        return request
    }
    
    func getAllUsers() async throws -> [User] {
        let request: [User] = try await dispatcher.getListObject(apiRouter: .getAllUser)
        return request
    }
    
    func updateUserProfile(updatedUser: User) async throws {
        try await dispatcher.updateObject(apiRouter: .updateUser(updatedUser: updatedUser))
    }
}