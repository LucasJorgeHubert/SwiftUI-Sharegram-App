//
//  MessagesService.swift
//  Sharegram
//
//  Created by Lucas Hubert on 12/10/23.
//
import Firebase

extension DataSource.Chat{
    
    public struct ChatRepositoryImpl: ChatRepositoryProtocol {
        
        private static let chatCollection = Firestore.firestore().collection("chat")
        private static let messagesCollection = Firestore.firestore().collection("messages")
        
        let dispatcher: APIDispatcherProtocol
        
        init(dispatcher: APIDispatcherProtocol = DataSource.APIDispatcher()) {
            self.dispatcher = dispatcher
        }
        
        func getChats() async throws -> [Domain.Chat.Model.Chat] {
            let chats: [Domain.Chat.Model.Chat] = try await dispatcher.getListObject(apiRouter: DataSource.Chat.APIRouter.getAllChats)
            
            return chats
        }
        
        func createNewChats(with chat: Domain.Chat.Model.Chat) async throws {
            try? await dispatcher.createObject(apiRouter: DataSource.Chat.APIRouter.createChat(object: chat))
        }
        
        func sendMessage() {
            
        }
        
        func getMessages() {
            
        }
        
        func getLastMessage() {
            
        }
    }
}
