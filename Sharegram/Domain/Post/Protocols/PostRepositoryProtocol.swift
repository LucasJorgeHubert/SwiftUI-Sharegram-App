//
//  PostRepositoryProtocol.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/04/25.
//

import Foundation

public protocol PostRepositoryProtocol {
    func fetchFeedPosts() async throws -> [Domain.Post.Model.Post]
    func fetchUserPosts(uid: String) async throws -> [Domain.Post.Model.Post]
}
