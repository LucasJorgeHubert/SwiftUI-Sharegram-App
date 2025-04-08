//
//  PostLikeInPostUseCASE.swift
//  Sharegram
//
//  Created by Lucas Hubert on 07/04/25.
//

import Foundation

extension Domain.Post.UseCase {
    public class PostLikeInPost {
        private let postRepository: PostRepositoryProtocol
        
        init(postRepository: PostRepositoryProtocol = DataSource.Post.RepositoryImpl()) {
            self.postRepository = postRepository
        }
        
        public func execute(postId: String) async throws {
            let user = AuthService.shared.currentUser?.id
            
            try await postRepository.postPostLike(postId: postId, uid: user ?? "")
        }
    }
}
