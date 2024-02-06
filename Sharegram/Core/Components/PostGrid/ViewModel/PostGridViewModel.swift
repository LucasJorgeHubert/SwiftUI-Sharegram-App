//
//  PostGridViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    let postClient: PostClientProtocol = PostClient()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws{
        self.posts = try await postClient.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
