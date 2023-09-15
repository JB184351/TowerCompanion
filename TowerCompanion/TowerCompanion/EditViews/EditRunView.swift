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
    @State private var score = 0
    @State private var finalMultiplier = 0.0
    @State private var averageMutliplier = 0.0
    @State private var highestMultplier = 0.0
    @State private var multiplierTooHighAlert = false
    
    // Phase and Room
    @State private var phase = 1
    @State private var room = 1
    
    // Date
    @State private var dateStarted = Date.now
    @State private var dateCompleted = Date.now
    
    @FocusState private var textFieldFocus: Bool
    
    let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol = ""
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section(header: Text("Enter Scout Details")) {
                        TextField(towerRun.scoutName.isEmpty ? "Enter Scout Name" : towerRun.scoutName, text: $scoutName)
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
                        Text("Add Weapon Details")
                    }
                    
                    // MARK: - Artifact View
                    Section {
                        EditArtifactsView(artifacts: $artifacts)
                    } header: {
                        Text("Add Aritfacts (Can Add Up To 15)")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        EditParasitesView(parasites: $parasites)
                    } header: {
                        Text("Add Parasite(s) (Can Add Up to 5)")
                    }
                    
                    // MARK: - Stats
                    Section {
                        Stepper("Weapon Damage \(weaponDamageStat.formatted())%", value: $weaponDamageStat, in: -150...150, step: 5)
                        Stepper("Protection \(protectionStat.formatted())%", value: $protectionStat, in: -150...150, step: 5)
                        Stepper("Repair Effiency \(repairEffiency.formatted())%", value: $repairEffiency, in: -150...150, step: 5)
                        Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted()) seconds", value: $altFireCooldown, in: -150...150, step: 5)
                        Stepper("Profiency Rate \(proficiencyRate.formatted())%", value: $proficiencyRate, in: -150...150, step: 5)
                        
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section(header: Text("Enter Malfunction Details")) {
                        EditMalfunctionsView(malfunctions: $malfunctions)
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", value: $score, formatter: numberFormatter)
                            .keyboardType(.numberPad)
                            .focused($textFieldFocus)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", value: $phase, formatter: percentFormatter)
                            .keyboardType(.numberPad)
                            .focused($textFieldFocus)
                        Picker(towerRun.room == 1 ? "Room" : "\(towerRun.room)", selection: $room) {
                            ForEach(1..<21) {
                                Text(String($0)).tag($0)
                            }
                        }
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        TextField("Average Multiplier", value: $averageMutliplier, formatter: percentFormatter)
                            .keyboardType(.decimalPad)
                            .focused($textFieldFocus)
                            .onChange(of: averageMutliplier) { oldValue, newValue in
                                if newValue > 100.00 || newValue < 1.00 {
                                    multiplierTooHighAlert = true
                                    averageMutliplier = 0.0
                                }
                            }
                            .alert("Only 0% to 100% is allowed", isPresented: $multiplierTooHighAlert) {
                                Button("OK", role: .none) { }
                            }
                        
                        TextField("Highest Multiplier", value: $highestMultplier, formatter: percentFormatter)
                            .keyboardType(.decimalPad)
                            .focused($textFieldFocus)
                            .onChange(of: highestMultplier) { oldValue, newValue in
                                if newValue > 100.00 || newValue < 1.00 {
                                    multiplierTooHighAlert = true
                                    highestMultplier = 0.0
                                }
                            }
                            .alert("Only 0% to 100% is allowed", isPresented: $multiplierTooHighAlert) {
                                Button("OK", role: .none) { }
                            }
                        
                        TextField("Final Mutliplier", value: $finalMultiplier, formatter: percentFormatter)
                            .keyboardType(.decimalPad)
                            .focused($textFieldFocus)
                            .onChange(of: finalMultiplier) { oldValue, newValue in
                                if newValue > 100.00 || newValue < 1.00 {
                                    multiplierTooHighAlert = true
                                    finalMultiplier = 0.0
                                }
                            }
                            .alert("Only 0% to 100% is allowed", isPresented: $multiplierTooHighAlert) {
                                Button("OK", role: .none) { }
                            }
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Combat/Explorer/Skill/Objectives
                    Section {
                        NavigationLink("Add Combat", destination: EditCombatValuesView(combatValues: $combatValues))
                        NavigationLink("Add Explorer", destination: AddExplorerValuesView(explorerValues: $explorerValues))
                        NavigationLink("Add Skill", destination: AddSkillValuesView(skillValues: $skillValues))
                        NavigationLink("Add Objectives", destination: AddObjectivesValueView(objectiveValues: $objectiveValues))
                    } header: {
                        Text("Add Post Death Values")
                    }
                    
                    // MARK: - Date Started
                    Section {
                        DatePicker("", selection: $dateStarted)
                            .labelsHidden()
                    } header: {
                        Text("Enter Start Run Date/Time")
                    }
                    
                    
                    // MARK: - Date Completed
                    Section {
                        DatePicker("", selection: $dateCompleted)
                            .labelsHidden()
                    } header: {
                        Text("Enter End Run Date/Time")
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
                    Button("Done") {
                        textFieldFocus = false
                    }
                }
            }
            .onAppear {
                updateEditView()
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
        repairEffiency = towerRun.stats.repairEffiency
        altFireCooldown = towerRun.stats.altFireCoolDown
        
        if let malfunctions = towerRun.malfunctions {
            self.malfunctions = malfunctions
        }
        
        score = towerRun.score
        finalMultiplier = towerRun.finalMultiplier
        averageMutliplier = towerRun.averageMultiplier
        highestMultplier = towerRun.highestMultiplier
        phase = towerRun.phase
        room = towerRun.room
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
        let stats = Stats(weaponDamage: weaponDamageStat, protection: protectionStat, proficiencyRate: proficiencyRate, repairEffiency: repairEffiency, altFireCoolDown: altFireCooldown)
        
        towerRun.scoutName = scoutName
        towerRun.weapon = weapon
        towerRun.artifacts = artifacts
        towerRun.parasites = parasites
        towerRun.stats = stats
        towerRun.malfunctions = malfunctions
        towerRun.score = score
        towerRun.finalMultiplier = finalMultiplier
        towerRun.averageMultiplier = averageMutliplier
        towerRun.highestMultiplier = highestMultplier
        towerRun.phase = phase
        towerRun.room = room
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
