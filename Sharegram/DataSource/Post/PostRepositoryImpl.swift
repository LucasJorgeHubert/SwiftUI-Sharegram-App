//
//  PstsService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 28/09/23.
//

import Firebase
import Foundation
import UIKit

extension DataSource.Post {
    
    public class RepositoryImpl: PostRepositoryProtocol {
        
        let firestore: Firestore
        let collection: CollectionReference
        
        init() {
            self.firestore = Firestore.firestore()
            self.collection = firestore.collection("posts")
        }
        
        // MARK: - Get
        func getFeedPosts() async throws -> [Domain.Post.Model.Post]{
            do {
                let docs = try await collection.getDocuments()
                return docs.documents.compactMap { try? $0.data(as: Domain.Post.Model.Post.self) }
            } catch {
                print(error)
                throw PostError.loadPosts
            }
            
        }
        
        func getUserPosts(uid: String) async throws -> [Domain.Post.Model.Post] {
            do {
                let docs = try await collection.whereField("ownerUid", isEqualTo: uid).getDocuments()
                return docs.documents.compactMap { try? $0.data(as: Domain.Post.Model.Post.self) }
            } catch {
                print(error)
                throw PostError.loadUserPosts
            }
            
        }
        
        // MARK: - Post
        
        func postImagePost(postImage: UIImage) async throws -> String {
            guard let imageURL = try await DataSource.Post.ImageUploader.uploadImage(image: postImage) else {
                throw PostError.imageUpload
            }
            return imageURL
        }
        
        func postNewPost(post: Domain.Post.Model.Post) async throws {
            let postRef = collection.document()
            var newPost = post
            newPost.id = postRef.documentID
            
            do {
                guard let encodedPost = try? Firestore.Encoder().encode(newPost) else { return }
                try await postRef.setData(encodedPost)
            } catch {
                print(error)
                throw PostError.postNewPost
            }
        }
        
        func postPostLike(postId: String, uid: String) async throws {
            do {
                try await collection.document(postId).updateData(
                    [
                        "likesCount": FieldValue.increment(Int64(1)),
                        "likesUids": FieldValue.arrayUnion([uid])
                    ]
                )
            } catch {
                print(error)
                throw PostError.postLike
            }
            
        }
        
        // MARK: - Delete
        func deletePostLike(postId: String, uid: String) async throws {
            do {
                try await collection.document(postId).updateData(
                    [
                        "likesCount": FieldValue.increment(Int64(-1)),
                        "likesUids": FieldValue.arrayRemove([uid])
                    ]
                )
            } catch {
                print(error)
                throw PostError.postUnlike
            }
        }
    }
}

extension DataSource.Post {
    enum PostError: Error {
        case unknown
        case imageUpload
        case imageDownload
        case postNewPost
        case loadPosts
        case loadUserPosts
        case postLike
        case postUnlike
        
        var description: String {
            switch self {
            case .unknown:
                return "Unknown error"
            case .imageUpload:
                return "Failed to upload image"
            case .imageDownload:
                return "Failed to download image"
            case .loadPosts:
                return "Failed to load posts"
            case .loadUserPosts:
                return "Failed to load user posts"
            case .postLike:
                return "Failed to like post"
            case .postUnlike:
                return "Failed to unlike post"
            case .postNewPost:
                return "Failed to create post"
            }
        }
    }
}
