//
//  PostImagePostUseCase.swift
//  Sharegram
//
//  Created by Lucas Hubert on 08/04/25.
//

import Foundation
import UIKit

extension Domain.Post.UseCase {
    public class PostImagePost {
        private let postRepository: PostRepositoryProtocol
        
        init(postRepository: PostRepositoryProtocol = DataSource.Post.RepositoryImpl()) {
            self.postRepository = postRepository
        }
        
        public func execute(postImage: UIImage) async throws -> String {
            return try await postRepository.postImagePost(postImage: postImage)
        }
    }
}
