//
//  PostNewPostUseCase.swift
//  Sharegram
//
//  Created by Lucas Hubert on 08/04/25.
//

import Foundation

extension Domain.Post.UseCase {
    public class PostNewPost {
        private let postRepository: PostRepositoryProtocol
        
        init(postRepository: PostRepositoryProtocol = DataSource.Post.RepositoryImpl()) {
            self.postRepository = postRepository
        }
        
        public func execute(post: Domain.Post.Model.Post) async throws {
            try await postRepository.postNewPost(post: post)
        }
    }
}
