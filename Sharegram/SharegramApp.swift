//
//  SharegramApp.swift
//  Sharegram
//
//  Created by Lucas Hubert on 26/05/23.
//

import SwiftUI

@main
struct SharegramApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
