//
//  DeleteLikeInPostUseCase.swift
//  Sharegram
//
//  Created by Lucas Hubert on 07/04/25.
//

import Foundation

extension Domain.Post.UseCase {
    public class DeleteLikeInPost {
        private let postRepository: PostRepositoryProtocol
        
        init(postRepository: PostRepositoryProtocol = DataSource.Post.RepositoryImpl()) {
            self.postRepository = postRepository
        }
        
        public func execute(postId: String) async throws {
            let user = AuthService.shared.currentUser?.id
            
            try await postRepository.deletePostLike(postId: postId, uid: user ?? "")
        }
    }
}
