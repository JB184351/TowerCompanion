//
//  ContentView.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TowerRun.dateCompleted, order: .reverse) private var towerRuns: [TowerRun]
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(towerRuns, id: \.id) { run in
                    Section {
                        TowerRunHighlightView(towerRun: run)
                    }
                }
            }
            .navigationTitle("TowerRuns")
            .toolbar {
                Button {
                    isSheetPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                AddRunView(weapon: Weapon(name: "Dreadbound", altFire: AltFire(name: "Shieldbreaker", level: 3, altFireDescription: ""), traits: [Trait(name: "Expanding Shards", traitDescription: "", level: 3)], level: 45), artifacts: [Artifact(name: "", artifactDescription: "")], parasites: [Parasite(name: "", positiveDescription: "", negativeDescription: "")], malfunctions: [Malfunction(malfunctionDescription: "", conditionToRemove: "")])
                    .modelContainer(for: TowerRun.self)
            }
            .scrollContentBackground(.hidden)
            .scrollIndicators(.automatic)
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TowerRun.self)
}
