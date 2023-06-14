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
    
    // Weapon Related Variables
    @State private var weapon = ""
    @State private var altFireName = ""
    @State private var altFireLevel = 0
    
    // Artifacts
    @State private var artificats = ""
    
    // Parasites
    @State private var parasite = ""
    @State private var parasitePositiveEffectDescription = ""
    @State private var parasiteNegativeEffectDescription = ""
    
    // Stats
    @State private var weaponDamageStat = 0.0
    @State private var protectionStat = 0.0
    @State private var profiencyRate = 0.0
    @State private var repairEffiency = 0.0
    @State private var altFireCooldown = 0.0
    
    // Malfunctions
    @State private var malfunctionName = ""
    
    // Score Related Variables
    @State private var score = 0
    @State private var multiplier = 0.0
    @State private var averageMutliplier = 0.0
    
    // Phase and Room
    @State private var phase = 0
    @State private var room = 0
    
    // Date
    @State private var dateCompleted = Date.now
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section {
                        TextField("Enter Scout Name", text: $scoutName)
                    } header: {
                        Text("Enter Scout Name")
                    }
                    
                    // MARK: - Weapon and weapon details
                    Section {
                        TextField("Enter Weapon Name", text: $weapon)
                        TextField("Enter Weapon Level", text: $weapon)
                        TextField("Enter Weapon Alt-Fire", text: $altFireName)
                        
                        Picker("Enter Weapon Alt-Fire Level", selection: $altFireLevel) {
                            ForEach(1..<4) {
                                Text("\($0)")
                            }
                        }
    
                        TextField("Enter Weapon Trait", text: $weapon)
                        TextField("Enter Weapon Trait", text: $weapon)
                        TextField("Enter Weapon Trait", text: $weapon)
                    } header: {
                        Text("Enter Weapon Details")
                    }
                    
                    // MARK: - Parasites
                    Section {
                        TextField("Enter Parasite Name", text: $parasite)
                        TextField("Enter Parasite Positive Effect", text: $parasite)
                        TextField("Enter Parasite Negative Effect", text: $parasite)
                    } header: {
                        Text("Enter Parasite Details")
                    }
                    
                    // MARK: - Stats
                    Section {
                        TextField("Enter Weapon Damage", text: $parasite)
                        TextField("Enter Protection", text: $parasite)
                        TextField("Enter Profiency Rate", text: $parasite)
                        TextField("Enter Repair Effiency", text: $parasite)
                        TextField("Enter Alt-Fire Cooldown", text: $parasite)
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    
                    // MARK: - Malfunctions
                    Section {
                        TextField("Enter Malfunctions", text: $malfunctionName)
                    } header: {
                        Text("Enter Malfunction Details")
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Enter Score", value: $score, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        TextField("Enter Mutliplier", value: $multiplier, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Enter Average Multiplier", value: $averageMutliplier, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Enter Phase", value: $phase, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Enter Room", value: $room, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // MARK: - Date completed
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
        .modelContainer(for: Item.self, inMemory: true)
}
