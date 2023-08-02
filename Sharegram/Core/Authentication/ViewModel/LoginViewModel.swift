//
//  LoginViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
