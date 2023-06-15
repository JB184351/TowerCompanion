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
    
    @FocusState var focus: Bool
    
    // MARK: - Scout Name and Platform Selection
    @State private var scoutName = ""
    @State private var platform = ""
    private var platforms = ["PS5", "PC"]
    
    // Weapon Related Variables
    @State private var weapon = ""
    @State private var altFireName = ""
    @State private var altFireLevel = 0
    
    // Artifacts
    @State private var artifactName = ""
    @State private var artifactDescription = ""
    
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
    @State private var malfunctionDescription = ""
    @State private var malfunctionRemoveCondition = ""
    
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
                        Picker("Select Platform", selection: $platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0)
                            }
                        }
                    } header: {
                        Text("Enter Scout Name")
                    }
                    
                    // MARK: - Weapon and weapon details
                    Section {
                        TextField("Weapon Name", text: $weapon)
                        TextField("Weapon Level", text: $weapon)
                        TextField("Weapon Alt-Fire", text: $altFireName)
                        
                        Picker("Weapon Alt-Fire Level", selection: $altFireLevel) {
                            ForEach(1..<4) {
                                Text("\($0)")
                            }
                        }
    
                        TextField("Weapon Trait", text: $weapon)
                        TextField("Weapon Trait", text: $weapon)
                        TextField("Weapon Trait", text: $weapon)
                    } header: {
                        Text("Enter Weapon Details")
                    }
                    
                    // MARK: - Artifacts
                    Section {
                        TextField("Artifact Name", text: $artifactName)
                        TextField("Artifact Description", text: $artifactDescription)
                    } header: {
                        Text("Enter Artifact Description")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        TextField("Parasite Name", text: $parasite)
                        TextField("Parasite Positive Effect", text: $parasite)
                        TextField("Parasite Negative Effect", text: $parasite)
                    } header: {
                        Text("Enter Parasite Details")
                    }
                    
                    // MARK: - Stats
                    Section {
                        TextField("Weapon Damage", value: $weaponDamageStat, format: .percent)
                        TextField("Protection", value: $protectionStat, format: .percent)
                        TextField("Profiency Rate", value: $profiencyRate, format: .percent)
                        TextField("Repair Effiency", value: $repairEffiency, format: .percent)
                        TextField("Alt-Fire Cooldown", value: $altFireCooldown, format: .percent)
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section {
                        TextField("Malfunction Description", text: $malfunctionDescription)
                        TextField("Malfunction Remove Condition", text: $malfunctionRemoveCondition)
                    } header: {
                        Text("Enter Malfunction Details")
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", value: $score, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        TextField("Mutliplier", value: $multiplier, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Average Multiplier", value: $averageMutliplier, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", value: $phase, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Room", value: $room, format: .number)
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
            .navigationTitle("Tower Run")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
