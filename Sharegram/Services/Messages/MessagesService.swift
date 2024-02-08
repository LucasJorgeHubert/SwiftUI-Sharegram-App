//
//  MessagesService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//
import Firebase
import SwiftUI
import Foundation

protocol MessagesServiceProtocol {
    func createNewChats(with chat: Chat) async throws
    func loadChats(completion: @escaping ([Chat], Error?) -> Void) async
    func sendMessage()
    func getMessages()
    func getLastMessage()
}

class MessagesService: MessagesServiceProtocol {
    
    private static let chatCollection = Firestore.firestore().collection("chat")
    private static let messagesCollection = Firestore.firestore().collection("messages")
    
    let dispatcher = APIDispatcher()
    
    func loadChats(completion: @escaping ([Chat], Error?) -> Void) async {
        do {
            let chats: [Chat] = try await dispatcher.getListObject(apiRouter: .getAllChats)
            completion(chats, nil)
        } catch {
            completion([], error)
        }
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

