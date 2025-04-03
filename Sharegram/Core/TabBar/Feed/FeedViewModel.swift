//
//  FeedViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/09/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts: [Domain.Post.Model.Post] = []
    
    var postClient: PostRepositoryProtocol = DataSource.Post.RepositoryImpl(user: Domain.User.Model.User.MOCK_USERS[0])
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await postClient.fetchFeedPosts()
    }
}
