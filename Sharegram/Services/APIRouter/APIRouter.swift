//
//  APIRouter.swift
//  Sharegram
//
//  Created by Lucas Hubert on 19/01/24.
//

import Foundation

enum APIRouter {
    
    // MARK: - Posts
    case getAllPosts
    case getPostByUser(userId: String)
    
    // MARK: - Chats
    case createChat(object: ModelProtocol)
    case getAllChats
    case getChat(chatId: String)
    
    // MARK: - User
    case getUserById(userId: String)
    case getAllUser
    case updateUser(updatedUser: User)
    
}
