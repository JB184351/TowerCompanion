//
//  AddRunView.swift
//  TowerCompanion
//
//  Created by Justin on 6/23/23.
//

import SwiftUI

struct AddRunView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var scoutName = ""
    @State private var platform = "PS5"
    private let platforms = ["PS5", "PC"]
    
    @State var weapon: Weapon = Weapon(name: "Modified Sidearm SD-M8", altFire: AltFire(name: "Blast Shell", level: 1, altFireDescription: "Lobs a grenade-light projectile that explodes on contact with an enemy, or after enough time has passed."), traits: [], level: 1)
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
    @State private var phase = 1
    @State private var room = 1
    
    // Date
    @State private var dateStarted = Date.now
    @State private var dateCompleted = Date.now
    
    enum FocusField {
        case int, dec
    }
    
    @FocusState private var textFieldFocus: FocusField?
    
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
        NavigationStack {
            VStack {
                Form {
                    // MARK: - Scoutname
                    Section(header: Text("Enter Scout Details")) {
                        TextField("Enter Scout Name", text: $scoutName)
                        Picker("Select Platform", selection: $platform) {
                            ForEach(platforms, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                    }
                    
                    // MARK: - Weapon
                    Section {
                        AddWeaponView(weapon: $weapon)
                    } header: {
                        Text("Add Weapon Details")
                    }
                    
                    // MARK: - Artifact View
                    Section {
                        AddArtifactsView(artifacts: $artifacts)
                    } header: {
                        Text("Add Aritfacts (Can Add Up To 15)")
                    }
                    
                    
                    // MARK: - Parasites
                    Section {
                        AddParasitesView(parasites: $parasites)
                    } header: {
                        Text("Add Parasite(s) (Can Add Up to 5)")
                    }
                    
                    // MARK: - Stats
                    Section {
                        Stepper("Weapon Damage \(weaponDamageStat.formatted())%", value: $weaponDamageStat, in: -150...150, step: 5)
                        Stepper("Protection \(protectionStat.formatted())%", value: $protectionStat, in: -150...150, step: 5)
                        Stepper("Repair Efficiency \(repairEffiency.formatted())%", value: $repairEffiency, in: -150...150, step: 5)
                        Stepper("Alt-Fire Cooldown \(altFireCooldown.formatted()) seconds", value: $altFireCooldown, in: -30...30, step: 5)
                        Stepper("Profiency Rate \(proficiencyRate.formatted())%", value: $proficiencyRate, in: -150...150, step: 5)
                        
                    } header: {
                        Text("Enter Stat Details")
                    }
                    
                    // MARK: - Malfunctions
                    Section(header: Text("Enter Malfunction Details")) {
                        AddMalfunctionsView(malfunctions: $malfunctions)
                    }
                    
                    // MARK: - Score
                    Section {
                        TextField("Score", value: $score, formatter: numberFormatter)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($score)
                    } header: {
                        Text("Enter Your Score")
                    }
                    
                    // MARK: - Phase and Room
                    Section {
                        TextField("Phase", value: $phase, formatter: percentFormatter)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($score)
                        Picker("Room", selection: $room) {
                            ForEach(1..<21) {
                                Text(String($0)).tag($0)
                            }
                        }
                    } header: {
                        Text("Enter Phase and Room Details")
                    }
                    
                    // MARK: - Multipliers
                    Section {
                        Text("Enter average multplier")
                        TextField("Average Multiplier", value: $averageMutliplier, formatter: percentFormatter)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($averageMutliplier, includeDecimal: true)
                        
                        Text("Enter highest multiplier")
                        TextField("Highest Multiplier", value: $highestMultplier, formatter: percentFormatter)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($highestMultplier, includeDecimal: true)
                        
                        Text("Enter final multiplier")
                        TextField("Final Mutliplier", value: $finalMultiplier, formatter: percentFormatter)
                            .focused($textFieldFocus, equals: .int)
                            .numbersOnly($finalMultiplier, includeDecimal: true)
                    } header: {
                        Text("Enter Multiplier Details")
                    }
                    
                    // MARK: - Combat/Explorer/Skill/Objectives
                    Section {
                        NavigationLink("Add Combat", destination: AddCombatValuesView(combatValues: $combatValues))
                        NavigationLink("Add Explorer", destination: AddExplorerValuesView(explorerValues: $explorerValues))
                        NavigationLink("Add Skill", destination: AddSkillValuesView(skillValues: $skillValues))
                        NavigationLink("Add Objectives", destination: AddObjectivesValueView(objectiveValues: $objectiveValues))
                    } header: {
                        Text("Add Post Death Values")
                    }
                    
                    // MARK: - Date started
                    Section {
                        DatePicker("", selection: $dateStarted)
                            .labelsHidden()
                    } header: {
                        Text("Enter Start Run Date/Time")
                    }
                    
                    
                    // MARK: - Date completed
                    Section {
                        DatePicker("", selection: $dateCompleted)
                            .labelsHidden()
                    } header: {
                        Text("Enter End Run Date/Time")
                    }
                    
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Add") {
                        addTowerRun()
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
        }
    }
    
    func addTowerRun() {
        let stats = Stats(weaponDamage: weaponDamageStat, protection: protectionStat, proficiencyRate: proficiencyRate, repairEfficiency: repairEffiency, altFireCoolDown: altFireCooldown)
        
        let towerRun = TowerRun(scoutName: scoutName, weapon: weapon, artifacts: artifacts, parasites: parasites, stats: stats, malfunctions: malfunctions, score: score, multiplier: finalMultiplier, averageMultiplier: averageMutliplier, highestMultplier: highestMultplier, phase: phase, room: room, platform: platform, combat: combatValues, explorer: explorerValues, skill: skillValues, objectives: objectiveValues, dateStarted: dateStarted, dateCompleted: dateCompleted)

        modelContext.insert(towerRun)
    }
}

//#Preview {
//    AddRunView(weapon: Weapon(name: "Dreadbound", altFire: AltFire(name: "Shieldbreaker", level: 3, altFireDescription: ""), traits: [Trait(name: "Expanding Shards", traitDescription: "", level: 3)], level: 45), artifacts: [Artifact(name: "", artifactDescription: "")], parasites: [Parasite(name: "", positiveDescription: "", negativeDescription: "")], malfunctions: [Malfunction(malfunctionDescription: "", conditionToRemove: "", malfunctionType: .normal)])
//        .modelContainer(for: TowerRun.self)
//}
