//
//  FeedViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 27/09/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    var postClient: PostClientProtocol = PostClient()
    
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
