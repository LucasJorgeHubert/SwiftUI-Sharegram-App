//
//  PostRepositoryProtocol.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/04/25.
//

import Foundation
import UIKit

public protocol PostRepositoryProtocol {
    func getFeedPosts() async throws -> [Domain.Post.Model.Post]
    func getUserPosts(uid: String) async throws -> [Domain.Post.Model.Post]
    
    func postPostLike(postId: String, uid: String) async throws 
    func postNewPost(post: Domain.Post.Model.Post) async throws
    func postImagePost(postImage: UIImage) async throws -> String
    
    func deletePostLike(postId: String, uid: String) async throws
}
