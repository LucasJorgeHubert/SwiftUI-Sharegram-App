//
//  UserClientAPI.swift
//  Sharegram
//
//  Created by Lucas Hubert on 19/01/24.
//

import Foundation

extension DataSource.User {
    
    public struct RepositoryImpl: UserRepositoryProtocol {
        let dispatcher: APIDispatcherProtocol
        
        init(dispatcher: APIDispatcherProtocol = DataSource.APIDispatcher()) {
            self.dispatcher = dispatcher
        }
        
        func getUser(byId id: String) async throws -> Domain.User.Model.User {
            return try await dispatcher.getObjectWithParam(apiRouter: DataSource.User.APIRouter.getUserById(userId: id))
        }
        
        func getAllUsers() async throws -> [Domain.User.Model.User] {
            return try await dispatcher.getListObject(apiRouter: DataSource.User.APIRouter.getAllUser)
        }
        
        func updateUserProfile(updatedUser: Domain.User.Model.User) async throws {
            try await dispatcher.updateObject(apiRouter: DataSource.User.APIRouter.updateUser(updatedUser: updatedUser))
        }
    }
}
