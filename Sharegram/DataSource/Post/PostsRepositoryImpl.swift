//
//  PstsService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Firebase
import Foundation

extension DataSource.Post {
    
    struct RepositoryImpl: PostRepositoryProtocol {
        let dispatcher: APIDispatcherProtocol
        
        private let user: User
        
        init(
            dispatcher: APIDispatcherProtocol = DataSource.APIDispatcher(),
            user: User
        ) {
            self.dispatcher = dispatcher
            self.user = user
        }
        
        func fetchFeedPosts() async throws -> [Domain.Post.Model.Post]{
            return try await dispatcher.getListObject(apiRouter: DataSource.Post.APIRouter.getAllPosts)
        }
        
        func fetchUserPosts(uid: String) async throws -> [Domain.Post.Model.Post] {
            return try await dispatcher.getListObjectWithParameter(apiRouter: DataSource.Post.APIRouter.getPostByUser(userId: uid))
        }
    }
    
}
