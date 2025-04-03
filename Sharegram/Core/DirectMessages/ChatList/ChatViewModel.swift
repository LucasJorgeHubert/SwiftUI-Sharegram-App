//
//  ChatViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chats = [Domain.Chat.Model.Chat]()
    
    private let messageService: ChatRepositoryProtocol = DataSource.Chat.ChatRepositoryImpl()
    
    init() {
        Task { try await fetchChats() }
    }
    
    func fetchChats() async throws {
        self.chats = try await messageService.getChats()
    }
}
