//
//  APIRouter+Object.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/02/24.
//

import Foundation

extension APIRouter {
    var object: ModelProtocol? {
        switch self {
        case .getUserById,
                .getAllUser:
            return nil
        case .updateUser(let updatedUser):
            return updatedUser
        case .getAllChats,
                .getChat:
            return nil
        case .createChat(let object):
            return object
        case .getAllPosts,
                .getPostByUser:
            return nil
        }
    }
}
