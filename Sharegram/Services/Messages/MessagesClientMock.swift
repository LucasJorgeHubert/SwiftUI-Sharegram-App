//
//  MessagesClientMock.swift
//  Sharegram
//
//  Created by Lucas Hubert on 07/02/24.
//

import Foundation

class MessagesClientMock: MessagesServiceProtocol {
    func loadChats(completion: @escaping ([Chat], Error?) -> Void) async {
        completion(Chat.MOCK_CHAT, nil)
    }
    
    func createNewChats(with chat: Chat) async throws {
        
    }
    
    func sendMessage() {
        
    }
    
    func getMessages() {
        
    }
    
    func getLastMessage() {
        
    }
}
