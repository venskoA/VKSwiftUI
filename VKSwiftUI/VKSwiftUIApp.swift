//
//  VKSwiftUIApp.swift
//  VKSwiftUI
//
//  Created by Andrey Vensko on 25.05.22.
//

import SwiftUI

@main
struct VKSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
