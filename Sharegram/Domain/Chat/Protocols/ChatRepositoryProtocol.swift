//
//  ChatRepositoryProtocol.swift
//  Sharegram
//
//  Created by Lucas Hubert on 03/04/25.
//

import Foundation

protocol ChatRepositoryProtocol {
    func getChats() async throws -> [Domain.Chat.Model.Chat]
    func createNewChats(with chat: Domain.Chat.Model.Chat) async throws
    func sendMessage()
    func getMessages()
    func getLastMessage()
}
