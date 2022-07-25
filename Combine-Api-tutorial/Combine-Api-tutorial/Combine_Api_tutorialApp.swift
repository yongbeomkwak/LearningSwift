//
//  Combine_Api_tutorialApp.swift
//  Combine-Api-tutorial
//
//  Created by yongbeomkwak on 2022/07/25.
//

import SwiftUI

@main
struct Combine_Api_tutorialApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
