//
//  AddRunView.swift
//  TowerCompanion
//
//  Created by Justin on 6/21/23.
//

import SwiftUI

struct EditRunView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var towerRun: TowerRun

//    @Binding var scoutName: String
//    @Binding var platform: String
      private let platforms = ["PS5", "PC"]
    
//    @Binding var weapon: Weapon
//    @Binding var artifacts: [Artifact]
//    @Binding var parasites: [Parasite]
//    @Binding var malfunctions: [Malfunction]
//    @Binding var combatValues: Combat?
//    @Binding var explorerValues: Explorer?
//    @Binding var skillValues: Skill?
//    @Binding var objectiveValues: Objectives?
//    
//    // Stats
//    @Binding var weaponDamageStat: Double
//    @Binding var protectionStat: Double
//    @Binding var proficiencyRate: Double
//    @Binding var repairEffiency: Double
//    @Binding var altFireCooldown: Double
//    
//    // Score Related Variables
//    @Binding var score: String
//    @Binding var finalMultiplier: String
//    @Binding var averageMutliplier: String
//    @Binding var highestMultplier: String
//    @Binding var multiplierTooHighAlert: Bool
//    
//    // Phase and Room
//    @State var phase: String
//    @State var room: String
//    
//    // Date
//    @Binding var dateStarted: Date
//    @Binding var dateCompleted: Date
    
    @State private var isFirstAppearance = true
    
    @FocusState private var textFieldFocus: FocusField?
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section(header: Text("Edit Scout Details")) {
                        TextField(towerRun.scoutName.isEmpty ? "Enter Scout Name" : towerRun.scoutName, text: $towerRun.scoutName)
                            .focused($textFieldFocus, equals: .text)
                        Picker("Select Platform", selection: $towerRun.platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    }
                    
                    // MARK: - Weapon
                    Section {
                        EditWeaponView(weapon: $towerRun.weapon)
                    } header: {
                        Text("Edit Weapon Details")
                    }
                    
                    // MARK: - Artifact View
                    Section {
                        EditArtifactsView(artifacts: $towerRun.artifacts)
                    } header: {
                        Text("Edit Aritfacts (Can Add Up To 15)")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        EditParasitesView(parasites: Binding(
                            get: { towerRun.parasites ?? [] },
                            set: { towerRun.parasites = $0 }
                        ))
                    } header: {
                        Text("Edit Parasite(s) (Can Add Up to 5)")
                    }
                    
                    // MARK: - Stats
                    Section {
                        Stepper("Weapon Damage \(towerRun.stats.weaponDamage.formatted())%", value: $towerRun.stats.weaponDamage, in: -150...150, step: 5)
                        Stepper("Protection \(towerRun.stats.protection.formatted())%", value: $towerRun.stats.protection, in: -150...150, step: 5)
                        Stepper("Repair Effiency \(towerRun.stats.repairEfficiency.formatted())%", value: $towerRun.stats.repairEfficiency, in: -150...150, step: 5)
                        Stepper("Alt-Fire Cooldown \(towerRun.stats.altFireCoolDown.formatted()) seconds", value: $towerRun.stats.altFireCoolDown, in: -150...150, step: 5)
                        Stepper("Profiency Rate \(towerRun.stats.proficiencyRate.formatted())%", value: $towerRun.stats.proficiencyRate, in: -150...150, step: 5)
                        
                    } header: {
                        Text("Edit Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section(header: Text("Enter Malfunction Details")) {
                        EditMalfunctionsView(malfunctions: Binding(
                            get: { towerRun.malfunctions ?? [] },
                            set: { towerRun.malfunctions = $0 }
                        ))
                            .focused($textFieldFocus, equals: .text)
                    }
                    
                    // MARK: - Score
                    Section {
                        let scoreBinding = Binding<String>(
                            get: { String(towerRun.score) },
                            set: { towerRun.score = Int($0) ?? towerRun.score }
                        )
                        TextField("Score", text: scoreBinding)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly(scoreBinding)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                    } header: {
                        Text("Edit Your Score")
                    }

                    // MARK: - Phase and Room
                    Section {
                        let phaseBinding = Binding<String>(
                            get: { String(towerRun.phase) },
                            set: { towerRun.phase = Int($0) ?? towerRun.phase }
                        )
                        TextField("Phase", text: phaseBinding)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly(phaseBinding)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                        Picker("Room", selection: $towerRun.room) {
                            ForEach(1..<21) {
                                Text(String($0)).tag($0)
                            }
                        }
                    } header: {
                        Text("Edit Phase and Room Details")
                    }

                    // MARK: - Multipliers
                    Section {
                        Section {
                            let avgBinding = Binding<String>(
                                get: { String(towerRun.averageMultiplier) },
                                set: { towerRun.averageMultiplier = Double($0) ?? towerRun.averageMultiplier }
                            )
                            TextField("Average Multiplier", text: avgBinding)
                                .focused($textFieldFocus, equals: .dec)
                                .numbersOnly(avgBinding, includeDecimal: true)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                }
                        } header: {
                            Text("Average Multiplier")
                        }

                        Section {
                            let highBinding = Binding<String>(
                                get: { String(towerRun.highestMultiplier) },
                                set: { towerRun.highestMultiplier = Double($0) ?? towerRun.highestMultiplier }
                            )
                            TextField("Highest Multiplier", text: highBinding)
                                .focused($textFieldFocus, equals: .dec)
                                .numbersOnly(highBinding, includeDecimal: true)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                }
                        } header: {
                            Text("Highest Multiplier")
                        }


                        Section {
                            let finalBinding = Binding<String>(
                                get: { String(towerRun.finalMultiplier) },
                                set: { towerRun.finalMultiplier = Double($0) ?? towerRun.finalMultiplier }
                            )
                            TextField("Final Mutliplier", text: finalBinding)
                                .focused($textFieldFocus, equals: .dec)
                                .numbersOnly(finalBinding, includeDecimal: true)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                }
                        } header: {
                            Text("Final Multiplier")
                        }
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Combat/Explorer/Skill/Objectives
                    Section {
                        NavigationLink("Edit Combat", destination: EditCombatValuesView(combatValues: $towerRun.combat))
                        NavigationLink("Edit Explorer", destination: EditExplorerValuesView(explorerValues: $towerRun.explorer))
                        NavigationLink("Edit Skill", destination: EditSkillValuesView(skillValues: $towerRun.skill))
                        NavigationLink("Edit Objectives", destination: EditObjectivesValuesView(objectiveValues: $towerRun.objectives))
                    } header: {
                        Text("Edit Post Death Values")
                    }
                    
                    // MARK: - Date Started
                    Section {
                        DatePicker("", selection: $towerRun.dateStarted)
                            .labelsHidden()
                    } header: {
                        Text("Edit Start Run Date/Time")
                    }
                    
                    
                    // MARK: - Date Completed
                    Section {
                        DatePicker("", selection: $towerRun.dateCompleted)
                            .labelsHidden()
                    } header: {
                        Text("Edit End Run Date/Time")
                    }
                    
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Update") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        textFieldFocus = nil
                    }
                }
            }
            .onAppear {
                if isFirstAppearance {
//                    updateEditView()
                    isFirstAppearance = false
                } else {
//                    updateTowerRun()
                }
            }
        }
    }
    
