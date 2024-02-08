//
//  LoginViewModel.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @Published var errorMessage: String = "Too many requests. Try again later."
    @Published var showErrorMessage: Bool = true
    
    func signIn() async throws {
        await AuthService.shared.login(withEmail: email, password: password) { error in
            if let err = error {
                self.errorMessage = err.errorMessage()
                self.showErrorMessage = true
            }
        }
        
    }
}
