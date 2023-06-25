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
    @Query private var towerRuns: [TowerRun]
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(towerRuns, id: \.id) { run in
                    Text("\(run.scoutName)")
                    Text("Total Score was: \(run.score)")
                    Text("Phase: \(run.phase)")
                    Text("Room: \(run.room)")
                    Text("Multiplier: \(run.multiplier.formatted())%")
                    Text("Average Multiplier: \(run.averageMultiplier.formatted())%")
                    Text("Highest Multiplier: \(run.highestMultiplier.formatted())%")
                    Spacer()
                    Spacer()
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
                AddRunView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TowerRun.self)
}
