//
//  UserAPIRouter.swift
//  Sharegram
//
//  Created by Lucas Hubert on 03/04/25.
//

import Foundation

extension DataSource.User {
    public enum APIRouter: APIRouterProtocol {
        case getUserById(userId: String)
        case getAllUser
        case updateUser(updatedUser: Domain.User.Model.User)
        
        var field: String? {
            switch self {
            case .getUserById,
                    .getAllUser,
                    .updateUser:
                return nil
            }
        }
        
        var param: String {
            switch self {
            case .getUserById(let userId):
                return userId
            case .getAllUser,
                    .updateUser:
                return ""
            }
        }
        
        var path: String {
            switch self {
            case .getUserById,
                    .getAllUser,
                    .updateUser:
                return "users"
            }
        }
        
        public var object: ModelProtocol? {
            switch self {
                case .updateUser(let updatedUser):
                    return updatedUser
                default:
                    return nil
            }
        }
        
    }
}
