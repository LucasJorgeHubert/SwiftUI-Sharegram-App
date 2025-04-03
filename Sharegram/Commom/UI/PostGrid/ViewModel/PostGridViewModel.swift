//
//  PostGridViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: Domain.User.Model.User
    @Published var posts: [Domain.Post.Model.Post] = []
    
    let postClient: PostRepositoryProtocol = DataSource.Post.RepositoryImpl(user: Domain.User.Model.User.MOCK_USERS[0])
    
    init(user: Domain.User.Model.User) {
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
