//
//  Message.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation

struct Message: Identifiable, Hashable, Codable {
    let id: String
    let message: String
    let ownerId: String
    let read: Bool
}

extension Message {
    static let MOCK_MESSAGES: [Message] = [
        Message(id: UUID().uuidString, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", ownerId: UUID().uuidString, read: true),
        Message(id: UUID().uuidString, message: "Nam ullamcorper bibendum aliquet.", ownerId: UUID().uuidString, read: true),
        Message(id: UUID().uuidString, message: "Sed eu interdum velit. Duis purus lectus, finibus vitae rutrum vel, efficitur malesuada lorem. Vivamus quis aliquam ipsum, ac bibendum leo.", ownerId: UUID().uuidString, read: true),
        Message(id: UUID().uuidString, message: "Vivamus semper metus in mi facilisis posuere.", ownerId: UUID().uuidString, read: false),
    ]
}
