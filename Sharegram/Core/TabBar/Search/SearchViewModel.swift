//
//  SearchViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    @Published var searchText: String = ""
    
    var userClient: UserClientProtocol = UserClient()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await userClient.getAllUsers()
    }
    
    func filteredUsers() -> [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.username.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
