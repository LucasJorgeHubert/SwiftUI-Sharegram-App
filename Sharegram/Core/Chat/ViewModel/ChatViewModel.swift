//
//  ChatViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var chats = [Chat]()
    
    init() {
        fetchChats()
    }
    
    func fetchChats() {
        self.chats = Chat.MOCK_CHAT
    }
}
