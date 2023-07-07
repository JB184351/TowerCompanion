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
//                        Text("\(run.scoutName)")
//                        Text("Total Score was: \(run.score)")
//                        Text("\(run.weapon.name)")
//                        
//                        ForEach(run.artifacts, id: \.self) { artifact in
//                            Text("\(artifact.name)")
//                        }
//                        
//                        ForEach(run.parasites, id: \.self) { parasite in
//                            Text("\(parasite.name)")
//                        }
//                        Text("Phase: \(run.phase)")
//                        Text("Room: \(run.room)")
                        Text("Overall Multiplier: \(run.multiplier.formatted())%")
                        Text("Average Multiplier: \(run.averageMultiplier.formatted())%")
                        Text("Highest Multiplier: \(run.highestMultiplier.formatted())%")
                        
                        ForEach(run.malfunctions, id: \.self) { malfunction in
                            Text("\(malfunction.malfunctionDescription)")
                            
                        }
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
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TowerRun.self)
}
