//
//  MessageAPIRouter.swift
//  Sharegram
//
//  Created by Lucas Hubert on 03/04/25.
//

import Foundation

extension DataSource.Chat {
    public enum APIRouter: APIRouterProtocol {
        case createChat(object: ModelProtocol)
        case getAllChats
        case getChat(chatId: String)
        
        var object: ModelProtocol? {
            switch self {
                    
                case .getAllChats,
                        .getChat:
                    return nil
                case .createChat(let object):
                    return object
                    
            }
        }
        
        var path: String {
            switch self {
                case .getAllChats,
                        .getChat,
                        .createChat:
                    return "chat"
            }
        }
        
        var field: String? {
            switch self {
                case .getAllChats,
                        .getChat,
                        .createChat:
                    return nil
            }
        }
        
        var param: String {
            switch self {
                case.getAllChats,
                        .createChat:
                    return ""
                case .getChat(let chatId):
                    return chatId
            }
        }
    }
}
