//
//  PstsService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Firebase
import Foundation

extension DataSource.Post {
    
    public class RepositoryImpl: PostRepositoryProtocol {
        
        let firestore: Firestore
        let collection: CollectionReference
        
        init() {
            self.firestore = Firestore.firestore()
            self.collection = firestore.collection("posts")
        }
        
        func getFeedPosts() async throws -> [Domain.Post.Model.Post]{
            let docs = try await collection.getDocuments()
            return docs.documents.compactMap { try? $0.data(as: Domain.Post.Model.Post.self) }
        }
        
        func getUserPosts(uid: String) async throws -> [Domain.Post.Model.Post] {
            let docs = try await collection.whereField("ownerUid", isEqualTo: uid).getDocuments()
            return docs.documents.compactMap { try? $0.data(as: Domain.Post.Model.Post.self) }
        }
        
        func postPostLike(postId: String, uid: String) async throws {
            let doc = try await collection.document(postId)
            try await doc.updateData(
                [
                    "likesCount": FieldValue.increment(Int64(1)),
                    "likesUids": FieldValue.arrayUnion([uid])
                ])
        }
        
        func deletePostLike(postId: String, uid: String) async throws {
            let doc = try await collection.document(postId)
            try await doc.updateData(
                [
                    "likesCount": FieldValue.increment(Int64(-1)),
                    "likesUids": FieldValue.arrayRemove([uid])
                ])
        }
    }
    
}
