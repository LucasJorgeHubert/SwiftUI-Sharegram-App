//
//  Chat.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation
import Firebase

struct Chat: Identifiable, Hashable, Codable {
    let id: String
    let fromId: String
    var fromUser: User?
    let toId: String
    var toUser: User?
    var messages: [Message]?
    var lastMessage: String?
    var hasUnread: Bool
    let timestamp: Timestamp
}

extension Chat {
    static let MOCK_CHAT: [Chat] = [
        Chat(
            id: UUID().uuidString,
            fromId: UUID().uuidString,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[1],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: true,
            timestamp: Timestamp()
        ),
        Chat(
            id: UUID().uuidString,
            fromId: UUID().uuidString,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[1],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: false,
            timestamp: Timestamp()
        ),
        Chat(
            id: UUID().uuidString,
            fromId: UUID().uuidString,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[1],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: true,
            timestamp: Timestamp()
        ),
        Chat(
            id: UUID().uuidString,
            fromId: UUID().uuidString,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[1],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: false,
            timestamp: Timestamp()
        ),
    ]
}
