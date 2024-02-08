//
//  ChatViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chats = [Chat]()
    @Published var popupMessage: String = ""
    @Published var showPopup: Bool = false
    
    private let messageService: MessagesServiceProtocol = AppConfig.useMockedData ? MessagesClientMock() : MessagesService()
    
    init() {
        Task { try await fetchChats() }
    }
    
    func fetchChats() async throws {
        await messageService.loadChats(completion: { chats, err in
            if err != nil {
                self.popupMessage = err?.localizedDescription ?? ""
                self.showPopup.toggle()
                return
            }
            
            self.chats = chats
        })
    }
}
