//
//  PetrolApp.swift
//  Petrol
//
//  Created by Ben Wheeler on 22/4/2022.
//

import SwiftUI

@main
struct PetrolApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