//    private func updateEditView() {
//        scoutName = towerRun.scoutName
//        weapon = towerRun.weapon
//        
//        if let artifacts = towerRun.artifacts {
//            self.artifacts = artifacts
//        }
//        
//        if let parasites = towerRun.parasites {
//            self.parasites = parasites
//        }
//        
//        weaponDamageStat = towerRun.stats.weaponDamage
//        protectionStat = towerRun.stats.protection
//        proficiencyRate = towerRun.stats.proficiencyRate
//        repairEffiency = towerRun.stats.repairEfficiency
//        altFireCooldown = towerRun.stats.altFireCoolDown
//        
//        if let malfunctions = towerRun.malfunctions {
//            self.malfunctions = malfunctions
//        }
//        
//        score = String(towerRun.score)
//        finalMultiplier = String(towerRun.finalMultiplier)
//        averageMutliplier = String(towerRun.averageMultiplier)
//        highestMultplier = String(towerRun.highestMultiplier)
//        phase = String(towerRun.phase)
//        room = String(towerRun.room)
//        platform = towerRun.platform
//        
//        if let combat = towerRun.combat {
//            combatValues = combat
//        }
//        
//        if let explorer = towerRun.explorer {
//            explorerValues = explorer
//        }
//        
//        if let skill = towerRun.skill {
//            skillValues = skill
//        }
//        
//        if let objectives = towerRun.objectives {
//            objectiveValues = objectives
//        }
//        
//        dateStarted = towerRun.dateStarted
//        dateCompleted = towerRun.dateCompleted
//    }
//    
//    private func updateTowerRun() {
//        let stats = Stats(weaponDamage: weaponDamageStat, protection: protectionStat, proficiencyRate: proficiencyRate, repairEfficiency: repairEffiency, altFireCoolDown: altFireCooldown)
//        
//        towerRun.scoutName = scoutName
//        towerRun.weapon = weapon
//        towerRun.artifacts = artifacts
//        towerRun.parasites = parasites
//        towerRun.stats = stats
//        towerRun.malfunctions = malfunctions
//        towerRun.score = Int(score) ?? 0
//        towerRun.finalMultiplier = Double(finalMultiplier) ?? 0.0
//        towerRun.averageMultiplier = Double(averageMutliplier) ?? 0.0
//        towerRun.highestMultiplier = Double(highestMultplier) ?? 0.0
//        towerRun.phase = Int(phase) ?? 0
//        towerRun.room = Int(room) ?? 0
//        towerRun.platform = platform
//        towerRun.combat = combatValues
//        towerRun.explorer = explorerValues
//        towerRun.skill = skillValues
//        towerRun.objectives = objectiveValues
//        towerRun.dateStarted = dateStarted
//        towerRun.dateCompleted = dateCompleted
//    }
}

//#Preview {
//    AddRunView(towerRun: <#TowerRun#>)
//        .modelContainer(for: TowerRun.self)
//}
