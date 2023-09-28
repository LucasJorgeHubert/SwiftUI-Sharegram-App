//
//  PstsService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Firebase

class PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post]{
        let snap = try await postCollection.getDocuments()
        var posts = try snap.documents.compactMap { try $0.data(as: Post.self) }
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snap = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snap.documents.compactMap { try $0.data(as: Post.self) }
    }
}
