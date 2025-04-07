import Foundation
import Firebase

protocol APIDispatcherProtocol {
    func getObjectWithParam<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T
    func getListObject<T: Codable>(apiRouter: APIRouterProtocol) async throws -> [T]
    func getListObjectWithParameter<T: Codable>(apiRouter: APIRouterProtocol) async throws -> [T]
    func createObject(apiRouter: APIRouterProtocol) async throws
    func updateObject(apiRouter: APIRouterProtocol) async throws
}

extension DataSource {
    
    class APIDispatcher: APIDispatcherProtocol {
        let firestore = Firestore.firestore()
        
        func getObjectWithParam<T: Codable>(apiRouter: APIRouterProtocol) async throws -> T {
            let collection = firestore.collection(apiRouter.path)
            let res = try await collection.document(apiRouter.param).getDocument()
            return try res.data(as: T.self)
        }
        
        func getListObject<T: Codable>(apiRouter: APIRouterProtocol) async throws -> [T] {
            let collection = firestore.collection(apiRouter.path)
            let res = try await collection.getDocuments()
            return try res.documents.compactMap { try $0.data(as: T.self) }
        }
        
        func getListObjectWithParameter<T: Codable>(apiRouter: APIRouterProtocol) async throws -> [T] {
            let collection = firestore.collection(apiRouter.path)
            let res = try await collection.whereField(apiRouter.field ?? "", isEqualTo: apiRouter.param).getDocuments()
            return try res.documents.compactMap { try $0.data(as: T.self) }
        }
        
        func createObject(apiRouter: APIRouterProtocol) async throws {
            let collection = firestore.collection(apiRouter.path)
            let document = collection.document()
            
            guard var obj: ModelProtocol = apiRouter.object else { return }
            obj.id = document.documentID
            
            guard let encoded = try? Firestore.Encoder().encode(obj) else { return }
            try? await document.setData(encoded)
        }
        
        func updateObject(apiRouter: APIRouterProtocol) async throws {
            guard let updatedObject = apiRouter.object else { return }
            let collection = firestore.collection(apiRouter.path)
            let document = collection.document(updatedObject.id)
            
            guard let encoded = try? Firestore.Encoder().encode(updatedObject) else { return }
            try? await document.updateData(encoded)
        }
        
        func updateObjectParameters(with params: [String: Any], apiRouter: APIRouterProtocol) async throws {
            let collection = firestore.collection(apiRouter.path)
            let document = collection.document(apiRouter.param)
            
            try params.forEach {
                do {
                    try document.updateData([$0.key: $0.value])
                } catch {
                    throw NetworkError.encodingParams("Error updating document: \(error) / param: \($0.key) - value: \($0.value)")
                }
            }
        }
    }
}

enum NetworkError: Error {
    case badURL
    case requestFailed(statusCode: Int)
    case decodingFailed
    case unknown(Error)
    case encodingParams(String)
}
