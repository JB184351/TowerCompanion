//
//  ContentView.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \TowerRun.dateCompleted, order: .reverse) private var towerRuns: [TowerRun]
    @State private var isSheetPresented = false
    
    init() {
        // Large Navigation Title
         UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(towerRuns) { run in
                    Section {
                        NavigationLink(destination: TowerRunDetailView(towerRun: run)) {
                            TowerRunHighlightView(towerRun: run)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let runToDelete = towerRuns[index]
                        modelContext.delete(runToDelete)
                    }
                })
            }
            .navigationTitle("TowerRuns")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isSheetPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                AddRunView(weapon: Weapon(name: "Dreadbound", altFire: AltFire(name: "Shieldbreaker", level: 3, altFireDescription: ""), traits: [Trait(name: "Expanding Shards", traitDescription: "", level: 3)], level: 45), artifacts: [Artifact(name: "", artifactDescription: "")], parasites: [Parasite(name: "", positiveDescription: "", negativeDescription: "")], malfunctions: [Malfunction(malfunctionDescription: "", conditionToRemove: "", malfunctionType: .normal)])
                    .modelContainer(for: TowerRun.self)
            }
            .scrollContentBackground(.hidden)
            .scrollIndicators(.automatic)
            .foregroundStyle(.white)
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TowerRun.self)
}
