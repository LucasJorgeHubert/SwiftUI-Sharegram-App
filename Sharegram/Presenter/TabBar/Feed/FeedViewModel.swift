//
//  FeedViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/09/23.
//

import Foundation
import Firebase

extension Presenter.TabBar.Feed {
    
    @MainActor
    class ViewModel: ObservableObject {
        @Published var posts: [Domain.Post.Model.Post] = []
        
        @Published var isLoading: Bool = true
        
        var getFeedPostsUseCase: Domain.Post.UseCase.GetPosts
        var postLikeInPostsUseCase: Domain.Post.UseCase.PostLikeInPost
        var deleteLikeInPostsUseCase: Domain.Post.UseCase.DeleteLikeInPost
        
        init(
            getFeedPostsUseCase: Domain.Post.UseCase.GetPosts = Domain.Post.UseCase.GetPosts(),
            postLikeInPostsUseCase: Domain.Post.UseCase.PostLikeInPost = Domain.Post.UseCase.PostLikeInPost(),
            deleteLikeInPostsUseCase: Domain.Post.UseCase.DeleteLikeInPost = Domain.Post.UseCase.DeleteLikeInPost()
        ) {
            self.getFeedPostsUseCase = getFeedPostsUseCase
            self.postLikeInPostsUseCase = postLikeInPostsUseCase
            self.deleteLikeInPostsUseCase = deleteLikeInPostsUseCase
            
            Task {
                try await fetchPosts()
                self.isLoading = false
            }
        }
        
        @MainActor
        func fetchPosts() async throws {
            self.posts = try await getFeedPostsUseCase.execute()
        }
        
        func likePost(postId: String) async throws {
            try await postLikeInPostsUseCase.execute(postId: postId)
        }
        
        func removeLikePost(postId: String) async throws {
            try await deleteLikeInPostsUseCase.execute(postId: postId)
        }
    }
}
