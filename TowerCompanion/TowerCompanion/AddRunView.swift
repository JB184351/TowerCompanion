//
//  AddRunView.swift
//  TowerCompanion
//
//  Created by Justin on 6/21/23.
//

import SwiftUI

struct AddRunView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var towerRun: TowerRun
    
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
                        TextField("Enter Scout Name", text: $towerRun.scoutName)
                        Picker("Select Platform", selection: $towerRun.platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    } header: {
                        Text("Enter Scout Name")
                    }
                    
                    // MARK: - Weapon and weapon details
                    Section {
                        TextField("Weapon Name", text: $towerRun.weapon.name)
                        Picker("Weapon Level", selection: $towerRun.weapon.level) {
                            ForEach(1..<46) {
                                Text("\($0)").tag($0)
                            }
                        }
                        
                        
                        TextField("Weapon Alt-Fire", text: $towerRun.weapon.altFire.name)
                        
                        Picker("Weapon Alt-Fire Level", selection: $towerRun.weapon.altFire.level) {
                            ForEach(1..<4) {
                                Text("\($0)").tag($0)
                            }
                        }
                        
                        TextField("Weapon Trait", text: $towerRun.weapon.traits[0].name)
                        TextField("Weapon Trait", text: $towerRun.weapon.traits[1].name)
                        TextField("Weapon Trait", text: $towerRun.weapon.traits[2].name)
                        
                    } header: {
                        Text("Enter Weapon Details")
                    }
                    
                    // MARK: - Artifacts
                    Section {
                        TextField("Artifact Name", text: $towerRun.artifacts[0].name)
                        TextField("Artifact Description", text: $towerRun.artifacts[0].artifactDescription)
                    } header: {
                        Text("Enter Artifacts")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        TextField("Parasite Name", text: $towerRun.parasites[0].name)
                        TextField("Parasite Positive Effect", text: $towerRun.parasites[0].positiveDescription)
                        TextField("Parasite Negative Effect", text: $towerRun.parasites[0].negativeDescription)
                    } header: {
                        Text("Enter Parasite Details")
                    }
                    
                    // MARK: - Stats
                    Section {
                        TextField("Weapon Damage", value: $towerRun.stats[0], format: .text)
                        TextField("Protection", value: $towerRun.stats[1], format: .text)
                        TextField("Profiency Rate", value: $towerRun.stats[2], format: .text)
                        TextField("Repair Effiency", value: $towerRun.stats[3], format: .text)
                        TextField("Alt-Fire Cooldown", value: $towerRun.stats[4], format: .text)
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
        }
    }
}

//#Preview {
//    AddRunView(towerRun: TowerRun())
//}
