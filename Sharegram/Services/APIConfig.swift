//
//  APIConfig.swift
//  Sharegram
//
//  Created by Lucas Hubert on 07/02/24.
//

import Foundation

class AppConfig {
    static var useMockedData: Bool = ProcessInfo.processInfo.environment["MOCK"] == "true"
}
