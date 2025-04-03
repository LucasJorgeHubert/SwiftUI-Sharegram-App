//
//  UserClientAPI.swift
//  Sharegram
//
//  Created by Lucas Hubert on 19/01/24.
//

import Foundation

extension DataSource.User {
    
    class RepositoryImpl: UserRepositoryProtocol {
        let dispatcher = DataSource.APIDispatcher()
        
        func getUser(byId id: String) async throws -> Domain.User.Model.User {
            return try await dispatcher.getObjectWithParam(apiRouter: APIRouter.getUserById(userId: id))
        }
        
        func getAllUsers() async throws -> [Domain.User.Model.User] {
            return try await dispatcher.getListObject(apiRouter: APIRouter.getAllUser)
        }
        
        func updateUserProfile(updatedUser: Domain.User.Model.User) async throws {
            try await dispatcher.updateObject(apiRouter: APIRouter.updateUser(updatedUser: updatedUser))
        }
    }
}
