//
//  APIRouter+Fields.swift
//  Sharegram
//
//  Created by Lucas Hubert on 05/02/24.
//

import Foundation

extension APIRouter {
    var field: String? {
        switch self {
        case .getUserById,
                .getAllUser,
                .getAllChats,
                .getChat,
                .createChat,
                .updateUser:
            return nil
        }
    }
}
