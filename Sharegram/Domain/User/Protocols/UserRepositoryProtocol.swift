//
//  UserRepositoryProtocol.swift
//  Sharegram
//
//  Created by Lucas Hubert on 03/04/25.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUser(byId id: String) async throws -> Domain.User.Model.User
    func getAllUsers() async throws -> [Domain.User.Model.User]
}
