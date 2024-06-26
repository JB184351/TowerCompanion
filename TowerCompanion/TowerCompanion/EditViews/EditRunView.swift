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
    var towerRun: TowerRun

    @State private var scoutName = ""
    @State private var platform = "PS5"
    private let platforms = ["PS5", "PC"]
    
    @State var weapon: Weapon = Weapon(name: "", altFire: AltFire(name: "", level: 1, altFireDescription: ""), traits: [], level: 1)
    @State var artifacts: [Artifact] = []
    @State var parasites: [Parasite] = []
    @State var malfunctions: [Malfunction] = []
    @State var combatValues: Combat?
    @State var explorerValues: Explorer?
    @State var skillValues: Skill?
    @State var objectiveValues: Objectives?
    
    // Stats
    @State private var weaponDamageStat = 0.0
    @State private var protectionStat = 0.0
    @State private var proficiencyRate = 0.0
    @State private var repairEffiency = 0.0
    @State private var altFireCooldown = 0.0
    
    // Score Related Variables
    @State private var score = "0"
    @State private var finalMultiplier = "0.0"
    @State private var averageMutliplier = "0.0"
    @State private var highestMultplier = "0.0"
    @State private var multiplierTooHighAlert = false
    
    // Phase and Room
    @State private var phase = "1"
    @State private var room = "1"
    
    // Date
    @State private var dateStarted = Date.now
    @State private var dateCompleted = Date.now
    
    @State private var isFirstAppearance = true
    
    @FocusState private var textFieldFocus: FocusField?
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section(header: Text("Edit Scout Details")) {
                        TextField(towerRun.scoutName.isEmpty ? "Enter Scout Name" : towerRun.scoutName, text: $scoutName)
                            .focused($textFieldFocus, equals: .text)
                        Picker("Select Platform", selection: $platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    }
                    
                    // MARK: - Weapon
                    Section {
                        EditWeaponView(weapon: $weapon)
                    } header: {
                        Text("Edit Weapon Details")
                    }
                    
                    // MARK: - Artifact View
                    Section {
                        EditArtifactsView(artifacts: $artifacts)
                    } header: {
                        Text("Edit Aritfacts (Can Add Up To 15)")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        EditParasitesView(parasites: $parasites)
                    } header: {
                        Text("Edit Parasite(s) (Can Add Up to 5)")
                    }
                    
                    // MARK: - Stats
                    Section {
                        Stepper("Weapon Damage \(weaponDamageStat.formatted())%", value: $weaponDamageStat, in: -150...150, step: 5)
                        Stepper("Protection \(protectionStat.formatted())%", value: $protectionStat, in: -150...150, step: 5)
                        Stepper("Repair Effiency \(repairEffiency.formatted())%", value: $repairEffiency, in: -150...150, step: 5)
                        Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted()) seconds", value: $altFireCooldown, in: -150...150, step: 5)
                        Stepper("Profiency Rate \(proficiencyRate.formatted())%", value: $proficiencyRate, in: -150...150, step: 5)
                        
                    } header: {
                        Text("Edit Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section(header: Text("Enter Malfunction Details")) {
                        EditMalfunctionsView(malfunctions: $malfunctions)
                            .focused($textFieldFocus, equals: .text)
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", text: $score)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($score)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                    } header: {
                        Text("Edit Your Score")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", text: $phase)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($phase)
                            .onAppear {
                                UITextField.appearance().clearButtonMode = .whileEditing
                            }
                        Picker("Room", selection: $room) {
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
                            TextField("Average Multiplier", text: $averageMutliplier)
                                .focused($textFieldFocus, equals: .dec)
                                .numbersOnly($averageMutliplier, includeDecimal: true)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                }
                        } header: {
                            Text("Average Multiplier")
                        }
                        
                        Section {
                            TextField("Highest Multiplier", text: $highestMultplier)
                                .focused($textFieldFocus, equals: .dec)
                                .numbersOnly($highestMultplier, includeDecimal: true)
                                .onAppear {
                                    UITextField.appearance().clearButtonMode = .whileEditing
                                }
                        } header: {
                            Text("Highest Multiplier")
                        }
                        
                        
                        Section {
                            TextField("Final Mutliplier", text: $finalMultiplier)
                                .focused($textFieldFocus, equals: .dec)
                                .numbersOnly($finalMultiplier, includeDecimal: true)
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
                        NavigationLink("Edit Combat", destination: EditCombatValuesView(combatValues: $combatValues))
                        NavigationLink("Edit Explorer", destination: EditExplorerValuesView(explorerValues: $explorerValues))
                        NavigationLink("Edit Skill", destination: EditSkillValuesView(skillValues: $skillValues))
                        NavigationLink("Edit Objectives", destination: EditObjectivesValuesView(objectiveValues: $objectiveValues))
                    } header: {
                        Text("Edit Post Death Values")
                    }
                    
                    // MARK: - Date Started
                    Section {
                        DatePicker("", selection: $dateStarted)
                            .labelsHidden()
                    } header: {
                        Text("Edit Start Run Date/Time")
                    }
                    
                    
                    // MARK: - Date Completed
                    Section {
                        DatePicker("", selection: $dateCompleted)
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
                        updateTowerRun()
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
                    updateEditView()
                    isFirstAppearance = false
                } else {
                    updateTowerRun()
                }
            }
        }
    }
    
    private func updateEditView() {
        scoutName = towerRun.scoutName
        weapon = towerRun.weapon
        
        if let artifacts = towerRun.artifacts {
            self.artifacts = artifacts
        }
        
        if let parasites = towerRun.parasites {
            self.parasites = parasites
        }
        
        weaponDamageStat = towerRun.stats.weaponDamage
        protectionStat = towerRun.stats.protection
        proficiencyRate = towerRun.stats.proficiencyRate
        repairEffiency = towerRun.stats.repairEfficiency
        altFireCooldown = towerRun.stats.altFireCoolDown
        
        if let malfunctions = towerRun.malfunctions {
            self.malfunctions = malfunctions
        }
        
        score = String(towerRun.score)
        finalMultiplier = String(towerRun.finalMultiplier)
        averageMutliplier = String(towerRun.averageMultiplier)
        highestMultplier = String(towerRun.highestMultiplier)
        phase = String(towerRun.phase)
        room = String(towerRun.room)
        platform = towerRun.platform
        
        if let combat = towerRun.combat {
            combatValues = combat
        }
        
        if let explorer = towerRun.explorer {
            explorerValues = explorer
        }
        
        if let skill = towerRun.skill {
            skillValues = skill
        }
        
        if let objectives = towerRun.objectives {
            objectiveValues = objectives
        }
        
        dateStarted = towerRun.dateStarted
        dateCompleted = towerRun.dateCompleted
    }
    
    private func updateTowerRun() {
        let stats = Stats(weaponDamage: weaponDamageStat, protection: protectionStat, proficiencyRate: proficiencyRate, repairEfficiency: repairEffiency, altFireCoolDown: altFireCooldown)
        
        towerRun.scoutName = scoutName
        towerRun.weapon = weapon
        towerRun.artifacts = artifacts
        towerRun.parasites = parasites
        towerRun.stats = stats
        towerRun.malfunctions = malfunctions
        towerRun.score = Int(score) ?? 0
        towerRun.finalMultiplier = Double(finalMultiplier) ?? 0.0
        towerRun.averageMultiplier = Double(averageMutliplier) ?? 0.0
        towerRun.highestMultiplier = Double(highestMultplier) ?? 0.0
        towerRun.phase = Int(phase) ?? 0
        towerRun.room = Int(room) ?? 0
        towerRun.platform = platform
        towerRun.combat = combatValues
        towerRun.explorer = explorerValues
        towerRun.skill = skillValues
        towerRun.objectives = objectiveValues
        towerRun.dateStarted = dateStarted
        towerRun.dateCompleted = dateCompleted
    }
}

//#Preview {
//    AddRunView(towerRun: <#TowerRun#>)
//        .modelContainer(for: TowerRun.self)
//}
