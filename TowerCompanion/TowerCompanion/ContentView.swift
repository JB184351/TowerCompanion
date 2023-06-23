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
