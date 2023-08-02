//
//  RegistrationViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, username: username)
    }
}
