//
//  Post.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation
import Firebase

extension Domain.Post.Model {
    
    public struct Post: Identifiable, Hashable, ModelProtocol {
        public var id: String
        let ownerUid: String
        let caption: String
        var likesCount: Int
        var likesUids: [String]
        var comentsCount: Int
        var comentsUids: [String]
        var shareCounts: Int
        let imageURL: String
        let timestamp: Timestamp
        var user: Domain.User.Model.User?
        
        static let postNumber = ["1", "2", "3", "4"]
        static var MOCK_POSTS: [Post] = [
            .init(
                id: UUID().uuidString,
                ownerUid:  UUID().uuidString,
                caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper.",
                likesCount: 8,
                likesUids: [],
                comentsCount: 2,
                comentsUids: [],
                shareCounts: 4,
                imageURL: "Post-\(postNumber.randomElement() ?? "")",
                timestamp: Timestamp(),
                user: Domain.User.Model.User.MOCK_USERS[0]
            ),
            .init(
                id: UUID().uuidString,
                ownerUid:  UUID().uuidString,
                caption: "Maecenas condimentum eu dui vitae.",
                likesCount: 8,
                likesUids: [],
                comentsCount: 2,
                comentsUids: [],
                shareCounts: 4,
                imageURL: "Post-\(postNumber.randomElement() ?? "")",
                timestamp: Timestamp(),
                user: Domain.User.Model.User.MOCK_USERS[1]
            ),
            .init(
                id: UUID().uuidString,
                ownerUid:  UUID().uuidString,
                caption: "In hac habitasse platea dictumst. Nullam id quam.",
                likesCount: 8,
                likesUids: [],
                comentsCount: 2,
                comentsUids: [],
                shareCounts: 4,
                imageURL: "Post-\(postNumber.randomElement() ?? "")",
                timestamp: Timestamp(),
                user: Domain.User.Model.User.MOCK_USERS[2]
            ),
            .init(
                id: UUID().uuidString,
                ownerUid:  UUID().uuidString,
                caption: "Maecenas placerat ante quis diam.",
                likesCount: 8,
                likesUids: [],
                comentsCount: 2,
                comentsUids: [],
                shareCounts: 4,
                imageURL: "Post-\(postNumber.randomElement() ?? "")",
                timestamp: Timestamp(),
                user: Domain.User.Model.User.MOCK_USERS[0]
            ),
        ]
    }
}
