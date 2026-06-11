//
//  TowerCompanionApp.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import SwiftUI
import SwiftData
import OSLog

@main
struct TowerCompanionApp: App {
    @StateObject private var store = TipStore()
    
    private static let logger = Logger(subsystem: "com.justinbengtson.TowerCompanion", category: "SwiftData")
    private static let cloudKitContainerIdentifier = "iCloud.com.justinbengtson.TowerCompanion"
    
    let modelContainer: ModelContainer
    
    init() {
        do {
            let configuration = ModelConfiguration(
                schema: Schema([TowerRun.self]),
                cloudKitDatabase: .private(Self.cloudKitContainerIdentifier)
            )
            modelContainer = try ModelContainer(for: TowerRun.self, configurations: configuration)
            Self.logger.info("ModelContainer initialized with CloudKit private database \(Self.cloudKitContainerIdentifier, privacy: .public)")
        } catch {
            Self.logger.error("Failed to initialize ModelContainer with CloudKit: \(error.localizedDescription, privacy: .public)")
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(modelContainer)
        .environment(store)
    }
}
