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
        
        init(
            dispatcher: APIDispatcherProtocol = DataSource.APIDispatcher()
        ) {
            self.dispatcher = dispatcher
        }
        
        func fetchFeedPosts() async throws -> [Domain.Post.Model.Post]{
            return try await dispatcher.getListObject(apiRouter: DataSource.Post.APIRouter.getAllPosts)
        }
        
        func fetchUserPosts(uid: String) async throws -> [Domain.Post.Model.Post] {
            return try await dispatcher.getListObjectWithParameter(apiRouter: DataSource.Post.APIRouter.getPostByUser(userId: uid))
        }
        
        func postPostLike(postId: String, uid: String) async throws {
            try await dispatcher.updateObject(apiRouter: DataSource.Post.APIRouter.postLike(postId: postId, uid: uid))
        }
    }
    
}
