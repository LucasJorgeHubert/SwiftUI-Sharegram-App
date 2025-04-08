//
//  PostRepositoryProtocol.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/04/25.
//

import Foundation

public protocol PostRepositoryProtocol {
    func getFeedPosts() async throws -> [Domain.Post.Model.Post]
    func getUserPosts(uid: String) async throws -> [Domain.Post.Model.Post]
    
    func postPostLike(postId: String, uid: String) async throws 
    func deletePostLike(postId: String, uid: String) async throws
}
