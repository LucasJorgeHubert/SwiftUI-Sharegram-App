//
//  AuthFile.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/08/23.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
