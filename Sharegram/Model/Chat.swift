//
//  Chat.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation

protocol ModelProtocol: Codable, Encodable {
    var id: String { get set }
}

struct Chat: Identifiable, Hashable, ModelProtocol {
    var id: String
    let fromId: String
    var fromUser: User?
    let toId: String
    var toUser: User?
    var messages: [Message]?
    var lastMessage: String?
    var hasUnread: Bool

}

extension Chat {
    static let MOCK_CHAT: [Chat] = [
        Chat(
            id: UUID().uuidString,
            fromId: User.MOCK_USERS[0].id,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[1],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: true
        ),
        Chat(
            id: UUID().uuidString,
            fromId: User.MOCK_USERS[0].id,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[2],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: false
        ),
        Chat(
            id: UUID().uuidString,
            fromId: User.MOCK_USERS[0].id,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[0],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: true
        ),
        Chat(
            id: UUID().uuidString,
            fromId: User.MOCK_USERS[0].id,
            fromUser: User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: User.MOCK_USERS[2],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: false
        ),
    ]
}
