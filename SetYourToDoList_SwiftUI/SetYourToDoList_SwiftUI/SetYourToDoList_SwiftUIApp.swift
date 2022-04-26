//
//  SetYourToDoList_SwiftUIApp.swift
//  SetYourToDoList_SwiftUI
//
//  Created by Jaehoon So on 2022/04/26.
//

import SwiftUI

@main
struct SetYourToDoList_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
