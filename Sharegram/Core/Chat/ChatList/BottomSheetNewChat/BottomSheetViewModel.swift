//
//  BottomSheetViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 11/01/24.
//

import Foundation
import SwiftUI

class BottomSheetViewModel: ObservableObject {
    
    var messageService: MessagesServiceProtocol = MessagesService()
    var userClient: UserClientProtocol = UserClient()
    
    @Published var users: [User] = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await userClient.getAllUsers()
        self.users.removeAll { $0.isCurrentUser }
    }
    
    func newChat(to: User) async throws {
        guard let from = AuthService.shared.currentUser else { return }
        let chat: Chat = Chat(id: "", fromId: from.id, toId: to.id, hasUnread: false)
        
        try? await messageService.createNewChats(with: chat)
    }
}
