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
                        TextField("Enter Weapon Damage", value: $weaponDamageStat, format: .percent)
                        TextField("Enter Protection", value: $protectionStat, format: .percent)
                        TextField("Enter Profiency Rate", value: $profiencyRate, format: .percent)
                        TextField("Enter Repair Effiency", value: $repairEffiency, format: .percent)
                        TextField("Enter Alt-Fire Cooldown", value: $altFireCooldown, format: .percent)
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
            .navigationTitle("Tower Run")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
