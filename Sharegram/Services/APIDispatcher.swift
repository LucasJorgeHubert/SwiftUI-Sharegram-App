//
//  APIDispatcher.swift
//  Sharegram
//
//  Created by Lucas Hubert on 19/01/24.
//

import Foundation
import Firebase

class APIDispatcher {
    let firestore = Firestore.firestore()
    
    func getObjectWithParam<T: Codable>(apiRouter: APIRouter) async throws -> T {
        let collection = firestore.collection(apiRouter.path)
        let res = try await collection.document(apiRouter.param).getDocument()
        return try res.data(as: T.self)
    }
    
    func getListObject<T: Codable>(apiRouter: APIRouter) async throws -> [T] {
        let collection = firestore.collection(apiRouter.path)
        let res = try await collection.getDocuments()
        return try res.documents.compactMap { try $0.data(as: T.self) }
    }
    
    func getListObjectWithParameter<T: Codable>(apiRouter: APIRouter) async throws -> [T] {
        let collection = firestore.collection(apiRouter.path)
        let res = try await collection.whereField(apiRouter.field ?? "", isEqualTo: apiRouter.param).getDocuments()
        return try res.documents.compactMap { try $0.data(as: T.self) }
    }
    
    func createObject(apiRouter: APIRouter) async throws {
        let collection = firestore.collection(apiRouter.path)
        let document = collection.document()
        
        guard var obj: ModelProtocol = apiRouter.object else { return }
        obj.id = document.documentID
        
        guard let encoded = try? Firestore.Encoder().encode(obj) else { return }
        try? await document.setData(encoded)
    }
    
    func updateObject(apiRouter: APIRouter) async throws {
        guard let updatedObject = apiRouter.object else { return }
        let collection = firestore.collection(apiRouter.path)
        let document = collection.document(updatedObject.id)
        
        guard let encoded = try? Firestore.Encoder().encode(updatedObject) else { return }
        try? await document.updateData(encoded)
    }
    
}
