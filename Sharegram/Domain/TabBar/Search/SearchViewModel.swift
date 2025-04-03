//
//  SearchViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [Domain.User.Model.User] = [Domain.User.Model.User]()
    @Published var searchText: String = ""
    
    var userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol = DataSource.User.RepositoryImpl()) {
        self.userRepository = userRepository
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await userRepository.getAllUsers()
    }
    
    func filteredUsers() -> [Domain.User.Model.User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.username.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
