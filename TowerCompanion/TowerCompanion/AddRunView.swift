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

    private let platforms = ["PS5", "PC"]
    
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
                        TextField("Weapon Damage", value: $towerRun.stats[0].weaponDamage, format: .percent)
                        TextField("Protection", value: $towerRun.stats[1].protection, format: .percent)
                        TextField("Profiency Rate", value: $towerRun.stats[2].profiencyRate, format: .percent)
                        TextField("Repair Effiency", value: $towerRun.stats[3].repairEffiency, format: .percent)
                        TextField("Alt-Fire Cooldown", value: $towerRun.stats[4].altFireCoolDown, format: .percent)
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section {
                        TextField("Malfunction Description", text: $towerRun.malfunctions[0].malfunctionDescription)
                        TextField("Malfunction Remove Condition", text: $towerRun.malfunctions[0].conditionToRemove)
                    } header: {
                        Text("Enter Malfunction Details")
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", value: $towerRun.score, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        TextField("Mutliplier", value: $towerRun.multiplier, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Average Multiplier", value: $towerRun.averageMultiplier, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", value: $towerRun.phase, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Room", value: $towerRun.room, format: .number)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // MARK: - Date completed
                    Section {
                        DatePicker("", selection: $towerRun.dateCompleted)
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
