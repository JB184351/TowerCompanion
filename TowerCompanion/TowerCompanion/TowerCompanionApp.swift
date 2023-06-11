//
//  TowerCompanionApp.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import SwiftUI
import SwiftData

@main
struct TowerCompanionApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
