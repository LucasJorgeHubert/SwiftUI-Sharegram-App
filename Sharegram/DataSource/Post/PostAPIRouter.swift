//
//  PostAPIRouter.swift
//  Sharegram
//
//  Created by Lucas Hubert on 02/04/25.
//

import Foundation

extension DataSource.Post {
    enum APIRouter: APIRouterProtocol {
        case getAllPosts
        case getPostByUser(userId: String)
        
        var field: String? {
            switch self {
                case .getPostByUser:
                    return "ownerUid"
                default:
                    return nil
            }
        }
        
        var param: String {
            switch self {
            case .getAllPosts:
                return ""
            case .getPostByUser(let userId):
                return userId
            }
        }
        
        var path: String { return "posts" }
        
        
        var object: ModelProtocol? { return nil }
        
    }
}
