//
//  APIRouter+Path.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/02/24.
//

import Foundation

extension APIRouter {
    var path: String {
        switch self {
        case .getUserById,
                .getAllUser,
                .updateUser:
            return "users"
        case .getAllChats,
                .getChat,
                .createChat:
            return "chat"
        case .getAllPosts,
                .getPostByUser:
            return "posts"
        }
    }
}
