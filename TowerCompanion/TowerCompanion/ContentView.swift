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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(towerRuns) { run in
                    Section {
                        NavigationLink(destination: TowerRunDetailView(towerRun: run)) {
                            TowerRunHighlightView(towerRun: run)
                        }
                    }
                    .listRowBackground(Color.returnalDarkGreen)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let runToDelete = towerRuns[index]
                        modelContext.delete(runToDelete)
                    }
                })
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
