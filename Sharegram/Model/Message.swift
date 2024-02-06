//
//  Message.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation
import Firebase

struct Message: Identifiable, Hashable, ModelProtocol {
    var id: String
    let message: String
    let ownerId: String
    let read: Bool
    let timestamp: Timestamp
}

extension Message {
    static let MOCK_MESSAGES: [Message] = [
        Message(id: UUID().uuidString, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ownerId: User.MOCK_USERS[0].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Nam ullamcorper bibendum aliquet.", ownerId: User.MOCK_USERS[1].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Sed eu interdum velit. Duis purus lectus, finibus vitae rutrum vel, efficitur malesuada lorem. Vivamus quis aliquam ipsum, ac bibendum leo.", ownerId: User.MOCK_USERS[0].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Vivamus semper metus in mi facilisis posuere.", ownerId: User.MOCK_USERS[0].id, read: false, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ownerId: User.MOCK_USERS[0].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Nam ullamcorper bibendum aliquet.", ownerId: User.MOCK_USERS[1].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Sed eu interdum velit. Duis purus lectus, finibus vitae rutrum vel, efficitur malesuada lorem. Vivamus quis aliquam ipsum, ac bibendum leo.", ownerId: User.MOCK_USERS[0].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Vivamus semper metus in mi facilisis posuere.", ownerId: User.MOCK_USERS[0].id, read: false, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ownerId: User.MOCK_USERS[0].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Nam ullamcorper bibendum aliquet.", ownerId: User.MOCK_USERS[1].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Sed eu interdum velit. Duis purus lectus, finibus vitae rutrum vel, efficitur malesuada lorem. Vivamus quis aliquam ipsum, ac bibendum leo.", ownerId: User.MOCK_USERS[0].id, read: true, timestamp: Timestamp()),
        Message(id: UUID().uuidString, message: "Vivamus semper metus in mi facilisis posuere.", ownerId: User.MOCK_USERS[0].id, read: false, timestamp: Timestamp())
    ]
}
