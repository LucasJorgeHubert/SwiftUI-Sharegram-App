//
//  MessagesService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//
import Firebase
import SwiftUI

protocol MessagesServiceProtocol {
    func getChats() async throws -> [Chat]
    func createNewChats(with chat: Chat) async throws
    func sendMessage()
    func getMessages()
    func getLastMessage()
}

class MessagesService: MessagesServiceProtocol {
    
    private static let chatCollection = Firestore.firestore().collection("chat")
    private static let messagesCollection = Firestore.firestore().collection("messages")
    
    let dispatcher = APIDispatcher()
    
    func getChats() async throws -> [Chat] {
        let chats: [Chat] = try await dispatcher.getListObject(apiRouter: .getAllChats)
        
        return chats
    }
    
    func createNewChats(with chat: Chat) async throws {
        try? await dispatcher.createObject(apiRouter: .createChat(object: chat))
    }
    
    func sendMessage() {
        
    }
    
    func getMessages() {
        
    }
    
    func getLastMessage() {
        
    }
}

