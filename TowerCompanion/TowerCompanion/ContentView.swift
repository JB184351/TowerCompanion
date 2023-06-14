//
//  ContentView.swift
//  TowerCompanion
//
//  Created by Justin on 6/10/23.
//

import SwiftUI
import SwiftData

/*
 var scoutName: String?
 var weapon: Weapon?
 var artifacts: [String]?
 var parasites: [Parasite]?
 var augments: [String]?
 var stats: [String]?
 var malfunctions: [Malfunction]?
 var score: Int?
 var multiplier: Double?
 var averageMultiplier: Double?
 var phase: Int?
 var room: Int?
 var dateCompleted: Date?
 */

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var towerRuns: [TowerRun]
    
    @State private var scoutName = ""
    @State private var weapon = ""
    @State private var artificats = ""
    @State private var parasites = ""
    @State private var stats = ""
    @State private var malfunctions = ""
    @State private var score = 0
    @State private var multiplier = 0.0
    @State private var averageMutliplier = 0.0
    @State private var phase = 0
    @State private var room = 0
    @State private var dateCompleted = Date.now
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // ScoutName
                    Section {
                        TextField("Enter Scout Name", text: $scoutName)
                    } header: {
                        Text("Enter Scoutname")
                    }
                    
                    // Weapon and weapon details
                    Section {
                        TextField("Enter Weapon Name", text: $weapon)
                        TextField("Enter Weapon Level", text: $weapon)
                        TextField("Enter Weapon Alt-Fire", text: $weapon)
                        TextField("Enter Weapon Alt-Fire Level", text: $weapon)
                        TextField("Enter Weapon Traits and their levels", text: $weapon)
                    } header: {
                        Text("Enter Weapon Details")
                    }
                    
                    
                    // Parasites
                    Section {
                        TextField("Enter Parasites", text: $parasites)
                        TextField("Enter Parasites", text: $parasites)
                        TextField("Enter Parasites", text: $parasites)
                        TextField("Enter Parasites", text: $parasites)
                        TextField("Enter Parasites", text: $parasites)
                    } header: {
                        Text("Enter Parasite Details")
                    }
                    
                    // Stats
                    Section {
                        TextField("Enter Weapon Damage", text: $parasites)
                        TextField("Enter Protection", text: $parasites)
                        TextField("Enter Profiency Rate", text: $parasites)
                        TextField("Enter Repair Effiency", text: $parasites)
                        TextField("Enter Alt-Fire Cooldown", text: $parasites)
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    
                    // Malfunctions
                    Section {
                        TextField("Enter Parasites", text: $parasites)
                    } header: {
                        Text("Enter Malfunction Details")
                    }
                    
                    // Score
                    Section {
                        TextField("Enter Score", value: $score, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // Multipliers
                    Section {
                        TextField("Enter Mutliplier", value: $multiplier, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Enter Average Multiplier", value: $averageMutliplier, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // Phase and Room
                    Section {
                        TextField("Enter Phase", value: $phase, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Enter Room", value: $room, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // Date completed
                    Section {
                        DatePicker("", selection: $dateCompleted)
                            .labelsHidden()
                    } header: {
                        Text("Enter The Date and Time Information")
                    }
                }
            }
            .navigationTitle("TowerRun")
        }
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
