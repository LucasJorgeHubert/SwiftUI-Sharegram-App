//
//  FeedViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/09/23.
//

import Foundation
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts: [Domain.Post.Model.Post] = []
    
    @Published var isLoading: Bool = true
    
    var getFeedPostsUseCase: Domain.Post.UseCase.GetPosts
    
    init(getFeedPostsUseCase: Domain.Post.UseCase.GetPosts = Domain.Post.UseCase.GetPosts()) {
        self.getFeedPostsUseCase = getFeedPostsUseCase
        Task {
            try await fetchPosts()
            self.isLoading = false
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await getFeedPostsUseCase.execute()
    }
}
