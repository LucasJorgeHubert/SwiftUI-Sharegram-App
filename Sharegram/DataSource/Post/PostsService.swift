//
//  PstsService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Firebase
import Foundation

protocol PostClientProtocol {
    func fetchFeedPosts() async throws -> [Post]
    func fetchUserPosts(uid: String) async throws -> [Post]
}

class PostClient: PostClientProtocol {
    let userClient: UserClientProtocol = UserClient()
    let dispatcher = APIDispatcher()
    
    func fetchFeedPosts() async throws -> [Post]{
        var posts: [Post] = try await dispatcher.getListObject(apiRouter: .getAllPosts)
        
        // Asign user to post
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await userClient.getUser(byId: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    func fetchUserPosts(uid: String) async throws -> [Post] {
        let response: [Post] = try await dispatcher.getListObjectWithParameter(apiRouter: .getPostByUser(userId: uid))
        return response
    }
}
