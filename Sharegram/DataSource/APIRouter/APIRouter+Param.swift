//
//  APIRouter+Pah.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/02/24.
//

import Foundation

extension APIRouter {
    var param: String {
        switch self {
        case .getUserById(let userId):
            return userId
        case .getAllUser,
                .updateUser:
            return ""
        case.getAllChats,
                .getAllPosts,
                .createChat:
            return ""
        case .getChat(let chatId):
            return chatId
        case.getPostByUser(let userId):
            return userId
        }
    }
}
