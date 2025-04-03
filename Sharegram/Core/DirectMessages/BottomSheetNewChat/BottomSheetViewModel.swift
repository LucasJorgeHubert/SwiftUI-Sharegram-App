//
//  BottomSheetViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 11/01/24.
//

import Foundation
import SwiftUI

class BottomSheetViewModel: ObservableObject {
    
    var messageService: ChatRepositoryProtocol = DataSource.Chat.ChatRepositoryImpl()
    var userClient: UserRepositoryProtocol = DataSource.User.RepositoryImpl()
    
    @Published var users: [Domain.User.Model.User] = [Domain.User.Model.User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await userClient.getAllUsers()
        self.users.removeAll { $0.isCurrentUser }
    }
    
    func newChat(to: Domain.User.Model.User) async throws {
        guard let from = AuthService.shared.currentUser else { return }
        let chat: Domain.Chat.Model.Chat = Domain.Chat.Model.Chat(id: "", fromId: from.id, toId: to.id, hasUnread: false)
        
        try? await messageService.createNewChats(with: chat)
    }
}
