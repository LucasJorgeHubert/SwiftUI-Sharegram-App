//
//  Post.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, ModelProtocol {
    var id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static let postNumber = ["1", "2", "3", "4"]
    static var MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid:  UUID().uuidString,
            caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper.",
            likes: 8,
            imageURL: "Post-\(postNumber.randomElement() ?? "")",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid:  UUID().uuidString,
            caption: "Maecenas condimentum eu dui vitae.",
            likes: 3458,
            imageURL: "Post-\(postNumber.randomElement() ?? "")",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid:  UUID().uuidString,
            caption: "In hac habitasse platea dictumst. Nullam id quam.",
            likes: 245,
            imageURL: "Post-\(postNumber.randomElement() ?? "")",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid:  UUID().uuidString,
            caption: "Maecenas placerat ante quis diam.",
            likes: 45,
            imageURL: "Post-\(postNumber.randomElement() ?? "")",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
    ]
}
