//
//  Chat.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation

public protocol ModelProtocol: Codable, Encodable {
    var id: String { get set }
}

struct Chat: Identifiable, Hashable, ModelProtocol {
    var id: String
    let fromId: String
    var fromUser: Domain.User.Model.User?
    let toId: String
    var toUser: Domain.User.Model.User?
    var messages: [Message]?
    var lastMessage: String?
    var hasUnread: Bool

}

extension Chat {
    static let MOCK_CHAT: [Chat] = [
        Chat(
            id: UUID().uuidString,
            fromId: Domain.User.Model.User.MOCK_USERS[0].id,
            fromUser: Domain.User.Model.User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: Domain.User.Model.User.MOCK_USERS[1],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: true
        ),
        Chat(
            id: UUID().uuidString,
            fromId: Domain.User.Model.User.MOCK_USERS[0].id,
            fromUser: Domain.User.Model.User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: Domain.User.Model.User.MOCK_USERS[2],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: false
        ),
        Chat(
            id: UUID().uuidString,
            fromId: Domain.User.Model.User.MOCK_USERS[0].id,
            fromUser: Domain.User.Model.User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: Domain.User.Model.User.MOCK_USERS[0],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: true
        ),
        Chat(
            id: UUID().uuidString,
            fromId: Domain.User.Model.User.MOCK_USERS[0].id,
            fromUser: Domain.User.Model.User.MOCK_USERS[0],
            toId: UUID().uuidString,
            toUser: Domain.User.Model.User.MOCK_USERS[2],
            messages: Message.MOCK_MESSAGES,
            lastMessage: "Última mensagem",
            hasUnread: false
        ),
    ]
}
